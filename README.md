# Image to Text API Documentation

## Overview

This API allows you to convert images to text using Optical Character Recognition (OCR).

Base URL: `https://image-to-text-gzq3.onrender.com/api`

## Endpoints

### 1. Upload Image and Extract Text

- **URL**: `/ocr`
- **Method**: `POST`
- **Description**: Upload an image file (JPEG, PNG) and extract text from it using OCR.
- **Request Body**: Form-data with a file field named `file`.
- **Response**: Plain text with extracted text content.
- **Example**:
  ```http
  POST https://image-to-text-gzq3.onrender.com/api/ocr

  FormData:
    file: <image file>
  
# Technologies Used

## Backend

### Frameworks and Libraries

- **Spring Boot**: Used as the core framework for building the API.
- **Spring Web MVC**: Provides the HTTP request handling capabilities.
- **Tess4J**: Java library for integrating Tesseract OCR engine.
- **Apache Commons FileUpload**: Library used for handling file uploads.

### Tools

- **Docker**: Containerization platform used for deployment.
- **Render**: Platform for hosting and managing the deployed application.

## Infrastructure

- **Java 17**: Programming language used for backend development.
- **Tomcat**: Embedded servlet container for running the Spring Boot application.
