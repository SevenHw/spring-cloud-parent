package cn.seven.controller;


import cn.seven.domain.Goods;
import cn.seven.service.GoodsService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RefreshScope // 获取nacos中的值
@RestController
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;

    @Value("${index}")
    private String index;

    @GetMapping("/findOne/{id}")
    public Goods findOne(@PathVariable("id") int id) throws InterruptedException {
        Goods goods = goodsService.findOne(id);

        goods.setTitle(goods.getTitle() + ":" + index);
        return goods;
    }
}
