# -*- coding: utf-8 -*-
from django.forms import ModelForm
from django.conf import settings
from crispy_forms.layout import Submit
from crispy_forms.helper import FormHelper
from .models import Topic, Appendix, ForumAvatar, Post
from django.utils.translation import ugettext as _

if 'pagedown' in settings.INSTALLED_APPS:
    use_pagedown = True
    from django import forms
    from pagedown.widgets import PagedownWidget
else:
    use_pagedown = False


class TopicForm(ModelForm):

    if use_pagedown:
        content_raw = forms.CharField(label=_('Content'), widget=PagedownWidget())

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)
        super(TopicForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit('submit', _('Submit')))
        self.fields['node'].widget.attrs.update({'class': 'node-class'})
        self.fields['append_file'].required = False
        self.fields['append_video'].required = False

    class Meta:
        model = Topic
        fields = ['title', 'content_rendered', 'append_file', 'node','append_video']
        labels = {
            'content_rendered': _('内容'),
            'node': _('类别'),
            'title': _('标题'),
            'append_file': _('附加文件'),
            'append_video':_('附加视频'),
        }

    def save(self, commit=True):
        inst = super(TopicForm, self).save(commit=False)
        inst.user = self.user
        
        if commit:
            inst.save()
            self.save_m2m()
        return inst


class TopicEditForm(ModelForm):

    if use_pagedown:
        content_raw = forms.CharField(label=_('Content'), widget=PagedownWidget())

    def __init__(self, *args, **kwargs):
        super(TopicEditForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit('submit', _('Submit')))

    class Meta:
        model = Topic
        fields = ('content_raw', )
        labels = {
            'content_raw': _('Content'),
        }


class AppendixForm(ModelForm):

    def __init__(self, *args, **kwargs):
        self.topic = kwargs.pop('topic', None)
        super(AppendixForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit('submit', _('Submit')))

    class Meta:
        model = Appendix
        fields = ('content_raw', )
        labels = {
            'content_raw': _('Content'),
        }

    def save(self, commit=True):
        inst = super(AppendixForm, self).save(commit=False)
        inst.topic = self.topic
        if commit:
            inst.save()
            self.save_m2m()
        return inst


class ForumAvatarForm(ModelForm):

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)
        super(ForumAvatarForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit('submit', _('Submit')))

    class Meta:
        model = ForumAvatar
        fields = ('image', 'use_gravatar')
        labels = {
            'image': _('Avatar Image'),
            'use_gravatar': _("Always Use Gravatar")
        }

    def save(self, commit=True):
        inst = super(ForumAvatarForm, self).save(commit=False)
        inst.user = self.user
        if commit:
            inst.save()
            self.save_m2m()
        return inst


class ReplyForm(ModelForm):

    if use_pagedown:
        content_raw = forms.CharField(label='', widget=PagedownWidget())

    def __init__(self, *args, **kwargs):
        self.user = kwargs.pop('user', None)
        self.topic_id = kwargs.pop('topic_id', None)
        super(ReplyForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit('submit', _('Submit')))

    class Meta:
        model = Post
        fields = ('content_raw',)
        labels = {
            'content_raw': '',
        }

    def save(self, commit=True):
        inst = super(ReplyForm, self).save(commit=False)
        inst.user = self.user
        inst.topic_id = self.topic_id
        if commit:
            inst.save()
            self.save_m2m()
        return inst
