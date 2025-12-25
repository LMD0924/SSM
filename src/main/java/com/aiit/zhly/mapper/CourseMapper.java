package com.aiit.zhly.mapper;

import com.aiit.zhly.entity.Course;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Mapper
public interface CourseMapper {
    //查询课程
    @Select("select * from course")
    List<Course> selectCourse();
    //增加课程
    @Insert("insert into course (course_name,course_code,course_teacher,course_size,teacher) VALUES (#{courseName}, #{courseCode}, #{courseTeacher}, #{courseSize}, #{teacher})")
    void insertCourse(Course course);
    //删除课程
    @Delete("delete from course where id=#{id}")
    void deleteCourse(Integer id);
}
