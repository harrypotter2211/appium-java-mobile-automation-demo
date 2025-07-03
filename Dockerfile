FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

VOLUME /tmp

COPY target/account-service-0.0.1-SNAPSHOT.jar app.jar

RUN touch app.jar

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar"]

EXPOSE 8083
