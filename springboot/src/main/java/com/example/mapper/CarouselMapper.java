package com.example.mapper;

import com.example.entity.Carousel;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CarouselMapper {

    int insert(Carousel room);

    void updateById(Carousel room);

    void deleteById(Integer id);

    @Select("select * from `carousel` where id = #{id}")
    Carousel selectById(Integer id);

    List<Carousel> selectAll(Carousel room);

}
