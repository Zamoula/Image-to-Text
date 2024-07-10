# Stage 1: Build
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src
COPY tessdata ./tessdata

# Build the Spring Boot application
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:17-jdk-slim
RUN apt-get update && \
    apt-get install -y tesseract-ocr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/target/image-to-text-0.0.1-SNAPSHOT.jar .
# Copy the tessdata directory from the build stage
COPY --from=build /app/tessdata ./tessdata

EXPOSE 8080
CMD ["java", "-jar", "image-to-text-0.0.1-SNAPSHOT.jar"]
