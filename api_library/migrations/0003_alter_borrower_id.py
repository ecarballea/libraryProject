# Generated by Django 3.2.13 on 2022-07-06 05:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api_library', '0002_alter_borrower_borrow_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='borrower',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]