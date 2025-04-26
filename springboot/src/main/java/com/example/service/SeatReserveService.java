package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Seat;
import com.example.entity.SeatReserve;
import com.example.exception.CustomException;
import com.example.mapper.SeatMapper;
import com.example.mapper.SeatReserveMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class SeatReserveService {

    @Resource
    private SeatReserveMapper seatReserveMapper;

    @Resource
    SeatMapper seatMapper;

    @Transactional
    public void add(SeatReserve seatReserve) {
        Account currentUser = TokenUtils.getCurrentUser();

        List<SeatReserve> list = seatReserveMapper.findSeat(seatReserve);
        if (list.size()>0){
            throw new CustomException("500", "您选择的座位该时段已被预约，请重新选择");
        }
        seatReserve.setUserId(currentUser.getId());
        seatReserve.setTime(DateUtil.now());  // 预约时间
        seatReserve.setStatus("已选");
        seatReserveMapper.insert(seatReserve);

        Seat seat = seatMapper.selectById(seatReserve.getSeatId());  // 查询出座位的信息
        seat.setStatus("已选");
        seatMapper.updateById(seat);
    }

    @Transactional
    public void updateById(SeatReserve seatReserve) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole()) && "已退".equals(seatReserve.getStatus())) {
            Seat seat = seatMapper.selectById(seatReserve.getSeatId());  // 查询出座位的信息
            seat.setStatus("未选");
            seatMapper.updateById(seat);
        }
        seatReserveMapper.updateById(seatReserve);
    }

    public void deleteById(Integer id) {
        seatReserveMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            seatReserveMapper.deleteById(id);
        }
    }

    public SeatReserve selectById(Integer id) {
        return seatReserveMapper.selectById(id);
    }

    public List<SeatReserve> selectAll(SeatReserve seatReserve) {
        return seatReserveMapper.selectAll(seatReserve);
    }

    public PageInfo<SeatReserve> selectPage(SeatReserve seatReserve, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            seatReserve.setUserId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<SeatReserve> list = seatReserveMapper.selectAll(seatReserve);
        return PageInfo.of(list);
    }

    public Integer selectDayCount(String day) {
        return seatReserveMapper.selectDayCount(day);
    }
}
