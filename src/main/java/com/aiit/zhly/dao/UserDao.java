package com.aiit.zhly.dao;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
public interface UserDao {
    //登录
    Integer login(String username,String password);
}
