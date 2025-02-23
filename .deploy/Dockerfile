FROM openjdk:17-jdk-slim as builder
WORKDIR /build

COPY . .
RUN ./gradlew build

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY ../.env .env
COPY --from=builder /build/build/libs/delivery-0.0.1-SNAPSHOT.jar delivery.jar
ENTRYPOINT ["java", "-jar", "delivery.jar"]

