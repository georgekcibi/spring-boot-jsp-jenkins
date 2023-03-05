# Use a Maven image as the builder stage
FROM maven:3.8.4-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn package

# Use an OpenJDK image as the runtime stage
FROM openjdk:11-jdk-slim
WORKDIR /opt/app
EXPOSE 80
COPY --from=builder /app/target/*.jar ./app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
