package cn.seven.filters;

import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 全局过滤器过滤器
 * 需要实现GlobalFilter和Ordered两个接口
 */
@Component
public class TokenFilter implements GlobalFilter, Ordered {

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        System.out.println("经过了全局过滤器");

        // 中间写逻辑代码

        return chain.filter(exchange);//放行
    }

    /**
     * 过滤器排序
     * @return 数值越小越先执行
     */
    @Override
    public int getOrder() {
        return 0;
    }
}
