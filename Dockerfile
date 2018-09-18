FROM openjdk:8-jre-alpine

RUN apk add --no-cache \
   # provides envsubst; required for application config file interpolation
   gettext

ARG INSTALL_DIR=/opt/shinyproxy
ARG SHINYPROXY_VERSION=2.0.2
ENV SHINYPROXY_VERSION=$SHINYPROXY_VERSION

WORKDIR $INSTALL_DIR
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-${SHINYPROXY_VERSION}.jar -O shinyproxy.jar

COPY ./docker-entrypoint.sh .
RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["java", "-jar", "shinyproxy.jar"]
