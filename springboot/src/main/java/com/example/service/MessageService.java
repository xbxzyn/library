package com.example.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Comment;
import com.example.entity.Message;
import com.example.mapper.CommentMapper;
import com.example.mapper.MessageMapper;
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
public class MessageService {

    @Resource
    private MessageMapper messageMapper;


    public void updateById(Message comment) {
        messageMapper.updateById(comment);
    }

    public void deleteById(Integer id) {
        messageMapper.deleteById(id);
    }


    public Message selectById(Integer id) {
        return messageMapper.selectById(id);
    }

    public List<Message> selectAll(Message comment) {
        return messageMapper.selectAll(comment);
    }

    public PageInfo<Message> selectPage(Message message, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser!=null){
            if (RoleEnum.USER.name().equals(currentUser.getRole())) {
                message.setUserId(currentUser.getId());
            }
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Message> list = messageMapper.selectAll(message);
        return PageInfo.of(list);
    }



//    public Integer selectCount(String module, Integer fid) {
//        return commentMapper.selectCount(module, fid);
//    }

}
