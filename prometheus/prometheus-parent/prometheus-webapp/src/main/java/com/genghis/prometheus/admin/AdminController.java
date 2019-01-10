/*
* AdminController.java
* Created on  2014-11-3 上午10:31
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-3       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin;

import com.genghis.prometheus.admin.student.model.StudentVO;
import com.genghis.prometheus.admin.student.service.StudentService;
import com.genghis.prometheus.admin.teacher.model.TeacherVO;
import com.genghis.prometheus.admin.teacher.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Class Description
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;

    @RequestMapping("/getTeacherInfoList")
    public String getTeacherInfoList(TeacherVO teacherVO, Model model) {

        List<TeacherVO> teacherList = teacherService.getTeacherInfoList(teacherVO);

        model.addAttribute("teacherList", teacherList);
        model.addAttribute("teacherVO", teacherVO);

        return "admin/teacher/getTeacherInfoList";
    }

    @RequestMapping("/getStudentInfoList")
    public String getStudentInfoList(StudentVO studentVO, Model model) {

        List<StudentVO> studentList = studentService.getStudentInfoList(studentVO);

        model.addAttribute("studentList", studentList);
        model.addAttribute("studentVO", studentVO);

        return "admin/student/getStudentInfoList";
    }
}
