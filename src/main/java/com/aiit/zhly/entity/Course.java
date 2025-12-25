package com.aiit.zhly.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * @Author:总会落叶
 * @Date:2025/12/24
 * @Description:
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    private Integer id;
    private String courseName;//课程名称
    private String courseCode;//课程代码
    private String courseTeacher;//授课老师
    private String teacher;//课程老师
    private Integer courseSize;//课程人数
}
