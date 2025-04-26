package com.example.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.http.HtmlUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Posts;
import com.example.mapper.PostsMapper;
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
public class PostsService {

    @Resource
    private PostsMapper postsMapper;

    public void add(Posts posts) {
        Account currentUser = TokenUtils.getCurrentUser();
        posts.setUserId(currentUser.getId());
        posts.setTime(DateUtil.now());
        posts.setReadCount(0);
        postsMapper.insert(posts);
    }

    public void updateById(Posts posts) {
        postsMapper.updateById(posts);
    }

    public void deleteById(Integer id) {
        postsMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            postsMapper.deleteById(id);
        }
    }

    public Posts selectById(Integer id) {
        return postsMapper.selectById(id);
    }

    public List<Posts> selectAll(Posts posts) {
        return postsMapper.selectAll(posts);
    }

    public PageInfo<Posts> selectPage(Posts posts, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
//        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
//            posts.setUserId(currentUser.getId());
//        }
        PageHelper.startPage(pageNum, pageSize);
        List<Posts> list = postsMapper.selectAll(posts);
        for (Posts p : list) {
            p.setSimpleContent(HtmlUtil.removeHtmlTag(p.getContent(), true, "img"));
            p.setSimpleContent(HtmlUtil.cleanHtmlTag(p.getSimpleContent()));
        }
        return PageInfo.of(list);
    }

    public void updateReadCount(Integer id) {
        postsMapper.updateReadCount(id);
    }
}
