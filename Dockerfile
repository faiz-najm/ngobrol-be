FROM eclipse-temurin:25-jdk-alpine

RUN apk add --no-cache curl

WORKDIR /app

COPY build/libs/*.jar app.jar
COPY entrypoint.sh entrypoint.sh

RUN addgroup -S spring && adduser -S spring -G spring && \
    mkdir -p /app/logs && chown -R spring:spring /app/logs && \
    chmod +x /app/entrypoint.sh
USER spring

EXPOSE 8085

ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]
# optionally use CMD for extra args