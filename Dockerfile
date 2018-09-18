FROM openjdk:8-jre-alpine 

WORKDIR /opt/shinyproxy/

RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.0.2.jar -O shinyproxy.jar
COPY application.yaml application.yml
COPY docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["java", "-jar", "shinyproxy.jar"]
