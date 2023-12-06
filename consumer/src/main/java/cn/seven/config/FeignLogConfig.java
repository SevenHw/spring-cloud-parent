package cn.seven.config;

import feign.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * Feign调用的日志配置类
 *
 * @author seven
 */
@Configuration
public class FeignLogConfig {

    @Bean
    public Logger.Level level() {

        /**
         * NONE 不记录
         * BASIC, 记录基本的请求行,响应状态码数据
         * HEADERS, 记录基本的行请求,响应状态码数据,记录响应头信息
         * FULL; 记录完成的请求,响应数据
         */
        return Logger.Level.FULL;
    }
}
