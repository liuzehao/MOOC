/*
* StudentController.java
* Created on  2014-11-5 上午8:19
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-5       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin;

import com.genghis.prometheus.admin.student.model.StudentVO;
import com.genghis.prometheus.admin.student.service.StudentService;
import com.genghis.steed.ajax.response.AjaxResponse;
import com.genghis.steed.ajax.response.ReturnState;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Class Description
 *
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("/toAddStudentInfo")
    public String toAddStudentInfo() {

        return "admin/student/addStudentInfo";
    }

    @RequestMapping("/addStudentInfo")
    @ResponseBody
    public AjaxResponse addStudentInfo(@RequestBody StudentVO studentVO) {

        try {
            studentService.addStudentInfo(studentVO);
        } catch (Exception e) {
            LoggerFactory.getLogger(StudentController.class).error("error:", e);
            return new AjaxResponse(ReturnState.ERROR, e.getMessage());
        }

        return new AjaxResponse(studentVO.getStudentId());
    }

    /**
     * Delete Student Information
     *
     * @return ModelAndView
     * @
     * @since Ver 2.0.0
     */
    @RequestMapping("/deleteManyStudentInfo")
    @ResponseBody
    public String deleteManyStudentInfo(@RequestParam("studentIds[]") String[] studentIds) {

        studentService.deleteManyStudentInfo(studentIds);

        return "";
    }

    /**
     * Jump To modifyStudentInfo Page
     *
     * @return ModelAndView
     * @
     * @since Ver 2.0.0
     */
    @RequestMapping("/showStudentInfo")
    @ResponseBody
    public StudentVO showStudentInfo(String studentId) {

        StudentVO studentVO = studentService.showStudentInfo(studentId);

        return studentVO;
    }

    /**
     * Modify Student Information
     *
     * @return ModelAndView
     * @
     * @since Ver 2.0.0
     */
    @RequestMapping("/updateStudentInfo")
    @ResponseBody
    public String updateStudent(@RequestBody StudentVO studentVO) {

        studentService.updateStudentInfo(studentVO);

        return "";
    }
}
