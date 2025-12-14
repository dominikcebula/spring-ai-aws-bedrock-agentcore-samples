FROM eclipse-temurin:21

RUN mkdir -p /opt/app
COPY target/*.jar /opt/app/app.jar

EXPOSE 8000

CMD ["java", "-jar", "/opt/app/app.jar"]
