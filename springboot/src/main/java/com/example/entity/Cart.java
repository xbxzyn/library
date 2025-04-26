package com.example.entity;

/**
 * 书单信息
 */
public class Cart {
    /** ID */
    private Integer id;
    /** 图书ID */
    private Integer bookId;
    /** 数量 */
    private Integer num;
    /** 用户ID */
    private Integer userId;
    /** 添加日期 */
    private String time;
    /** 封面 */
    private String bookCover;
    /** 书名 */
    private String bookName;

    public String getBookCover() {
        return bookCover;
    }

    public void setBookCover(String bookCover) {
        this.bookCover = bookCover;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
