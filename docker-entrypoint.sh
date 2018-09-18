#!/bin/ash
set -e

# standardise yaml file extension
if [ -f application.yaml ]; then
   mv application.yaml application.yml
fi

# substitute ${ENV_VARIABLE} with container environment variables
if [ -f application.tmp ]; then
   envsubst < application.tmp > application.yml
fi

exec "$@"
