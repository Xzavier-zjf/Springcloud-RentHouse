# 基础镜像，使用 Java 8 运行环境
FROM openjdk:8-jdk-alpine

# 作者信息
LABEL maintainer="z2114086570@163.com"

# 创建工作目录
WORKDIR /app

# 将项目的 pom.xml 文件复制到工作目录
COPY pom.xml .

# 下载项目依赖，利用 Docker 缓存机制，避免每次构建都重新下载依赖
RUN apk add --no-cache maven && mvn dependency:go-offline

# 将项目源代码复制到工作目录
COPY src ./src

# 打包项目
RUN mvn package -DskipTests

# 暴露服务端口，与 application.yml 中的端口号保持一致
EXPOSE 8100

# 运行打包后的 JAR 文件
CMD ["java", "-jar", "target/eureka-1.0-SNAPSHOT.jar"]