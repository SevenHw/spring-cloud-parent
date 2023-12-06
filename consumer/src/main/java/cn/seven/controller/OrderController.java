package cn.seven.controller;


import cn.seven.domain.Goods;
import cn.seven.feign.GoodsFeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;

/**
 * 服务的调用方
 */

@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    private RestTemplate restTemplate;
    @Resource
    private GoodsFeignClient goodsFeignClient;

    @GetMapping("/goods/{id}")
    public Goods findGoodsById(@PathVariable("id") int id) {

        /**
         * openFeign调用方式
         * 具体使用方式在GoodsFeignClient接口中
         */
        Goods goods = goodsFeignClient.findGoodsById(id);

        return goods;
    }
}
