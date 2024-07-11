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

# Install Tesseract and wget
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create the tessdata directory
RUN mkdir -p /usr/share/tessdata

# Download the language data file
RUN wget -P /usr/share/tessdata https://github.com/tesseract-ocr/tessdata_best/raw/main/eng.traineddata

# Set the TESSDATA_PREFIX environment variable
ENV TESSDATA_PREFIX=/usr/share/tessdata

# Expose the port the app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","image-to-text-0.0.1-SNAPSHOT.jar"]
