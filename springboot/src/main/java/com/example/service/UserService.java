package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Admin;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.example.mapper.UserMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class UserService {

    @Resource
    private UserMapper userMapper;

    public void add(User user) {
        User dbUser = userMapper.selectByUsername(user.getUsername());
        if (ObjectUtil.isNotNull(dbUser)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }/** 检查用户名是否已存在  */
        if (ObjectUtil.isEmpty(user.getPassword())) {
            user.setPassword(Constants.USER_DEFAULT_PASSWORD);
            String encryptedPassword = DigestUtils.md5DigestAsHex(Constants.USER_DEFAULT_PASSWORD.getBytes());
            user.setPassword(encryptedPassword);
        }/**设置默认密码  */
        if (ObjectUtil.isEmpty(user.getName())) {
            user.setName(user.getUsername());
        }/**  设置默认用户名: */
        user.setRole(RoleEnum.USER.name());
        user.setScore(100);  // 默认信誉分100分
        userMapper.insert(user);
    }

    public void updateById(User user) {
        userMapper.updateById(user);
    }

    public void deleteById(Integer id) {
        userMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            userMapper.deleteById(id);
        }
    }

    public User selectById(Integer id) {
        return userMapper.selectById(id);
    }

    public List<User> selectAll(User user) {
        return userMapper.selectAll(user);
    }

    public PageInfo<User> selectPage(User user, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = userMapper.selectAll(user);
        return PageInfo.of(list);
    }


    public User getUser(String username){
        return userMapper.selectByUsername(username);
    }
    /**
     * 登录
     */
    public User login(Account account) {
        User dbUser = userMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbUser)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }/**检查用户是否存在:*/
        // 对输入的密码进行 MD5 加密
        String encryptedInputPassword = DigestUtils.md5DigestAsHex(account.getPassword().getBytes());

        // 比较加密后的密码
        if (!dbUser.getPassword().equals(encryptedInputPassword)) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
         /**生成token*/
        String token = TokenUtils.createToken(dbUser.getId() + "-" + dbUser.getRole(), dbUser.getPassword());
        dbUser.setToken(token);
        return dbUser;
    }

    /**
     * 修改密码
     */
    public void updatePassword(Account account) {
        User dbUser = userMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbUser)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }/**检查用户是否存在:*/
        // 对输入的旧密码进行 MD5 加密
        String encryptedOldPassword = DigestUtils.md5DigestAsHex(account.getPassword().getBytes());

        // 验证旧密码
        if (!dbUser.getPassword().equals(encryptedOldPassword)) {
            throw new CustomException(ResultCodeEnum.PARAM_PASSWORD_ERROR);
        }
        /**验证旧密码*/

        // 对输入的新密码进行 MD5 加密
        String encryptedNewPassword = DigestUtils.md5DigestAsHex(account.getNewPassword().getBytes());

        // 设置新密码
        dbUser.setPassword(encryptedNewPassword);
        userMapper.updateById(dbUser);
    }

}
