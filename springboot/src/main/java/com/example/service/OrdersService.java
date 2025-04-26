package com.example.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.exception.CustomException;
import com.example.mapper.BookMapper;
import com.example.mapper.OrdersItemMapper;
import com.example.mapper.OrdersMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 业务层方法
 */
@Service
public class OrdersService {

    @Resource
    private OrdersMapper ordersMapper;
    @Resource
    private BookMapper bookMapper;
    @Resource
    private OrdersItemMapper ordersItemMapper;
    @Resource
    private CartService cartService;
    @Resource
    private UserService userService;

    public void add(Orders orders) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser.getRole().equals(RoleEnum.USER.name())){
            if (currentUser.getScore() < 60) {
                throw new CustomException("500", "对不起，信誉分低于60无法借阅");
            }
        }
        List<Cart> cartList = orders.getCartList();
        // 书单批量借阅
        if (CollUtil.isNotEmpty(cartList)) {  // 通过书单批量借阅
            String name = "";
            int num = 0;
            for (Cart cart : cartList) {
                Integer bookId = cart.getBookId();
                // 查询书信息
                Book book = bookMapper.selectById(bookId);
                name += book.getName() + "，";
                num += cart.getNum();  // 总共借书的数量计算出来
                if (book == null) {
                    throw new CustomException("500", "图书不存在");
                }
                Integer store = book.getStore();  // 图书库存
                if (cart.getNum() > store) {  // 借书的数量超出了库存量  无法借出
                    throw new CustomException("500", "图书库存不足");
                }
            }
            name = name.substring(0, name.length() - 1);
//            name += "等" + num + "本图书";
            orders.setName(name);
        } else {   // 单个借阅
            // 查询书信息
            Book book = bookMapper.selectById(orders.getBookId());
            if (book == null) {
                throw new CustomException("500", "图书不存在");
            }
            Integer store = book.getStore();  // 图书库存
            if (orders.getNum() > store) {  // 借书的数量超出了库存量  无法借出
                throw new CustomException("500", "图书库存不足");
            }
            //+ "等" + orders.getNum() + "本图书"
            orders.setName(book.getName() );
        }

        orders.setTime(DateUtil.now());
        orders.setUserId(currentUser.getId());
        orders.setStatus("已借出");  // 借书待确认   已借出   还书待确认  已归还
        orders.setOrderNo(IdUtil.getSnowflakeNextIdStr());  // 唯一订单编号
        ordersMapper.insert(orders);  // 插入数据库并返回的订单的主键ID
        Book book = bookMapper.selectById(orders.getBookId());
        book.setStore(book.getStore() -1);
        bookMapper.updateById(book);  // 更新图书库存
        System.out.println(" 当前库存: " + book.getStore());

        // 批量借阅情形
        if (CollUtil.isNotEmpty(cartList)) {
            for (Cart cart : cartList) {
                this.setOrdersItem(orders, cart.getNum(), cart.getBookId());
                // 借完书  要删除对应购物车的借书数据
                cartService.deleteById(cart.getId());
            }
        } else {   // 单个借阅情形
            this.setOrdersItem(orders, orders.getNum(), orders.getBookId());
        }

    }

    // 插入 order_item 数据的方法
    private void  setOrdersItem(Orders orders, Integer num, Integer bookId) {
        OrdersItem ordersItem = new OrdersItem();
        ordersItem.setOrderId(orders.getId());
        Book book = bookMapper.selectById(bookId);  // 查询书单里面单个图书的信息
        ordersItem.setNum(num);
        ordersItem.setBookCover(book.getCover());
        ordersItem.setBookName(book.getName());
        ordersItem.setBookId(bookId);
        ordersItemMapper.insert(ordersItem);  //  一个一个往数据库插入详情数据
    }

    @Transactional
    public void updateById(Orders orders) {
        // 扣减库存
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.ADMIN.name().equals(currentUser.getRole())) {
            if ("已借出".equals(orders.getStatus())) {  // 扣减库存
                List<OrdersItem> ordersItems = ordersItemMapper.selectByOrderId(orders.getId());
                for (OrdersItem ordersItem : ordersItems) {  // 查询本次借的所有图书  按个扣减库存
                    Integer bookId = ordersItem.getBookId();
                    Book book = bookMapper.selectById(bookId);
                    Integer num = ordersItem.getNum();  // 借书的数量
                    book.setStore(book.getStore() -num);
                    bookMapper.updateById(book);  // 更新图书库存
                    System.out.println(" 当前库存: " + book.getStore());
                }
            }
            if ("已归还".equals(orders.getStatus())) {  // 加库存
                List<OrdersItem> ordersItems = ordersItemMapper.selectByOrderId(orders.getId());
                for (OrdersItem ordersItem : ordersItems) {  // 查询本次借的所有图书  按个加库存
                    Integer bookId = ordersItem.getBookId();
                    Book book = bookMapper.selectById(bookId);
                    Integer num = ordersItem.getNum();  // 借书的数量
                    book.setStore(book.getStore() + num);
                    bookMapper.updateById(book);  // 更新图书库存

                    // 更新信誉分  当借出的天数超过30天  就会扣除信誉分
                    String time = orders.getTime();
                    long between = 1 + DateUtil.between(DateUtil.parseDate(time), new Date(), DateUnit.DAY);// 计算借书的时长（天）
                    if (between > 30) {
                        Integer userId = orders.getUserId();
                        User user = userService.selectById(userId);
                        user.setScore(user.getScore() - 10);
                        userService.updateById(user);
                    }
                }
            }
        }
        ordersMapper.updateById(orders);
    }

    @Transactional
    public void xujie(Orders orders) {
        ordersMapper.updateById(orders);
    }

    public void deleteById(Integer id) {
        ordersMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            ordersMapper.deleteById(id);
        }
    }

    public Orders selectById(Integer id) {
        return ordersMapper.selectById(id);
    }

    public List<Orders> selectAll(Orders orders) {
        return ordersMapper.selectAll(orders);
    }
    public List<Orders> selectYulist(Orders orders) {return ordersMapper.yqlist();}
    public PageInfo<Orders> selectPage(Orders orders, Integer pageNum, Integer pageSize) {
        // 用户只查询自己的订单
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            orders.setUserId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Orders> list = ordersMapper.selectAll(orders);
        for (Orders o : list) {
            String time = o.getTime();

        }
        return PageInfo.of(list);
    }

    public Integer selectDayCount(String day) {
        return ordersMapper.selectDayCount(day);
    }
    public Integer selectNum1() {return ordersMapper.selectCount1();}

    public Integer selectNum2() {return ordersMapper.selectCount2();}

    public List<Pie> pie5(){
        return ordersMapper.pie5();
    }



    public List<OrderExcelVO> selectByIds(List<Integer> ids) {
        // 调用 Mapper 方法，返回 List<OrderExcelVO>
        return ordersMapper.selectByIds(ids);
    }
}
