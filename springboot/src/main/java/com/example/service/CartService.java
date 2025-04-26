package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Cart;
import com.example.mapper.CartMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class CartService {

    @Resource
    private CartMapper cartMapper;

    public void add(Cart cart) {
        Account currentUser = TokenUtils.getCurrentUser();
        cart.setUserId(currentUser.getId());
        cart.setTime(DateUtil.now());
        cartMapper.insert(cart);
    }

    public void updateById(Cart cart) {
        cartMapper.updateById(cart);
    }

    public void deleteById(Integer id) {
        cartMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            cartMapper.deleteById(id);
        }
    }

    public Cart selectById(Integer id) {
        return cartMapper.selectById(id);
    }

    public List<Cart> selectAll(Cart cart) {
        // 用户只查询自己的订单
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            cart.setUserId(currentUser.getId());
        }
        return cartMapper.selectAll(cart);
    }

    public PageInfo<Cart> selectPage(Cart cart, Integer pageNum, Integer pageSize) {
        // 用户只查询自己的订单
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            cart.setUserId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Cart> list = cartMapper.selectAll(cart);
        return PageInfo.of(list);
    }

}
