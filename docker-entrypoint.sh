#!/bin/ash
set -e

echo "Initialising ShinyProxy configuration..."

cd ${CONFIG_DIR}
echo "  - checking $PWD for config file"

# standardise yaml file extension
if [ -f application.yml ]; then
   echo "  - found application.yml; renaming to application.yaml"
   mv application.yml application.yaml
fi

# substitute ${ENV_VARIABLE} with container environment variables
if [ -f application.tmp ]; then
   echo "  - found application.tmp; interpolating to application.yaml"
   envsubst < application.tmp > application.yaml
fi

# make the shinyproxy configuration available to the application
if [ -f application.yaml ]; then
   echo "  - found application.yaml"
   echo "  - creating symbolic link to ${INSTALL_DIR}/application.yml"
   ln -s application.yaml ${INSTALL_DIR}/application.yml
   cat ${INSTALL_DIR}/application.yml
fi

cd ${INSTALL_DIR}
echo "Completed ShinyProxy configuration"

exec "$@"
