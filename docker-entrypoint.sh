#!/bin/ash
set -e

echo "Initialising ShinyProxy configuration..."

cd ${CONFIG_DIR}
echo "  - checking ${PWD} for config file"

# standardise yaml file extension
if [ -f application.yml ]; then
   echo "  - found application.yml; renaming to application.yaml"
   mv application.yml application.yaml
fi

# substitute ${ENV_VARIABLE}s with container environment variables
if [ -f application.tmp ]; then
   echo "  - found application.tmp; interpolating to application.yaml"
   envsubst < application.tmp > application.yaml
fi

# make the shinyproxy configuration available to the application
if [ -f 'application.yaml' ]; then
   ln -s ${PWD}/application.yaml ${INSTALL_DIR}/application.yml
   echo "  - created symbolic link from ${PWD}/application.yaml to ${INSTALL_DIR}/application.yml"
   
   echo "Completed ShinyProxy configuration"
else
   echo "WARNING: no 'application.yml', 'application.yaml', or 'application.tmp' was found: defaulting to demo configuration"
fi

cd ${INSTALL_DIR}

exec "$@"
