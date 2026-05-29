# 使用官方的 OpenJDK 8 基础镜像
FROM openjdk:8-jdk-alpine

# 作者信息
LABEL maintainer="Xzavier-zjf"

# 设置工作目录
WORKDIR /app

# 复制项目的 pom.xml 文件到工作目录
COPY pom.xml .

# 复制项目的源代码到工作目录
COPY src ./src

# 运行 Maven 命令来打包项目
RUN apk add --no-cache maven && \
    mvn clean package -DskipTests && \
    mv target/*.jar app.jar && \
    apk del maven

# 暴露服务端口，根据实际情况修改
EXPOSE 8080

# 运行 Spring Boot 应用
CMD ["java", "-jar", "app.jar"]