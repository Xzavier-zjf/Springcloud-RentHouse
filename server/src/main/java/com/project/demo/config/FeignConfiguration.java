package com.project.demo.config;

import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 想要打印出feign的RPC请求所有的出参入参
 *
 * 后面还要把这个FeignConfiguration配置到对应的服务接口上
 * */
@Configuration
public class FeignConfiguration {
    @Bean
    Logger.Level feignLoggerLevel() {
        //根据实际情况选择合适的日志level
        return Logger.Level.FULL;
    }
}
