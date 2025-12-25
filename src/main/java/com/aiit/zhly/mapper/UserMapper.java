package com.aiit.zhly.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Mapper
public interface UserMapper {
    //登录
    @Select("select * from user where username=#{username} and password=#{password}")
    Integer login(String username, String password);
}
