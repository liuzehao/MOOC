/*
* TeacherController.java
* Created on  2014-11-5 上午8:19
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-5       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin;

import com.genghis.prometheus.admin.teacher.model.TeacherVO;
import com.genghis.prometheus.admin.teacher.service.TeacherService;
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
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    /**
     * Add Teacher Basic Information
     */
    @RequestMapping("/toAddTeacherInfo")
    public String toAddTeacherInfo() {

        return "admin/teacher/addTeacherInfo";
    }

    @RequestMapping("/addTeacherInfo")
    @ResponseBody
    public AjaxResponse addTeacherInfo(@RequestBody TeacherVO teacherVO) {

        try {
            teacherService.addTeacherInfo(teacherVO);
        } catch (Exception e) {
            LoggerFactory.getLogger(TeacherController.class).error("error:", e);
            return new AjaxResponse(ReturnState.ERROR, e.getMessage());
        }

        return new AjaxResponse(teacherVO.getTeacherId());
    }

    /**
     * Delete Teacher Information
     *
     * @return ModelAndView
     * @
     * @since Ver 2.0.0
     */
    @RequestMapping("/deleteManyTeacherInfo")
    @ResponseBody
    public String deleteManyTeacherInfo(@RequestParam("teacherIds[]") String[] teacherIds) {

        teacherService.deleteManyTeacherInfo(teacherIds);

        return "";
    }

    @RequestMapping("/deleteTeacherInfo")
    @ResponseBody
    public String deleteTeacherInfo(String teacherId) {

        teacherService.deleteTeacherInfo(teacherId);

        return "";
    }

    /**
     * Jump To modifyTeacherInfo Page
     *
     * @return ModelAndView
     * @
     * @since Ver 2.0.0
     */
    @RequestMapping("/showTeacherInfo")
    @ResponseBody
    public TeacherVO showTeacherInfo(String teacherId) {

        TeacherVO teacherVO = teacherService.showTeacherInfo(teacherId);

        return teacherVO;
    }

    /**
     * Modify Teacher Information
     *
     * @return ModelAndView
     * @
     * @since Ver 2.0.0
     */
    @RequestMapping("/updateTeacherInfo")
    @ResponseBody
    public String updateTeacher(@RequestBody TeacherVO teacherVO) {

        teacherService.updateTeacherInfo(teacherVO);

        return "";
    }
}
