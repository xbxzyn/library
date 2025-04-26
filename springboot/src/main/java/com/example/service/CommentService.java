package com.example.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Comment;
import com.example.mapper.CommentMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class CommentService {

    @Resource
    private CommentMapper commentMapper;

    public void add(Comment comment) {
        Account currentUser = TokenUtils.getCurrentUser();
        comment.setUserId(currentUser.getId());
        comment.setTime(DateUtil.now());
        commentMapper.insert(comment);
        Integer id = comment.getId();
        if (comment.getPid() == null) {  // 最外层的评论
            comment.setRootId(id);
        } else {  // 回复的评论
            Integer pid = comment.getPid();
            Comment pComment = commentMapper.selectById(pid);  // 父级评论
            comment.setRootId(pComment.getRootId());
        }
        commentMapper.updateById(comment);
    }

    public void updateById(Comment comment) {
        commentMapper.updateById(comment);
    }

    public void deleteById(Integer id) {
        commentMapper.deleteById(id);
    }

    public void deepDelete(Integer pid) {
        commentMapper.deleteById(pid);  // 删除当前的评论
        List<Comment> children = commentMapper.selectByPid(pid);// 再递归删除子评论
        if (CollUtil.isNotEmpty(children)) {
            for (Comment child : children) {
                this.deepDelete(child.getId());
            }
        }
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            commentMapper.deleteById(id);
        }
    }

    public Comment selectById(Integer id) {
        return commentMapper.selectById(id);
    }

    public List<Comment> selectAll(Comment comment) {
        return commentMapper.selectAll(comment);
    }

    public PageInfo<Comment> selectPage(Comment comment, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            comment.setUserId(currentUser.getId());
//            comment.setModule("book");//将查询的模块限制为书籍
        }
        List<Comment> list = commentMapper.selectAll(comment);
        return PageInfo.of(list);
    }

    public PageInfo<Comment> selectTree(String module, Integer fid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Comment> rootList = commentMapper.selectByModuleAndFid(module, fid);
        for (Comment root : rootList) {
            Integer rootId = root.getRootId();
            List<Comment> children = commentMapper.selectByRootId(rootId);
            root.setChildren(children);
        }
        return PageInfo.of(rootList);
    }

    public Integer selectCount(String module, Integer fid) {
        return commentMapper.selectCount(module, fid);
    }

}
