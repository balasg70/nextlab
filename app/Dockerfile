# Build your Spring Boot app
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/spring-crud-docker.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
