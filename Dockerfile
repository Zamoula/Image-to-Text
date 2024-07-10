# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Install Tesseract OCR and other dependencies
RUN apt-get update && \
    apt-get install -y tesseract-ocr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Copy tessdata files into the container
COPY tessdata ./tessdata

# Build the Spring Boot application
RUN ./mvnw clean package -DskipTests

# Expose the port the application runs on
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/your-spring-boot-app.jar"]
