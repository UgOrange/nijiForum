# -*- coding: utf-8 -*-
# Generated by Django 1.11.27 on 2020-02-12 07:10
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('niji', '0005_auto_20200212_1410'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='announcement',
            name='image',
        ),
        migrations.AlterField(
            model_name='topic',
            name='content_raw',
            field=models.TextField(blank=True, max_length=2000, verbose_name='raw content'),
        ),
    ]