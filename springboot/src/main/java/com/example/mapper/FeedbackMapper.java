package com.example.mapper;

import com.example.entity.Feedback;
import com.example.entity.Posts;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface FeedbackMapper {

    int insert(Feedback posts);

    void updateById(Feedback posts);

    void deleteById(Integer id);

    @Select(" select posts.*, user.name as userName from `feedback`" +
            "        left join user on feedback.user_id = user.id where feedback.id = #{id}")
    Feedback selectById(Integer id);

    List<Feedback> selectAll(Feedback posts);



}
