# Stage 1: Build the application using Gradle
FROM gradle:7.6-jdk17 AS builder
WORKDIR /home/gradle/project
# 소스 코드 전체를 복사합니다. 필요에 따라 .dockerignore로 불필요한 파일은 제외하세요.
COPY . .
# 테스트를 제외하고 빌드합니다.
RUN gradle build -x test --no-daemon

# Stage 2: Create the runtime image
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY ../.env .env
# 빌드 단계에서 생성된 JAR 파일을 복사합니다.
# 여기서 JAR 파일 경로는 실제 빌드 산출물 경로에 맞춰 수정해야 합니다.
COPY --from=builder /home/gradle/project/build/libs/delivery-0.0.1-SNAPSHOT.jar delivery.jar
ENTRYPOINT ["java", "-jar", "delivery.jar"]
