#!/bin/ash
set -e

# standardise yaml file extension
if [ -f application.yml ]; then
   mv application.yml application.yaml
fi

# substitute ${ENV_VARIABLE} with container environment variables
if [ -f application.tmp ]; then
   envsubst < application.tmp > application.yaml
fi

# make the shinyproxy configuration available to the application
if [ -f application.yaml ]; then
   ln -s application.yaml ${INSTALL_DIR}/application.yml
fi

cd ${INSTALL_DIR}

exec "$@"
