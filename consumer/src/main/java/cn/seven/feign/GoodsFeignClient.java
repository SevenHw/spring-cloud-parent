package cn.seven.feign;

import cn.seven.config.FeignLogConfig;
import cn.seven.domain.Goods;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * feign声明式接口,发起远程调用的
 * <p>
 * 使用方式:
 * 1.声明接口
 * 2.在接口上添加@FeignClient ,value属性为服务生产者的名称
 * 3.编写调用接口和声明规则(和提供方保持一直)
 * 4.注入该接口对象
 *
 * @author seven
 */
@FeignClient(value = "provider", configuration = FeignLogConfig.class)
public interface GoodsFeignClient {

    @GetMapping("/goods/findOne/{id}")
    public Goods findGoodsById(@PathVariable("id") int id);
}
