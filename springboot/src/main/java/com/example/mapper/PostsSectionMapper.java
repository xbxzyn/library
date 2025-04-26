package com.example.mapper;

import com.example.entity.Pie;
import com.example.entity.PostsSection;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PostsSectionMapper {

    int insert(PostsSection postsSection);

    void updateById(PostsSection postsSection);

    void deleteById(Integer id);

    @Select("select * from `posts_section` where id = #{id}")
    PostsSection selectById(Integer id);

    List<PostsSection> selectAll(PostsSection postsSection);
    //图书借阅可视化图表
    @Select("SELECT category.name ,sum(orders_item.num) value FROM orders_item left join book on orders_item.book_id =book.id  left join category on category.id = book.category_id   group by category.name ")
    List<Pie> pie4();

}
