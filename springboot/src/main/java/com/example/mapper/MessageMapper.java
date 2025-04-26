package com.example.mapper;

import com.example.entity.Message;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MessageMapper {

    int insert(Message param);

    void updateById(Message param);

    void deleteById(Integer id);

    @Select("select * from `message` where id = #{id}")
    Message selectById(Integer id);

    List<Message> selectAll(Message param);

    @Select("select * from `message` where  user_id = #{userId}")
    Message selectByUserId( @Param("userId") Integer userId);
}
