package com.example.mapper;

import com.example.entity.Sign;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SignMapper {

    int insert(Sign sign);

    void updateById(Sign sign);

    void deleteById(Integer id);

    @Select("select * from `sign` where id = #{id}")
    Sign selectById(Integer id);

    List<Sign> selectAll(Sign sign);

    @Select("select * from `sign` where activity_id = #{activityId} and user_id = #{userId}")
    Sign selectByActivityIdAndUserId(@Param("activityId") Integer activityId, @Param("userId") Integer userId);

    @Select("select count(*) from `sign` where activity_id = #{activityId}")
    Integer selectByActivityId(Integer activityId);

}
