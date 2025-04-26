package com.example.service;

import com.example.entity.Room;
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
public class RoomService {

    @Resource
    private RoomMapper roomMapper;

    public void add(Room room) {
        roomMapper.insert(room);
    }

    public void updateById(Room room) {
        roomMapper.updateById(room);
    }

    public void deleteById(Integer id) {
        roomMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            roomMapper.deleteById(id);
        }
    }

    public Room selectById(Integer id) {
        return roomMapper.selectById(id);
    }

    public List<Room> selectAll(Room room) {
        return roomMapper.selectAll(room);
    }

    public PageInfo<Room> selectPage(Room room, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Room> list = roomMapper.selectAll(room);
        return PageInfo.of(list);
    }

}
