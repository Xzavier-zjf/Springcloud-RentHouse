# 使用官方的 OpenJDK 8 基础镜像
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制项目的 JAR 文件到容器中
COPY target/app-user-1.0-SNAPSHOT.jar app.jar

# 暴露 Spring Boot 应用默认的端口
EXPOSE 8080

# 运行 Spring Boot 应用
CMD ["java", "-jar", "app.jar"]