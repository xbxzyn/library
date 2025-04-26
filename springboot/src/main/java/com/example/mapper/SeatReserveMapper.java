package com.example.mapper;

import com.example.entity.SeatReserve;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SeatReserveMapper {

    int insert(SeatReserve seatReserve);

    void updateById(SeatReserve seatReserve);//更新

    void deleteById(Integer id);

    @Select("select * from `seat_reserve` where id = #{id}")
    SeatReserve selectById(Integer id);

    List<SeatReserve> selectYqlist();//逾期查询

    List<SeatReserve> selectAll(SeatReserve seatReserve);

    List<SeatReserve> findSeat(SeatReserve seatReserve);

    @Select("select count(*) from seat_reserve where time like '%${day}%'")
    Integer selectDayCount(String day);

}
