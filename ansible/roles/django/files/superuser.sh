#!/bin/bash

echo "from django.contrib.auth import get_user_model; \
User = get_user_model(); \
User.objects.create_superuser('admin', 'admin@gmail.com', 'P@ssword0')" \
| $1 manage.py shell