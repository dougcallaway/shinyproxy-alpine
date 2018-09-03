FROM openjdk:8-jre-alpine 

WORKDIR /opt/shinyproxy/

RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.0.2.jar -O shinyproxy.jar

COPY application.yaml config/application.yaml
RUN ln -s config/application.yaml application.yml

CMD ["java", "-jar", "shinyproxy.jar"]
