#!/bin/ash
set -e

if [ -f application.tmp ]; then
   envsubst < application.tmp > application.yml
fi

exec "$@"
