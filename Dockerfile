FROM openjdk:8-jre-alpine

RUN apk add --no-cache \
   # provides envsubst; required for application config file interpolation
   gettext

ARG INSTALL_DIR=/opt/shinyproxy
ARG CONFIG_DIR=$INSTALL_DIR/config
ARG SHINYPROXY_VERSION=2.0.2

ENV INSTALL_DIR=$INSTALL_DIR
ENV CONFIG_DIR=$CONFIG_DIR
ENV SHINYPROXY_VERSION=$SHINYPROXY_VERSION

WORKDIR $INSTALL_DIR
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-${SHINYPROXY_VERSION}.jar -O shinyproxy.jar

WORKDIR $CONFIG_DIR
COPY ./docker-entrypoint.sh init-config.sh
RUN chmod +x ./init-config.sh
ENTRYPOINT ["./init-config.sh"]

CMD ["java", "-jar", "shinyproxy.jar"]
