package com.example.controller;

import com.example.common.Result;
import com.example.entity.Posts;
import com.example.service.CommentService;
import com.example.service.PostsService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/posts")
public class PostsController {

    @Resource
    private PostsService postsService;

    @Resource
    private CommentService commentService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Posts posts) {
        postsService.add(posts);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody Posts posts) {
        postsService.updateById(posts);
        return Result.success();
    }

    @PutMapping("/updateReadCount/{id}")
    public Result updateReadCount(@PathVariable Integer id) {
        postsService.updateReadCount(id);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        postsService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        postsService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Posts posts = postsService.selectById(id);
        return Result.success(posts);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Posts posts) {
        List<Posts> list = postsService.selectAll(posts);
        return Result.success(list);
    }

    @GetMapping("/selectHot")
    public Result selectHot(Posts posts) {
        List<Posts> list = postsService.selectAll(posts);
        // 排序+ 限制个数
        list = list.stream().sorted((p1, p2) -> p2.getReadCount().compareTo(p1.getReadCount())).limit(5).collect(Collectors.toList());
        for (Posts p : list) {
            Integer count = commentService.selectCount("posts", p.getId());// 查询当前这个帖子下面所有的评论数
            p.setCommentCount(count);
        }
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Posts posts,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Posts> pageInfo = postsService.selectPage(posts, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
