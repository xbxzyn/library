package com.example.service;

import com.example.entity.Seat;
import com.example.mapper.SeatMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class SeatService {

    @Resource
    private SeatMapper seatMapper;

    public void add(Seat seat) {
        seat.setStatus("未选");
        seatMapper.insert(seat);
    }

    public void updateById(Seat seat) {
        seatMapper.updateById(seat);
    }

    public void deleteById(Integer id) {
        seatMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            seatMapper.deleteById(id);
        }
    }

    public Seat selectById(Integer id) {
        return seatMapper.selectById(id);
    }

    public List<Seat> selectAll(Seat seat) {
        return seatMapper.selectAll(seat);
    }

    public PageInfo<Seat> selectPage(Seat seat, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Seat> list = seatMapper.selectAll(seat);
        return PageInfo.of(list);
    }

}
