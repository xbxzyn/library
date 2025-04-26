package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Activity;
import com.example.entity.Sign;
import com.example.exception.CustomException;
import com.example.mapper.SignMapper;
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
public class SignService {

    @Resource
    private SignMapper signMapper;
    @Resource
    private ActivityService activityService;

    public void add(Sign sign) {
        Activity activity = activityService.selectById(sign.getActivityId());
        if (activity.getStatus().equals("已结束")) {
            throw new CustomException("500", "对不起，该活动已结束，无法报名");
        }
        Account currentUser = TokenUtils.getCurrentUser();
        // 查询用户是否已报名过
        Sign dbSign = signMapper.selectByActivityIdAndUserId(sign.getActivityId(), currentUser.getId());
        if (dbSign != null) {
            throw new CustomException("500", "对不起，您已报名过该活动");
        }
        sign.setName(currentUser.getUsername());
        sign.setPhone(currentUser.getPhone());
        sign.setTime(DateUtil.now());
        sign.setUserId(currentUser.getId());
        sign.setSign("未签到");
        signMapper.insert(sign);
        //活动的报名人数加1
        activity.setNum(activity.getNum() + 1);
        activityService.updateById(activity); // 更新活动信息
    }

    public void updateById(Sign sign) {
        signMapper.updateById(sign);
    }

    public void deleteById(Integer id) {
        signMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            signMapper.deleteById(id);
        }
    }

    public Sign selectById(Integer id) {
        return signMapper.selectById(id);
    }

    public List<Sign> selectAll(Sign sign) {
        return signMapper.selectAll(sign);
    }

    public PageInfo<Sign> selectPage(Sign sign, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            sign.setUserId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Sign> list = signMapper.selectAll(sign);
        return PageInfo.of(list);
    }

}
