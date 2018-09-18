FROM openjdk:8-jre-alpine

RUN apk add --no-cache \
   # provides envsubst; required for application config file interpolation
   gettext

ARG INSTALL_DIR=/opt/shinyproxy
ENV INSTALL_DIR=$INSTALL_DIR
ARG VERSION=2.0.2

WORKDIR $INSTALL_DIR
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-${VERSION}.jar -O shinyproxy.jar

COPY ./docker-entrypoint.sh .
RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["java", "-jar", "shinyproxy.jar"]
