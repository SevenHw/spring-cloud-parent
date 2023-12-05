package cn.seven.service;

import cn.seven.dao.GoodsDao;
import cn.seven.domain.Goods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Goods 业务层
 */
@Service
public class GoodsService {

    @Resource
    private GoodsDao goodsDao;


    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    public Goods findOne(int id) {
        return goodsDao.findOne(id);
    }
}
