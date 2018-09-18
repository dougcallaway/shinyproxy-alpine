#!/bin/ash
set -e
if [ -f config/application.tmp ]; then
   envsubst < config/application.tmp > application.yml
if [ -f config/application.yaml ]; then
   ln -s config/application.yaml application.yml
fi
exec "$@"
