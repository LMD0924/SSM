package com.aiit.zhly.dao;

import com.aiit.zhly.entity.Course;

import java.util.List;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
public interface CourseDao {
    //查询课程
    List<Course> selectCourse();
    //增加课程
    void insertCourse(Course course);
    //删除课程
    void deleteCourse(Integer id);
}
