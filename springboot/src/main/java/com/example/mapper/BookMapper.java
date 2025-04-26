package com.example.mapper;

import com.example.entity.Book;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BookMapper {

    int insert(Book book);

    void updateById(Book book);

    void deleteById(Integer id);

    @Select("select * from `book` where id = #{id}")
    Book selectById(Integer id);

    List<Book> selectAll(Book book);

    List<Book> selectHot();

}
