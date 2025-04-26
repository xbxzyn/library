package com.example.controller;

import com.example.common.Result;
import com.example.entity.Feedback;
import com.example.service.FeedbackService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/feedback")
public class FeedbackController {

    @Resource
    private FeedbackService feedbackService;


    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Feedback posts) {
        feedbackService.add(posts);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody Feedback posts) {
        feedbackService.updateById(posts);
        return Result.success();
    }

//    @PutMapping("/updateReadCount/{id}")
//    public Result updateReadCount(@PathVariable Integer id) {
//        feedbackService.updateReadCount(id);
//        return Result.success();
//    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        feedbackService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        feedbackService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Feedback posts = feedbackService.selectById(id);
        return Result.success(posts);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Feedback posts) {
        List<Feedback> list = feedbackService.selectAll(posts);
        return Result.success(list);
    }



    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Feedback posts,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Feedback> pageInfo = feedbackService.selectPage(posts, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
