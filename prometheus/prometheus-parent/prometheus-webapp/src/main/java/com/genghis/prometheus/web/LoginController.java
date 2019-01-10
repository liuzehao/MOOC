/*
* LoginController.java
* Created on  2013-10-6 下午12:35
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-10-6       weixuda    初始版本
*
*/
package com.genghis.prometheus.web;

import com.genghis.prometheus.admin.student.service.StudentService;
import com.genghis.prometheus.security.entity.User;
import com.genghis.prometheus.security.service.UserService;
import com.genghis.prometheus.study.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author weixuda
 * @version 1.0.1
 */
@Controller
@RequestMapping()
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private StudyService studyService;
    @Autowired
    private StudentService studentService;
   // @Autowired
   // private StudentService studentService1;
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String loginPost(User user,RedirectAttributes redirectAttributes,HttpServletRequest request,HttpSession session,Model model) {

        String viewName = userService.loginPost(user, redirectAttributes, request);

        if(viewName.equals("study/getStudyPage")){
            model.addAttribute("studyVOList",studyService.getPersonStudyCourseList(user.getLoginName()));
            model.addAttribute("courseVOList",studyService.getCourseInfoList());
            model.addAttribute("studyHistoryVOList",studyService.getStudyHistoryList(user.getLoginName()));
            session.setAttribute("studentVO",studentService.getStudentInfo(user.getLoginName()));
        }
        return viewName;
    }

    @RequestMapping("/loginFront")
    public String login(){
        return "loginFront";
    }

    @RequestMapping(value = "/login/validate", params = {"loginName","password"}, method = RequestMethod.POST)
    @ResponseBody
    public String validatePassword(String loginName, String password){

        return userService.validateUser(loginName,password);
    }

/*自己写的*/
   /*@RequestMapping(value = "sRegister",  method = RequestMethod.POST)
       public String login1(HttpServletRequest request){
       String userName = request.getParameter("username");
        String userPassword = request.getParameter("password");
        studentService1.adduser(userName, userPassword);
        return "successtest";
    }
   // @RequestMapping("/loginFront")
   // public String login2(){
     //   return "loginFront";
   }*/
}
