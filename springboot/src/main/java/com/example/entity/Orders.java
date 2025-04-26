package com.example.entity;

import java.util.List;

/**
 * 订单信息
 */
public class Orders {
    /** ID */
    private Integer id;
    /** 书籍名称 */
    private String name;
    /** 借书编号 */
    private String orderNo;
    /** 借书时间 */
    private String time;
    /** 用户ID */
    private Integer userId;
    /** 状态 */
    private String status;
    /** 用户名 */
    private String userName;


    /** 书籍ID */
    private Integer bookId;
    /** 数量 */
    private Integer num;
    /** 收藏书单 */
    private List<Cart> cartList;
    /** 收藏书单 */

    private String ghtime;
    /** 续借天数 */


    private String sfyq;

    public String getSfyq() {
        return sfyq;
    }

    public void setSfyq(String sfyq) {
        this.sfyq = sfyq;
    }

    public String getGhtime() {
        return ghtime;
    }

    public void setGhtime(String ghtime) {
        this.ghtime = ghtime;
    }


    public List<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }



    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}