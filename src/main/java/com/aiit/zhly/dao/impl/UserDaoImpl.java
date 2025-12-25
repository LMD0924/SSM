package com.aiit.zhly.dao.impl;

import com.aiit.zhly.dao.UserDao;
import com.aiit.zhly.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Service
public class UserDaoImpl implements UserDao {
    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer login(String username, String password) {
        return userMapper.login(username,password);
    }
}
