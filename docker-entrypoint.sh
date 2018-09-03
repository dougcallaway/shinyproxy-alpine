#!/bin/ash
set -e

if [ -f config/application.yaml ]; then
   ln -s config/application.yaml application.yml
fi

exec "$@"
