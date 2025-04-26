package com.example.mapper;

import com.example.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CommentMapper {

    int insert(Comment comment);

    void updateById(Comment comment);

    void deleteById(Integer id);

    @Select("select * from `comment` where id = #{id}")
    Comment selectById(Integer id);

    List<Comment> selectAll(Comment comment);

    List<Comment> selectByModuleAndFid(@Param("module") String module, @Param("fid") Integer fid);

    @Select("select count(*) from comment where module = #{module} and fid = #{fid}")
    Integer selectCount(@Param("module") String module, @Param("fid") Integer fid);

    List<Comment> selectByRootId(Integer rootId);

    @Select("select * from `comment` where pid = #{pid}")
    List<Comment> selectByPid(Integer pid);
}
