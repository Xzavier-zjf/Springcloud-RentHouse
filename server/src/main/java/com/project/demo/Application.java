package com.project.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.http.client.OkHttp3ClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 */
@SpringBootApplication
@EnableJpaRepositories
@EnableEurekaClient
@EnableFeignClients
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class,args);
    }

    @Bean
    /**
     * 如果要使用ribbon负载需要加上@LoadBalanced
     * */
    @LoadBalanced
    public RestTemplate restTemplate() {

        /**
         * 向Spring容器中定义RestTemplate对象  这里就是表示用OKHTTP
         * @return
         */
        return new RestTemplate(new OkHttp3ClientHttpRequestFactory());
    }
}
