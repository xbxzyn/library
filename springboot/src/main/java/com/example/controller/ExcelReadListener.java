package com.example.controller;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.example.entity.User;
import com.example.service.UserService;
import lombok.val;

import java.util.ArrayList;
import java.util.List;

public class ExcelReadListener implements ReadListener<User> {
    List<User> list = new ArrayList<>();

    private UserService userService;
    public ExcelReadListener(UserService userService){
        this.userService=userService;
    }

    @Override
    public void invoke(User demo, AnalysisContext analysisContext) {
        System.out.println("读取到： "+demo);
        User user = userService.getUser(demo.getUsername());
        if (user ==null){
            demo.setPassword("123456");
            demo.setRole("USER");
            demo.setScore(100);
            userService.add(demo);
            list.add(demo);
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        System.out.println("读取完毕。。。");
    }
}