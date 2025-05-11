# Build stage
FROM maven:3.8.6-openjdk-17-slim AS build
WORKDIR /app

# Copy pom.xml first to leverage Docker cache
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build the application
COPY src /app/src
RUN mvn package -DskipTests

# Run stage
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose application port
EXPOSE 8081

# Set environment variables for Keycloak and MySQL
ENV SPRING_APPLICATION_NAME=tasks
ENV SERVER_ADDRESS=0.0.0.0
ENV SERVER_PORT=8081
ENV SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_ISSUER_URI=http://keycloak:8080/realms/spring-boot-realm
ENV KEYCLOAK_CLIENT_ID=spring-boot-client
ENV KEYCLOAK_SERVER_URL=http://keycloak:8080/
ENV KEYCLOAK_REALM=spring-boot-realm
ENV SPRING_DATASOURCE_URL=jdbc:mysql://mysql:3306/tasks_db?useTimezone=true&serverTimezone=UTC
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=root

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]