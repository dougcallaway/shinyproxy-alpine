FROM openjdk:8-jre-alpine 

WORKDIR /opt/shinyproxy/

RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.0.2.jar -O shinyproxy.jar

COPY application.yml config/application.yml
RUN ln -s config/application.yml application.yml

CMD ["java", "-jar", "shinyproxy.jar"]
