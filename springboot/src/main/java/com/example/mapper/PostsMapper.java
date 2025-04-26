package com.example.mapper;

import com.example.entity.Posts;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface PostsMapper {

    int insert(Posts posts);

    void updateById(Posts posts);

    void deleteById(Integer id);

    @Select(" select posts.*, user.name as userName from `posts`" +
            "        left join user on posts.user_id = user.id where posts.id = #{id}")
    Posts selectById(Integer id);

    List<Posts> selectAll(Posts posts);

    @Update("update posts set read_count = read_count + 1 where id = #{id}")
    void updateReadCount(Integer id);

    @Select("select count(*) from posts where section_id = #{sectionId}")
    Integer selectBySectionId(Integer sectionId);
}
