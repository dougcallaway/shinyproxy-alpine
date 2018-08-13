FROM openjdk:8-jre 

WORKDIR /opt/shinyproxy/

RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.0.1.jar -O shinyproxy.jar

COPY application.yml /opt/shinyproxy/config/application.yml

ENTRYPOINT ["mv", "/opt/shinyproxy/config/application.yml", "/opt/shinyproxy/application.yml"]
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]
