package com.example.service;

import com.example.entity.Activity;
import com.example.mapper.ActivityMapper;
import com.example.mapper.SignMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class ActivityService {

    @Resource
    private ActivityMapper activityMapper;
    @Resource
    SignMapper signMapper;

    public void add(Activity activity) {
        activityMapper.insert(activity);
    }

    public void updateById(Activity activity) {
        activityMapper.updateById(activity);
    }

    public void deleteById(Integer id) {
        activityMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            activityMapper.deleteById(id);
        }
    }

    public Activity selectById(Integer id) {
        Activity activity = activityMapper.selectById(id);
        Integer signCount = signMapper.selectByActivityId(activity.getId());
        activity.setSignCount(signCount);
        return activity;
    }

    public List<Activity> selectAll(Activity activity) {
        return activityMapper.selectAll(activity);
    }

    public PageInfo<Activity> selectPage(Activity activity, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Activity> list = activityMapper.selectAll(activity);
        for (Activity a : list) {
            Integer signCount = signMapper.selectByActivityId(a.getId());
            a.setSignCount(signCount);
        }
        return PageInfo.of(list);
    }

}
