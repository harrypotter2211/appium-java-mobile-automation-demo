# -------- Stage 1: Build the application using Maven --------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Build the application and skip tests (adjust if needed)
RUN mvn clean package -DskipTests

# -------- Stage 2: Create minimal runtime image --------
FROM eclipse-temurin:17-jre

# Set working directory inside the container
WORKDIR /app

# Copy built JAR from builder stage
COPY --from=builder /app/target/account-service-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port (adjust if not 8080)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
