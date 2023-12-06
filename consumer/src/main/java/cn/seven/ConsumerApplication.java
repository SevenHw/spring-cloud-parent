package cn.seven;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 消费者服务
 * @author seven
 * @EnableDiscoveryClient 让nacos能够发现，扫描到到服务 新版本已经步需要主动声明 此处为了学习才加 provider就没有加
 * @EnableFeignClients 开启Feign的功能,远程调用
 */
@EnableDiscoveryClient
@EnableFeignClients
@SpringBootApplication
public class ConsumerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConsumerApplication.class, args);
    }
}