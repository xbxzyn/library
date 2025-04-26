package com.example.service;

import com.example.entity.Carousel;
import com.example.entity.Room;
import com.example.mapper.CarouselMapper;
import com.example.mapper.RoomMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class CarouselService {

    @Resource
    private CarouselMapper carouselMapper;

    public void add(Carousel room) {
        carouselMapper.insert(room);
    }

    public void updateById(Carousel room) {
        carouselMapper.updateById(room);
    }

    public void deleteById(Integer id) {
        carouselMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            carouselMapper.deleteById(id);
        }
    }

    public Carousel selectById(Integer id) {
        return carouselMapper.selectById(id);
    }

    public List<Carousel> selectAll(Carousel room) {
        return carouselMapper.selectAll(room);
    }

    public PageInfo<Carousel> selectPage(Carousel room, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Carousel> list = carouselMapper.selectAll(room);
        return PageInfo.of(list);
    }

}
