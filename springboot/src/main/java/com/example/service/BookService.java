package com.example.service;

import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Book;
import com.example.mapper.BookMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class BookService {

    @Resource
    private BookMapper bookMapper;

    public void add(Book book) {
        bookMapper.insert(book);
    }

    public void updateById(Book book) {
        bookMapper.updateById(book);
    }

    public void deleteById(Integer id) {
        bookMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            bookMapper.deleteById(id);
        }
    }

    public Book selectById(Integer id) {
        return bookMapper.selectById(id);
    }

    public List<Book> selectAll(Book book) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser !=null){
            if (RoleEnum.USER.name().equals(currentUser.getRole())) {
                book.setGrounding(true);   // 如果用户角色是普通用户 (USER)，则将 book 对象的 grounding 属性设置为 true，表示只查询已上架的图书。
            }
        }

        return bookMapper.selectAll(book);
    }
   //分页
    public PageInfo<Book> selectPage(Book book, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser!=null){
            if (RoleEnum.USER.name().equals(currentUser.getRole())) {
                book.setGrounding(true);   // 普通用户只能看到上架的图书
            }
        }
        // 确保 pageSize 被设置为 12，如果前端未传递，则默认为 12
        if (pageSize == null) {
            pageSize = 12;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Book> list = bookMapper.selectAll(book);
        return PageInfo.of(list);
    }

    public List<Book> selectHot() {
        return bookMapper.selectHot();
    }//选择热门书籍，书籍为前五本
}
