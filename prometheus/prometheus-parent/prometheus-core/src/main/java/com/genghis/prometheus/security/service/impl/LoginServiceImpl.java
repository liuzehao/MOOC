//package com.genghis.themis.security.service.impl;
//
//
//
//import com.genghis.themis.security.dao.RoleDao;
//import com.genghis.themis.security.dao.UserDao;
//import com.genghis.themis.security.entity.User;
//import com.genghis.themis.security.service.LoginService;
//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.authc.AuthenticationException;
//import org.apache.shiro.authc.UsernamePasswordToken;
//import org.apache.shiro.subject.Subject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.util.List;
//
//@Transactional
//@Service("loginService")
//public class LoginServiceImpl implements LoginService {
//
//    @Autowired
//    private UserDao userDao;
//
//    public ModelAndView loginPost(HttpServletRequest request, User user) {
//        ModelAndView modelView = new ModelAndView();
//        Subject currentUser = SecurityUtils.getSubject();
//        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
//        try {
//            currentUser.login(token);
//        } catch (AuthenticationException e) {
//            e.printStackTrace();
//            modelView.addObject("message", "用户名或密码错误！");
//            modelView.setViewName("/login");
//        }
//        if (currentUser.isAuthenticated()) {
//            List<User> userList = userDao.findInUseUserByLoginName(user.getLoginName());
//            if (userList.get(0).getRoleId() == "0")
//                modelView.setViewName("client/getClientListDo");
//        } else {
//            modelView.addObject("message", "用户名或密码错误！");
//            modelView.setViewName("/login");
//        }
//        return modelView;
//    }
//}
