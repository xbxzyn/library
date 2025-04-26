package com.example.entity;

/**
 * 订单明细
 */
public class OrdersItem {
    /** ID */
    private Integer id;
    /** 图书ID */
    private Integer bookId;
    /** 图书名称 */
    private String bookName;
    /** 图书封面 */
    private String bookCover;
    /** 数量 */
    private Integer num;
    /** 借书订单ID */
    private Integer orderId;

    /** 用户ID */
    private Integer userId;
    /** 用户名 */
    private String username;
    /** 用户姓名 */
    private String userName;
    /** 用户头像 */
    private String avatar;
    /** 用户角色 */
    private String role;
    /** 用户电话 */
    private String phone;
    /** 用户邮箱 */
    private String email;
    /** 用户积分 */
    private Integer score;
    /** 用户年级 */
    private String nianji;
    /** 用户班级 */
    private String banji;
    /** 用户备注 */
    private String bzr;

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public void setNianji(String nianji) {
        this.nianji = nianji;
    }

    public void setBanji(String banji) {
        this.banji = banji;
    }

    public void setBzr(String bzr) {
        this.bzr = bzr;
    }

    public Integer getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public String getUserName() {
        return userName;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getRole() {
        return role;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Integer getScore() {
        return score;
    }

    public String getNianji() {
        return nianji;
    }

    public String getBanji() {
        return banji;
    }

    public String getBzr() {
        return bzr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }



}
