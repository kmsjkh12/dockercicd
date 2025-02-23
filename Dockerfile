
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY .env .env
COPY build/libs/delivery-0.0.1-SNAPSHOT.jar delivery.jar
EXPOSE 8088
ENTRYPOINT ["java", "-jar", "delivery.jar"]
