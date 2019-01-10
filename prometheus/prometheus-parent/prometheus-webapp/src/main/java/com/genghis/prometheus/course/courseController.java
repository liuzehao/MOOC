package com.genghis.prometheus.course;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.genghis.prometheus.course.model.TreeVO;
import com.genghis.prometheus.admin.student.model.StudentVO;
import com.genghis.prometheus.course.service.CourseService;
import com.genghis.prometheus.leaderboard.service.LeaderBoardService;
import com.genghis.steed.ajax.response.AjaxResponse;
import com.jcraft.jsch.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
/**
 * Created by WangXin on 2015/1/13.
 */

@Controller
@RequestMapping("/course")
public class courseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private LeaderBoardService leaderBoardService;
    @RequestMapping("getCoursePage")
    public ModelAndView getCourse(Model model,HttpServletRequest request,HttpSession session) throws JsonProcessingException {
        try {
            List<HashMap<String, String>> courseList = courseService.getTreeAll(request.getParameter("courseId"), ((StudentVO) session.getAttribute("studentVO")).getStudentId());
            model.addAttribute("tree", new ObjectMapper().writeValueAsString(courseList));
            model.addAttribute("StudyVO", courseService.getStudyInfo(((StudentVO) session.getAttribute("studentVO")).getStudentId(), request.getParameter("courseId")));
        }
        catch (NullPointerException e)
        {
            e.printStackTrace();
        }
        model.addAttribute("CourseLeaderBoardList",leaderBoardService.getCourseLeaderBoardList(request.getParameter("courseId")));
        return new ModelAndView("course/getCoursePage");
    }
    @RequestMapping("updateInfo")
    @ResponseBody
    public String updateInfo(@RequestBody TreeVO treeVO){
        courseService.updateInfo(treeVO);
        return "";
    }
}

