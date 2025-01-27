#!/bin/bash -ex

pulumi config set sql-admin-name $USER_NAME
pulumi config set sql-admin-password $USER_PASSWORD --secret
pulumi config set sql-user-name  $EX_USER_NAME
pulumi config set sql-user-password $EX_USER_PASSWORD --secret
pulumi config set django-admin-name $DJANGO_NAME
pulumi config set django-admin-password $DJANGO_PASSWORD --secret


