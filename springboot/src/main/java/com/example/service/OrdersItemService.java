package com.example.service;

import com.example.entity.OrdersItem;
import com.example.mapper.OrdersItemMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class OrdersItemService {

    @Resource
    private OrdersItemMapper ordersItemMapper;

    public void add(OrdersItem ordersItem) {
        ordersItemMapper.insert(ordersItem);
    }

    public void updateById(OrdersItem ordersItem) {
        ordersItemMapper.updateById(ordersItem);
    }

    public void deleteById(Integer id) {
        ordersItemMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            ordersItemMapper.deleteById(id);
        }
    }

    public OrdersItem selectById(Integer id) {

        return ordersItemMapper.selectById(id);
    }

    public List<OrdersItem> selectAll(OrdersItem ordersItem) {
        return ordersItemMapper.selectAll(ordersItem);
    }

    public PageInfo<OrdersItem> selectPage(OrdersItem ordersItem, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<OrdersItem> list = ordersItemMapper.selectAll(ordersItem);
        return PageInfo.of(list);
    }

    public List<OrdersItem> selectByOrderId(Integer orderId) {
        return ordersItemMapper.selectByOrderId(orderId);
    }
}
