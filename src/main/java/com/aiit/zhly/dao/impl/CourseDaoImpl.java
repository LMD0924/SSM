package com.aiit.zhly.dao.impl;

import com.aiit.zhly.dao.CourseDao;
import com.aiit.zhly.entity.Course;
import com.aiit.zhly.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Service
public class CourseDaoImpl implements CourseDao {
    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> selectCourse() {
        return courseMapper.selectCourse();
    }

    @Override
    public void insertCourse(Course course) {
            courseMapper.insertCourse(course);
    }

    @Override
    public void deleteCourse(Integer id) {
            courseMapper.deleteCourse(id);
    }
}
