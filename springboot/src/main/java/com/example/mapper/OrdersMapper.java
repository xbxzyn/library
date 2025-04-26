package com.example.mapper;

import com.example.entity.OrderExcelVO;
import com.example.entity.Orders;
import com.example.entity.Pie;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrdersMapper {

    int insert(Orders orders);

    void updateById(Orders orders);

    void deleteById(Integer id);

    @Select("select * from `orders` where id = #{id}")
    Orders selectById(Integer id);

    List<Orders> selectAll(Orders orders);

    List<Orders> yqlist();

    @Select("SELECT COUNT(*) FROM orders WHERE status = '已借出'")
    Integer selectCount1();

    @Select("SELECT COUNT(*) FROM orders WHERE status = '逾期'")
    Integer selectCount2();

    @Select("select count(*) from orders where time like '%${day}%'")
    Integer selectDayCount(String day);

    List<OrderExcelVO> selectByIds(List<Integer> ids);

    //年级借阅可视化图表
    @Select("select `user`.nianji name, sum(orders_item.num) value from orders_item left join orders on orders_item.order_id = orders.id left join user on `user`.id = orders.user_id group by `user`.nianji")
    List<Pie> pie5();
}
