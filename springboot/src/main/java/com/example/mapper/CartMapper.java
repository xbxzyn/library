package com.example.mapper;

import com.example.entity.Cart;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CartMapper {

    int insert(Cart cart);

    void updateById(Cart cart);

    void deleteById(Integer id);

    @Select("select * from `cart` where id = #{id}")
    Cart selectById(Integer id);

    List<Cart> selectAll(Cart cart);

}
