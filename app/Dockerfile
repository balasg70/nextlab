# Build your Spring Boot app elsewhere (mvn package) and copy jar into app/target or use automated build
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/spring-crud-docker.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
