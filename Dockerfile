# Use a lightweight Java 17 JRE image
FROM eclipse-temurin:17-jre-alpine

# Create a volume for Spring Boot temp files
VOLUME /tmp

# Copy built jar into the image
COPY target/account-service-0.0.1-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]

# Expose application port
EXPOSE 8083
