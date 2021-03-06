# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-02-10 10:20
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=64, verbose_name='title')),
                ('content', models.TextField(blank=True, max_length=3000, verbose_name='content')),
                ('pub_date', models.DateTimeField(auto_now_add=True, db_index=True, verbose_name='published time')),
                ('view_count', models.IntegerField(default=0, verbose_name='view count')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='announcements', to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name': '公告',
                'verbose_name_plural': '公告',
            },
        ),
        migrations.CreateModel(
            name='Appendix',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pub_date', models.DateTimeField(auto_now_add=True, verbose_name='published time')),
                ('content_raw', models.TextField(verbose_name='raw content')),
                ('content_rendered', models.TextField(blank=True, default='', verbose_name='rendered content')),
            ],
        ),
        migrations.CreateModel(
            name='EmailCode',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.CharField(max_length=64, verbose_name='email')),
                ('code', models.IntegerField(default=0, verbose_name='code')),
                ('status', models.IntegerField(default=0, verbose_name='status')),
            ],
        ),
        migrations.CreateModel(
            name='ForumAvatar',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('use_gravatar', models.BooleanField(default=False)),
                ('image', models.ImageField(blank=True, default='', max_length=255, null=True, upload_to='uploads/forum/avatars/')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='forum_avatar', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Node',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=30, verbose_name='类别')),
                ('description', models.TextField(blank=True, default='', verbose_name='对该类别的描述')),
            ],
            options={
                'verbose_name': '类别',
                'verbose_name_plural': '类别',
            },
        ),
        migrations.CreateModel(
            name='NodeGroup',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=30)),
                ('node', models.ManyToManyField(to='niji.Node')),
            ],
        ),
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('read', models.BooleanField(default=False, verbose_name='read')),
                ('pub_date', models.DateTimeField(auto_now_add=True, verbose_name='published time')),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content_raw', models.TextField(verbose_name='raw content')),
                ('content_rendered', models.TextField(default='', verbose_name='rendered content')),
                ('pub_date', models.DateTimeField(auto_now_add=True, verbose_name='published time')),
                ('hidden', models.BooleanField(default=False, verbose_name='hidden')),
            ],
        ),
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=120, verbose_name='title')),
                ('image', models.ImageField(upload_to='uploads/forum/covers/', verbose_name='image')),
                ('content_raw', models.TextField(max_length=2000, verbose_name='raw content')),
                ('content_rendered', models.TextField(blank=True, default='', verbose_name='rendered content')),
                ('view_count', models.IntegerField(default=0, verbose_name='view count')),
                ('reply_count', models.IntegerField(default=0, verbose_name='reply count')),
                ('pub_date', models.DateTimeField(auto_now_add=True, db_index=True, verbose_name='published time')),
                ('last_replied', models.DateTimeField(auto_now_add=True, db_index=True, verbose_name='last replied time')),
                ('order', models.IntegerField(default=10, verbose_name='order')),
                ('hidden', models.BooleanField(default=False, verbose_name='hidden')),
                ('closed', models.BooleanField(default=False, verbose_name='closed')),
                ('node', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='topics', to='niji.Node', verbose_name='node')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='topics', to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name': '帖子',
                'verbose_name_plural': '帖子',
                'ordering': ['order', '-pub_date'],
            },
        ),
        migrations.AddField(
            model_name='post',
            name='topic',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='replies', to='niji.Topic', verbose_name='topic'),
        ),
        migrations.AddField(
            model_name='post',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='posts', to=settings.AUTH_USER_MODEL, verbose_name='用户'),
        ),
        migrations.AddField(
            model_name='notification',
            name='post',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='niji.Post', verbose_name='reply'),
        ),
        migrations.AddField(
            model_name='notification',
            name='sender',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sent_notifications', to=settings.AUTH_USER_MODEL, verbose_name='sender'),
        ),
        migrations.AddField(
            model_name='notification',
            name='to',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='received_notifications', to=settings.AUTH_USER_MODEL, verbose_name='recipient'),
        ),
        migrations.AddField(
            model_name='notification',
            name='topic',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='niji.Topic', verbose_name='topic'),
        ),
        migrations.AddField(
            model_name='appendix',
            name='topic',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='niji.Topic', verbose_name='topic'),
        ),
    ]
