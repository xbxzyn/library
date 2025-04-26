package com.example.mapper;

import com.example.entity.OrdersItem;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrdersItemMapper {

    int insert(OrdersItem ordersItem);

    void updateById(OrdersItem ordersItem);

    void deleteById(Integer id);

    @Select("select * from `orders_item` where id = #{id}")
    OrdersItem selectById(Integer id);

    List<OrdersItem> selectAll(OrdersItem ordersItem);

   // @Select("select * from `orders_item` where order_id = #{orderId}")
   @Select("SELECT oi.id AS orderItemId, oi.book_id AS bookId, oi.book_name AS bookName, oi.book_cover AS bookCover, " +
           "oi.num AS num, oi.order_id AS orderId, u.id AS userId, u.username AS username, u.name AS userName, " +
           "u.avatar AS avatar, u.role AS role, u.phone AS phone, u.email AS email, u.score AS score, " +
           "u.nianji AS nianji, u.banji AS banji, u.bzr AS bzr " +
           "FROM orders_item oi " +
           "JOIN orders o ON oi.order_id = o.id " +
           "LEFT JOIN user u ON o.user_id = u.id " +
           "WHERE oi.order_id = #{orderId}")
   @Results({
           @Result(property = "id", column = "orderItemId"),
           @Result(property = "bookId", column = "bookId"),
           @Result(property = "bookName", column = "bookName"),
           @Result(property = "bookCover", column = "bookCover"),
           @Result(property = "num", column = "num"),
           @Result(property = "orderId", column = "orderId"),
           @Result(property = "userId", column = "userId"),
           @Result(property = "username", column = "username"),
           @Result(property = "userName", column = "userName"), // 明确指定映射关系
           @Result(property = "avatar", column = "avatar"),
           @Result(property = "role", column = "role"),
           @Result(property = "phone", column = "phone"),
           @Result(property = "email", column = "email"),
           @Result(property = "score", column = "score"),
           @Result(property = "nianji", column = "nianji"),
           @Result(property = "banji", column = "banji"),
           @Result(property = "bzr", column = "bzr")
   })
   List<OrdersItem> selectByOrderId(Integer orderId);

}
