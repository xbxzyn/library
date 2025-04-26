package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Account;
import com.example.entity.Feedback;
import com.example.mapper.FeedbackMapper;
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
public class FeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    public void add(Feedback posts) {
        Account currentUser = TokenUtils.getCurrentUser();
        posts.setUserId(currentUser.getId());
        posts.setTime(DateUtil.now());
        posts.setStatus("未回复");
        feedbackMapper.insert(posts);
    }

    public void updateById(Feedback posts) {
        feedbackMapper.updateById(posts);
    }

    public void deleteById(Integer id) {
        feedbackMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            feedbackMapper.deleteById(id);
        }
    }

    public Feedback selectById(Integer id) {
        return feedbackMapper.selectById(id);
    }

    public List<Feedback> selectAll(Feedback posts) {
        return feedbackMapper.selectAll(posts);
    }

    public PageInfo<Feedback> selectPage(Feedback posts, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Feedback> list = feedbackMapper.selectAll(posts);

        return PageInfo.of(list);
    }

//    public void updateReadCount(Integer id) {
//        feedbackMapper.updateReadCount(id);
//    }
}
