# Use an official Maven image to build the app
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the source code into the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar image-to-text-0.0.1-SNAPSHOT.jar

# Install Tesseract
RUN apt-get update && apt-get install -y \
    tesseract-ocr=3.04.01-6 \
    && rm -rf /var/lib/apt/lists/*

# Expose the port the app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","image-to-text-0.0.1-SNAPSHOT.jar"]
