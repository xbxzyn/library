package com.example.mapper;

import com.example.entity.Seat;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SeatMapper {

    int insert(Seat seat);

    void updateById(Seat seat);

    void deleteById(Integer id);

    @Select("select * from `seat` where id = #{id}")
    Seat selectById(Integer id);

    List<Seat> selectAll(Seat seat);

}
