package com.example.entity;

import com.alibaba.excel.annotation.ExcelProperty;

public class OrderExcelVO {
    @ExcelProperty("书籍名称")
    private String name;

    @ExcelProperty("借书编号")
    private String orderNo;

    @ExcelProperty("借书时间")
    private String time;
    @ExcelProperty("归还时间")
    private String ghtime;

    @ExcelProperty("姓名")
    private String username;
    @ExcelProperty("学号")
    private String useraccount;
    @ExcelProperty("电话号码")
    private String phone;
    @ExcelProperty("班级")
    private String banji;
    @ExcelProperty("年级")
    private String nianji;
    @ExcelProperty("状态")
    private String status;

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

    public String getGhtime() {
        return ghtime;
    }

    public void setGhtime(String ghtime) {
        this.ghtime = ghtime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBanji() {
        return banji;
    }

    public void setBanji(String banji) {
        this.banji = banji;
    }

    public String getNianji() {
        return nianji;
    }

    public void setNianji(String nianji) {
        this.nianji = nianji;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
