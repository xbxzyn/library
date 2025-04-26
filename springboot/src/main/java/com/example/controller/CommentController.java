package com.example.controller;

import cn.hutool.core.util.StrUtil;
import com.example.common.Result;
import com.example.entity.Comment;
import com.example.service.CommentService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/comment")
public class CommentController {

    @Resource
    private CommentService commentService;

    /**
     * 新增
     */
//    @PostMapping("/add")
//    public Result add(@RequestBody Comment comment) {
//        commentService.add(comment);
//        return Result.success();
//    }
    @PostMapping("/add")
    public Result add(@RequestBody Comment comment) {
        // 检查输入是否为空
        if (comment == null || isCommentEmpty(comment)) {
            return Result.error("评论内容不能为空");
        }
        // 调用Service层添加评论
        commentService.add(comment);
        return Result.success();
    }

    private boolean isCommentEmpty(Comment comment) {
        return StrUtil.isBlank(comment.getContent());
    }
    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody Comment comment) {
        commentService.updateById(comment);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        commentService.deleteById(id);
        return Result.success();
    }

    /**
     * 递归删除
     */
    @DeleteMapping("/deepDelete/{pid}")
    public Result deepDelete(@PathVariable Integer pid) {
        commentService.deepDelete(pid);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        commentService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Comment comment = commentService.selectById(id);
        return Result.success(comment);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Comment comment) {
        List<Comment> list = commentService.selectAll(comment);
        return Result.success(list);
    }

    /**
     * 查询树形结构的数据
     */
    @GetMapping("/selectTree/{module}/{fid}")
    public Result selectTree(@PathVariable String module, @PathVariable Integer fid,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize) {
        PageInfo<Comment> pageInfo = commentService.selectTree(module, fid, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    @GetMapping("/selectCount/{module}/{fid}")
    public Result selectCount(@PathVariable String module, @PathVariable Integer fid) {
        Integer count = commentService.selectCount(module, fid);
        return Result.success(count);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Comment comment,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Comment> pageInfo = commentService.selectPage(comment, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
