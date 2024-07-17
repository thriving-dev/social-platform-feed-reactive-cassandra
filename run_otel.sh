#!/bin/bash

./gradlew build -Dquarkus.package.type=uber-jar

java \
  -javaagent:opentelemetry-javaagent.jar \
  -Dotel.service.name=social-platform-feed-poc \
  -Dotel.traces.exporter=otlp \
  -Dotel.exporter.otlp.protocol=grpc \
  -Dotel.metrics.exporter=none \
  -Dotel.logs.exporter=none \
  -Dotel.javaagent.enabled=true \
  -Dotel.javaagent.logging=none \
  -Dotel.instrumentation.tomcat.enabled=false \
  -Dotel.instrumentation.servlet.enabled=false \
  -Dotel.exporter.otlp.endpoint=http://localhost:4317 \
  -jar build/*runner.jar
