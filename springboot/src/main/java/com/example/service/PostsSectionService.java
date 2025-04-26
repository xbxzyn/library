package com.example.service;

import com.example.entity.Pie;
import com.example.entity.PostsSection;
import com.example.mapper.PostsSectionMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class PostsSectionService {

    @Resource
    private PostsSectionMapper postsSectionMapper;

    public void add(PostsSection postsSection) {
        postsSectionMapper.insert(postsSection);
    }

    public void updateById(PostsSection postsSection) {
        postsSectionMapper.updateById(postsSection);
    }

    public void deleteById(Integer id) {
        postsSectionMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            postsSectionMapper.deleteById(id);
        }
    }

    public PostsSection selectById(Integer id) {
        return postsSectionMapper.selectById(id);
    }

    public List<PostsSection> selectAll(PostsSection postsSection) {
        return postsSectionMapper.selectAll(postsSection);
    }

    public List<Pie> pie4() {
        return postsSectionMapper.pie4();
    }



    public PageInfo<PostsSection> selectPage(PostsSection postsSection, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<PostsSection> list = postsSectionMapper.selectAll(postsSection);
        return PageInfo.of(list);
    }

}
