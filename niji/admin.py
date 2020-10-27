# -*- coding: utf-8 -*-
from django.contrib import admin
from django.utils.safestring import mark_safe
from .models import Topic, Node, Post, Appendix, Notification, Announcement


class PostInline(admin.TabularInline):
    model = Post
    raw_id_fields = (
        'user',
    )
    fields = (
        'user',
        'content_raw',
        'hidden',
    )
    extra = 1


class AppendixInline(admin.TabularInline):
    model = Appendix
    fields = (
        'content_raw',
    )
    extra = 1


class TopicAdmin(admin.ModelAdmin):

    def is_top_topic(self, obj):
        return obj.order < 10

    is_top_topic.boolean = True

    list_display = (
        'title',
        # 'image',
        'append_file',
        'append_video',
        'user',
        'pub_date',
        'last_replied',
        'view_count',   
        'reply_count',
        'hidden',
        'closed',
        'is_top_topic',
    )
    fields = (
        'user',
        'title',
        # 'image',
        'append_file',
        'append_video',
        'content_rendered',
        'hidden',
        'closed'
    )

    search_fields = (
        'title',
        'user__username',
        'user__email'
    )
    raw_id_fields = (
        'user',
    )
    inlines = [
        PostInline,
        AppendixInline
    ]


class NodeAdmin(admin.ModelAdmin):

    def number_of_topics(self, obj):
        topics = Topic.objects.filter(node=obj)
        return "{}({})".format(topics.count(), topics.visible().count())

    number_of_topics.short_description = "Number of Topics [total(visible)]"

    list_display = (
        'title',
        'number_of_topics'
    )
    search_fields = (
        'title',
    )


class AnnouncementAdmin(admin.ModelAdmin):

    list_display = (
        'title',
        'content_raw',
        'user',
        'pub_date',
        'view_count',
    )
    fields = (
        'title',
        'content_rendered',
        'user',
        'view_count',
    )

    search_fields = (
        'title',
        'user__username',
        'user__email'
    )
    class Media:
        js = ('/static/kindeditor/kindeditor-all-min.js',
              '/static/kindeditor/lang/zh-CN.js',
              '/static/kindeditor/config.js')

admin.site.register(Topic, TopicAdmin)
admin.site.register(Node, NodeAdmin)
admin.site.register(Announcement, AnnouncementAdmin)
