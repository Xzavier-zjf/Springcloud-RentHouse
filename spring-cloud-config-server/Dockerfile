# 使用官方的OpenJDK 8基础镜像
FROM openjdk:8-jdk-alpine

# 作者信息
LABEL maintainer="zzz"

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到工作目录中
COPY . /app

# 使用Maven打包项目
RUN apk add --no-cache maven && \
    mvn clean package && \
    apk del maven

# 暴露服务端口
EXPOSE 8088

# 启动Spring Boot应用
CMD ["java", "-jar", "target/spring-cloud-config-server-1.0-SNAPSHOT.jar"]