# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Package the application (skipping tests if needed: use -DskipTests)
RUN mvn clean package -DskipTests

# Stage 2: Run the packaged Spring Boot application using a minimal JRE image
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the jar from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port (change if your app runs on a different port)
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
