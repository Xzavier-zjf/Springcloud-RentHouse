# 使用 OpenJDK 8 基础镜像以匹配项目中 Maven 编译目标 (Java 1.8)
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制 Maven 打包后的 JAR（确保在构建镜像时上下文包含 target 目录或已把 jar 放入上下文）
# 默认产物名示例: project-spring_boot-1.0-SNAPSHOT.jar，请根据实际 artifactId/version 调整
COPY target/project-spring_boot-1.0-SNAPSHOT.jar app.jar

# 暴露应用端口（根据 application.properties/yml 调整）
EXPOSE 8080

# 启动应用
CMD ["java", "-jar", "app.jar"]