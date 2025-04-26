package com.example.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;

public class User extends Account {

    /** 主键ID */
    @ExcelIgnore
    private Integer id;
    /** 账号 */
    @ExcelProperty(value = {"学号"},index = 0)
    private String username;
    /** 密码 */
    @ExcelIgnore
    private String password;
    /** 姓名 */
    @ExcelProperty(value = {"姓名"},index = 1)
    private String name;
    /** 头像 */
    @ExcelIgnore
    private String avatar;
    /** 角色 */
    @ExcelIgnore
    private String role;
    /** 电话 */
    @ExcelProperty(value = {"电话"},index = 2)
    private String phone;
    /** 邮箱 */
    @ExcelIgnore
    private String email;
    /** 班级 */
    @ExcelIgnore
    private Integer score;
    @ExcelProperty(value = {"班级"},index = 5)
    private String banji;
    /** 年级 */
    @ExcelProperty(value = {"年级"},index = 4)
    private String nianji;
    /** 班主任 */
    @ExcelProperty(value = {"班主任"},index = 3)
    private String bzr;

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

    public String getBzr() {
        return bzr;
    }

    public void setBzr(String bzr) {
        this.bzr = bzr;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
