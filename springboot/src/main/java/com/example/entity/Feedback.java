package com.example.entity;

import lombok.Data;

/**
 * 反馈意见
 */
@Data
public class Feedback {
    /** ID */
    private Integer id;
    /** 标题 */
    private String title;
    /** 图片 */
    private String hfnr;
    /** 内容 */
    private String content;
    /** 发布人ID */
    private Integer userId;
    /** 发布时间 */
    private String time;
    private String userName;

    private String status;

    private String img;

}