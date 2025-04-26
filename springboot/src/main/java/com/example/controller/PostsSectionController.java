package com.example.controller;

import com.example.common.Result;
import com.example.entity.PostsSection;
import com.example.service.PostsSectionService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/postsSection")
public class PostsSectionController {

    @Resource
    private PostsSectionService postsSectionService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody PostsSection postsSection) {
        postsSectionService.add(postsSection);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody PostsSection postsSection) {
        postsSectionService.updateById(postsSection);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        postsSectionService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        postsSectionService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        PostsSection postsSection = postsSectionService.selectById(id);
        return Result.success(postsSection);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(PostsSection postsSection) {
        List<PostsSection> list = postsSectionService.selectAll(postsSection);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(PostsSection postsSection,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<PostsSection> pageInfo = postsSectionService.selectPage(postsSection, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
