# Springcloud-RentHouse

基于 Spring Cloud + Vue 的房屋租赁系统，包含前台租房门户、后台管理端、配置中心、注册中心、用户服务、业务服务和网关服务。

## 技术栈

- 后端：Spring Boot 2.7、Spring Cloud、Eureka、Spring Cloud Gateway、Spring Cloud Config、JPA/MyBatis Plus
- 前台：Vue 2、Vue Router、Vuex、Element UI、BootstrapVue
- 后台：Layui 静态管理端
- 数据库：MySQL 8
- 本地环境：JDK 17、Maven 3.6+、Node.js 22、npm 10

## 功能概览

- 游客：浏览首页、公告、新闻、房源列表和房源详情
- 承租用户：注册登录、申请看房、申请租赁、查看合同、模拟缴费、申请退租、评价房屋
- 出租用户：注册登录、查看我的房源、看房申请、租赁申请、合同、缴费和留言
- 管理员：维护房源、审核申请、管理合同、缴费、退租、评价、公告和新闻
- 业务中心：按管理员、出租用户、承租用户区分功能入口，并展示流程状态

## 数据库初始化

1. 创建数据库：

```sql
CREATE DATABASE `springcloud-renthouse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

2. 导入初始化脚本：

```bash
mysql -uroot -p springcloud-renthouse < db/Springcloud-RentHouse.sql
```

3. 默认本地数据库配置在 `properties/localhost/application.yml`：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/springcloud-renthouse?serverTimezone=Asia/Shanghai&useSSL=false&characterEncoding=utf-8&allowPublicKeyRetrieval=true
    username: root
    password: 123456
```

如果你的 MySQL 账号密码不同，请同步修改该文件。

## 启动顺序

按下面顺序启动后端服务：

1. `spring-cloud-config-server`，端口 `7000`
2. `eureka`，端口 `7001`
3. `app-user`，端口 `7003`
4. `server`，端口 `7002`，上下文路径 `/api`
5. `spring-cloud-gateway`，端口 `7004`

前台门户：

```bash
cd client_home
npm install
npm run serve
```

访问地址：`http://localhost:8081`

后台管理端：

```bash
cd client_admin
http-server -c-1
```

访问地址：`http://127.0.0.1:8080`

如果没有 `http-server`：

```bash
npm i -g http-server
```

## 默认账号

- 管理员：`admin / abc123`
- 承租用户：`tenant52801 / abc123`
- 出租用户：`landlord52801 / abc123`

## 常用验证命令

后端模块编译：

```bash
cd eureka && mvn -q -DskipTests package
cd ../app-user && mvn -q -DskipTests package
cd ../server && mvn -q -DskipTests package
cd ../spring-cloud-gateway && mvn -q -DskipTests package
cd ../spring-cloud-config-server && mvn -q -DskipTests package
```

前台构建：

```bash
cd client_home
npm run build
```

接口快速检查：

```bash
curl http://127.0.0.1:7004/api/house_information/get_list?page=1^&size=1
curl http://127.0.0.1:7004/api/user/get_list?page=1^&size=1
```

## 本次修复说明

- 修复业务中心登录态为空时的 Vue 渲染错误
- 新增前台到后台管理页的登录态桥接页 `client_admin/bridge.html`
- 修复后台公共下拉初始化函数在节点不存在时的空指针错误
- 补齐承租用户退租申请和房屋评价前台页面
- 业务中心支持角色区分、流程状态展示和模拟缴费

## 目录说明

- `client_home/`：Vue 前台门户
- `client_admin/`：Layui 后台管理端
- `server/`：房源、合同、缴费、申请等业务服务
- `app-user/`：用户和权限服务
- `spring-cloud-gateway/`：网关服务
- `spring-cloud-config-server/`：本地配置中心
- `eureka/`：注册中心
- `properties/`：配置中心读取的本地配置
- `db/`：数据库初始化脚本

## 注意事项

- 不要提交 `node_modules/`、`target/`、`dist/`、`.idea/`、`out/` 等可生成目录。
- 前台业务中心的后台管理入口依赖 `client_admin` 运行在 `8080` 端口。
- 支付功能是毕业设计演示用的模拟支付，只更新缴费状态，不对接真实微信或支付宝。
