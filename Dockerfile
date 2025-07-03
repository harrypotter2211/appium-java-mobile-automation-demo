# Use minimal Java 11 runtime base image
FROM eclipse-temurin:11-jre-alpine

# Create a temp volume for Spring Boot
VOLUME /tmp

# Copy the JAR built by Maven
COPY target/account-service-0.0.1-SNAPSHOT.jar app.jar

# Avoid Spring Boot caching bugs
RUN sh -c 'touch /app.jar'

# Start the app
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]

# Expose default Spring Boot port
EXPOSE 8083
