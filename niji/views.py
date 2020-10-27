# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponseForbidden, HttpResponse
from django.core.urlresolvers import reverse
from django.core.mail import send_mail
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth import get_user_model
from django.conf import settings
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView
from django.utils.translation import ugettext as _
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required
from . import checkcode
from io import BytesIO
from .models import Topic, Node, Post, Notification, ForumAvatar, Announcement, EmailCode
from .forms import TopicForm, TopicEditForm, AppendixForm, ForumAvatarForm, ReplyForm
from .misc import get_query
import re
import random
import json

import os
import uuid
import datetime as dt

EMAIL_REGEX = re.compile(r"[^@]+@[^@]+\.[^@]+")
User = get_user_model()


def get_default_ordering():
    return getattr(
        settings,
        "NIJI_DEFAULT_TOPIC_ORDERING",
        "-last_replied"
    )


def get_topic_ordering(request):
    query_order = request.GET.get("order", "")
    if query_order in ["-last_replied", "last_replied", "pub_date", "-pub_date"]:
        return query_order
    return get_default_ordering()
def Product_Index(request):
    content={'site_name':'网络开拓者协会'}
    return render(request, 'niji/index.html',content)
# Create your views here.
class Index(ListView):
    model = Topic
    paginate_by = 20
    template_name = 'niji/forum.html'
    context_object_name = 'topics'

    def get_queryset(self):
        return Topic.objects.visible().select_related(
            'user', 'node'
        ).prefetch_related(
            'user__forum_avatar'
        ).order_by('-pub_date')
        # .order_by(
        #     *['order', get_topic_ordering(self.request)]
        # )[0:20]

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        context['panel_title'] = _('New Topics')
        context['title'] = _('Index')
        context['show_order'] = True
        return context


class NodeView(ListView):
    model = Topic
    paginate_by = 20
    template_name = 'niji/node.html'
    context_object_name = 'topics'

    def get_queryset(self):
        return Topic.objects.visible().filter(
            node__id=self.kwargs.get('pk')
        ).select_related(
            'user', 'node'
        ).prefetch_related(
            'user__forum_avatar'
        ).order_by(
            *['order', get_topic_ordering(self.request)]
        )

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        context['node'] = node = Node.objects.get(pk=self.kwargs.get('pk'))
        context['title'] = context['panel_title'] = node.title
        context['show_order'] = True
        return context


class TopicView(ListView):
    model = Post
    paginate_by = 20
    template_name = 'niji/topic.html'
    context_object_name = 'posts'

    def get_queryset(self):
        return Post.objects.visible().filter(
            topic_id=self.kwargs.get('pk')
        ).select_related(
            'user'
        ).prefetch_related(
            'user__forum_avatar'
        ).order_by('pub_date')

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        current = Topic.objects.visible().get(pk=self.kwargs.get('pk'))
        current.increase_view_count()
        context['topic'] = current
        context['title'] = context['topic'].title
        context['node'] = context['topic'].node
        context['form'] = ReplyForm()
        return context

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        current = Topic.objects.visible().get(pk=self.kwargs.get('pk'))
        if current.closed:
            return HttpResponseForbidden("Topic closed")
        topic_id = self.kwargs.get('pk')
        form = ReplyForm(
            request.POST,
            user=request.user,
            topic_id=topic_id
        )
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(
                reverse('niji:topic', kwargs={'pk': topic_id})
            )


class AnnouncementListView(ListView):
    model = Announcement
    paginate_by = 20
    template_name = 'niji/announcements.html'
    context_object_name = 'announcements'

    def get_queryset(self):
        return Announcement.objects.filter().order_by('-pub_date')

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        context['panel_title'] = _('New Topics')
        context['title'] = _('Index')
        context['show_order'] = True
        return context


class AnnouncementView(ListView):
    model = Post
    paginate_by = 20
    template_name = 'niji/announcement.html'
    context_object_name = 'posts'

    def get_queryset(self):
        return Post.objects.visible().filter(
            topic_id=self.kwargs.get('pk')
        ).select_related(
            'user'
        ).prefetch_related(
            'user__forum_avatar'
        ).order_by('pub_date')

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        current = Topic.objects.visible().get(pk=self.kwargs.get('pk'))
        announcement = Announcement.objects.get(pk=self.kwargs.get('pk'))
        announcement.increase_view_count()
        context['topic'] = current
        context['title'] = context['topic'].title
        context['node'] = context['topic'].node
        context['form'] = ReplyForm()
        context['announcement'] = announcement
        return context

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        current = Topic.objects.visible().get(pk=self.kwargs.get('pk'))
        if current.closed:
            return HttpResponseForbidden("Topic closed")
        topic_id = self.kwargs.get('pk')
        form = ReplyForm(
            request.POST,
            user=request.user,
            topic_id=topic_id
        )
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(
                reverse('niji:topic', kwargs={'pk': topic_id})
            )


def user_info(request, pk):
    u = User.objects.get(pk=pk)
    return render(request, 'niji/user_info.html', {
        'title': u.username,
        'user': u,
        'topics': u.topics.visible().select_related('node')[:10],
        'replies': u.posts.visible().select_related('topic', 'user').order_by('-pub_date')[:30],
    })


class UserTopics(ListView):
    model = Post
    paginate_by = 20
    template_name = 'niji/user_topics.html'
    context_object_name = 'topics'

    def get_queryset(self):
        return Topic.objects.filter()

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        context['user'] = User.objects.get(pk=self.kwargs.get('pk'))
        context['panel_title'] = context['title'] = context['user'].username
        return context


class SearchView(ListView):
    model = Topic
    paginate_by = 20
    template_name = 'niji/search.html'
    context_object_name = 'topics'

    def get_queryset(self):
        keywords = self.kwargs.get('keyword')
        query = get_query(keywords, ['title'])
        return Topic.objects.visible().filter(
            query
        ).select_related(
            'user', 'node'
        ).prefetch_related(
            'user__forum_avatar'
        ).order_by(
            get_topic_ordering(self.request)
        )

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        context['title'] = context['panel_title'] = _('Search: ') + self.kwargs.get('keyword')
        context['show_order'] = True
        return context


def search_redirect(request):
    if request.method == 'GET':
        keyword = request.GET.get('keyword')
        return HttpResponseRedirect(reverse('niji:search', kwargs={'keyword': keyword}))
    else:
        return HttpResponseForbidden('Post you cannot')


@login_required
def create_topic(request):
    if request.method == 'POST':
        form = TopicForm(request.POST, request.FILES, user=request.user)
        print('form')
        if form.is_valid():
            print('form valid')
            t = form.save()
            return HttpResponseRedirect(reverse('niji:topic', kwargs={'pk': t.pk}))
    else:
        form = TopicForm()

    return render(request, 'niji/create_topic.html', {'form': form, 'title': _('Create Topic')})


@login_required
def edit_topic(request, pk):
    topic = Topic.objects.get(pk=pk)
    if topic.reply_count > 0:
        return HttpResponseForbidden(_('Editing is not allowed when topic has been replied'))
    if not topic.user == request.user:
        return HttpResponseForbidden(_('You are not allowed to edit other\'s topic'))
    if request.method == 'POST':
        form = TopicEditForm(request.POST, instance=topic)
        if form.is_valid():
            t = form.save()
            return HttpResponseRedirect(reverse('niji:topic', kwargs={'pk': t.pk}))
    else:
        form = TopicEditForm(instance=topic)

    return render(request, 'niji/edit_topic.html', {'form': form, 'title': _('Edit Topic')})


@login_required
def create_appendix(request, pk):
    topic = Topic.objects.get(pk=pk)
    if not topic.user == request.user:
        return HttpResponseForbidden(_('You are not allowed to append other\'s topic'))
    if request.method == 'POST':
        form = AppendixForm(request.POST, topic=topic)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('niji:topic', kwargs={'pk': topic.pk}))
    else:
        form = AppendixForm()

    return render(request, 'niji/create_appendix.html', {
        'form': form, 'title': _('Create Appendix'), 'pk': pk
    })


@login_required
def upload_avatar(request):
    avatar = ForumAvatar.objects.filter(user_id=request.user.id).first()
    if request.method == 'POST':
        if avatar:
            form = ForumAvatarForm(request.POST, request.FILES, instance=avatar, user=request.user)
        else:
            form = ForumAvatarForm(request.POST, request.FILES, user=request.user)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('niji:index'))
    else:
        if avatar:
            form = ForumAvatarForm(instance=request.user.forum_avatar)
        else:
            form = ForumAvatarForm()

    return render(request, 'niji/upload_avatar.html', {'form': form, 'title': _('Upload Avatar')})


@login_required
def notification_view(request):
    notifications = request.user.received_notifications.all().order_by('-pub_date')
    Notification.objects.filter(to=request.user).update(read=True)
    return render(request, 'niji/notifications.html', {
        'title': _("Notifications"),
        'notifications': notifications,
    })


class NotificationView(ListView):

    model = Notification
    paginate_by = 20
    template_name = 'niji/notifications.html'
    context_object_name = 'notifications'

    def get_queryset(self):
        Notification.objects.filter(to=self.request.user).update(read=True)
        return Notification.objects.filter(
            to=self.request.user
        ).select_related(
            'sender', 'topic', 'post'
        ).prefetch_related(
            'sender__forum_avatar', 'post__topic'
        ).order_by('-pub_date')

    def get_context_data(self, **kwargs):
        context = super(ListView, self).get_context_data(**kwargs)
        context['title'] = _("Notifications")
        return context


def login_view(request):
    if request.method == "GET":
        return render(request, 'niji/login.html', {'title': _("Login")})
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        code = request.POST.get('code')
        valid = True
        if code.upper() == request.session.get('valid_code').upper():
            if not username or not password:
                valid = False
                messages.add_message(request, messages.INFO, _("用户名和密码不能为空！"))
            user = User.objects.filter(username=username).first()
            if not user:
                valid = False
                messages.add_message(request, messages.INFO, _("用户不存在！"))
            user = authenticate(username=username, password=password)
            if (user is not None) and valid:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse('niji:index'))
                else:
                    valid = False
                    messages.add_message(request, messages.INFO, _("User deactivated"))
            else:
                valid = False
                messages.add_message(request, messages.INFO, _("密码错误!"))
        else:
            valid = False
            messages.add_message(request, messages.INFO, _("验证码错误!"))
        if not valid:
            return HttpResponseRedirect(reverse("niji:login"))

def check_code(request):
    """
    获取验证码
    :param request:
    :return:
    """
    stream = BytesIO()
    # 生成图片 img、数字代码 code，保存在内存中，而不是 Django 项目中
    img, code = checkcode.create_validate_code()
    img.save(stream, 'PNG')

    # 写入 session
    request.session['valid_code'] = code
    print(code)
    return HttpResponse(stream.getvalue())
def findback_view(request):
    if request.method == "GET":
        return render(request, 'niji/findback.html', {'title': _("Login")})
    if request.method == "POST":
        email = request.POST.get("email")
        password = request.POST.get("password1")
        password2 = request.POST.get("password2")
        code = request.POST.get("code")
        valid = True
        user = User.objects.filter(email=email).first()
        # 如果用户不存在
        if not user:
            valid = False
            messages.add_message(request, messages.INFO, _("User does not exist"))
        if password != password2:
            valid = False
            messages.add_message(request, messages.INFO, _("Password error"))
        # 检查验证码是否正确
        emailcode = EmailCode.objects.filter(email=email).first()
        if not emailcode and code != emailcode.code:
            valid = False
            messages.add_message(request, messages.INFO, _("Invalid Code"))
        else:
            emailcode.delete()

        if (user is not None) and valid:
            user.set_password(password)
            user.save()
            return HttpResponseRedirect(reverse("niji:login"))
        else:
            return HttpResponseRedirect(reverse("niji:findback"))


def reg_view(request):
    if request.method == "GET":
        return render(request, 'niji/reg.html', {'title': _("Reg")})
    if request.method == "POST":
        username = request.POST.get("username")
        email = request.POST.get("email")
        password = request.POST.get("password1")
        password2 = request.POST.get("password2")
        code = request.POST.get("code")
        valid = True
        if User.objects.filter(username=username).exists():
            valid = False
            messages.add_message(request, messages.INFO, _("User already exists"))
        if password != password2:
            valid = False
            messages.add_message(request, messages.INFO, _("Password does not match"))
        if not EMAIL_REGEX.match(email):
            valid = False
            messages.add_message(request, messages.INFO, _("Invalid Email"))
        if User.objects.filter(email=email).exists():
            valid = False
            messages.add_message(request, messages.INFO, _("Email already used"))
        emailcode = EmailCode.objects.filter(email=email).first()
        if not emailcode and code != emailcode.code:
            valid = False
            messages.add_message(request, messages.INFO, _("Invalid Code"))
        else:
            emailcode.delete()
        if not valid:
            return HttpResponseRedirect(reverse("niji:reg"))
        else:
            user = User.objects.create_user(
                username=username,
                password=password,
                email=email
            )
            user = authenticate(
                username=username,
                password=password
            )
            login(request, user)
            return HttpResponseRedirect(reverse("niji:index"))


@method_decorator(csrf_exempt, name='dispatch')
def reg_code(request):
    if request.method == "POST":
        email = request.POST.get('email')
        code = random.randint(100000,999999)
        send_mail('WLG 论坛验证码', '您的验证码是%s，如果不是您本人操作，请忽略本邮件。' % code, 'fengye20191026@163.com', [email], fail_silently=False)
        EmailCode.objects.filter(email=email).delete()
        emailCode = EmailCode(email=email, code=code, status=0)
        emailCode.save()
        result = { "code": 200, "data": '发送成功' }
        return HttpResponse(json.dumps(result), content_type="application/json")


@login_required
def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse("niji:index"))


@csrf_exempt
def upload_image(request, dir_name):
    ##################
    #  kindeditor图片上传返回数据格式说明：
    # {"error": 1, "message": "出错信息"}
    # {"error": 0, "url": "图片地址"}
    ##################
    result = {"error": 1, "message": "上传出错"}
    files = request.FILES.get("imgFile", None)
    if files:
        result = image_upload(files, dir_name)
    return HttpResponse(json.dumps(result), content_type="application/json")


# 目录创建
def upload_generation_dir(dir_name):
    today = dt.datetime.today()
    url_part = dir_name + '/%d/%d/' % (today.year, today.month)
    dir_name = os.path.join(dir_name, str(today.year), str(today.month))
    print("*********", os.path.join(settings.MEDIA_ROOT, dir_name))
    if not os.path.exists(os.path.join(settings.MEDIA_ROOT, dir_name)):
        os.makedirs(os.path.join(settings.MEDIA_ROOT, dir_name))
    return dir_name,url_part


# 图片上传
def image_upload(files, dir_name):
    # 允许上传文件类型
    allow_suffix = ['jpg', 'png', 'jpeg', 'gif', 'bmp']
    file_suffix = files.name.split(".")[-1]
    if file_suffix.lower() not in allow_suffix:
        return {"error": 1, "message": "图片格式不正确"}
    relative_path_file, url_part = upload_generation_dir(dir_name)
    path = os.path.join(settings.MEDIA_ROOT, relative_path_file)
    print("&&&&path", path)
    if not os.path.exists(path):  # 如果目录不存在创建目录
        os.makedirs(path)
    file_name = str(uuid.uuid1()) + "." + file_suffix
    path_file = os.path.join(path, file_name)
    file_url =settings.MEDIA_URL + url_part +file_name
    open(path_file, 'wb').write(files.file.read())
    return {"error": 0, "url": file_url}