#!/bin/ash
set -e

if [ -f config/application.tmp ]; then
   envsubst < config/application.tmp > application.yml
fi

exec "$@"
