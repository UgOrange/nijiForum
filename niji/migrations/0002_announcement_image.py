# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-02-10 11:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('niji', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='announcement',
            name='image',
            field=models.ImageField(default='aa', upload_to='uploads/forum/covers/', verbose_name='image'),
            preserve_default=False,
        ),
    ]