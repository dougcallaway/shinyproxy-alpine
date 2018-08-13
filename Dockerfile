FROM openjdk:8-jre 

WORKDIR /opt/shinyproxy/

RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.0.1.jar -O shinyproxy.jar

COPY application.yml config/application.yml
RUN ln -s config/application.yml application.yml

CMD ["java", "-jar", "shinyproxy.jar"]
