# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-02-07 17:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('niji', '0007_auto_20200208_0118'),
    ]

    operations = [
        migrations.AlterField(
            model_name='topic',
            name='cover_img',
            field=models.ImageField(blank=True, default='', max_length=255, null=True, upload_to='uploads/forum/covers/', verbose_name='cover img'),
        ),
    ]
