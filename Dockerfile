FROM openjdk:8-jre-alpine 

WORKDIR /opt/shinyproxy/

RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.0.2.jar -O shinyproxy.jar

COPY application.yaml config/application.yaml
COPY docker-entrypoint.sh .

ENTRYPOINT ["/bin/sh", "docker-entrypoint.sh"]
CMD ["java", "-jar", "shinyproxy.jar"]
