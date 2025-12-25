package com.aiit.zhly.controller;

import com.aiit.zhly.dao.CourseDao;
import com.aiit.zhly.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Controller
public class CourseController {
    @Autowired
    private CourseDao courseDao;

    //查询课程
    @RequestMapping("/courseList")
    public String selectCourse(Model model){
        List<Course> courses= courseDao.selectCourse();
        model.addAttribute("courses",courses);
        return "list";
    }
    //跳转到添加页面
    @RequestMapping("/toAddCourse")
    public String toAddCourse(){
        return "add";
    }

    //添加课程
    @RequestMapping("/insertCourse")
    public String insertCourse(Course course){
        courseDao.insertCourse(course);
        //添加后重定向到查询页面
        return "redirect:/courseList";
    }
    //删除课程
    @RequestMapping("/deleteCourse")
    public String deleteCourse(Integer id){
        courseDao.deleteCourse(id);
        return "redirect:/courseList";
    }
}
