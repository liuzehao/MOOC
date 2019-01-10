/*
* UserManager.java
* Created on  2013-10-21 上午7:44
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-10-21       gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.security.service.impl;

import com.genghis.prometheus.security.dao.RoleDao;
import com.genghis.prometheus.security.dao.UserDao;
import com.genghis.prometheus.security.entity.User;
import com.genghis.prometheus.security.service.UserService;
import com.genghis.prometheus.util.LoginUserUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;

    @Override
    public User findUserByLoginName(String loginName) {
        return userDao.findUserByLoginName(loginName);
    }

    @Override
    public List<String> getRolesByLoginName(String loginName) {
        return roleDao.findAllRoleNamesByLoginName(loginName);
    }

    @Override
    public List<String> getPermTokensByLoginName(String loginName) {
        List<String> rolePermTokens = roleDao.findAllRolePermTokensByLoginName(loginName);
        Map<String, String> map = new HashMap<>();
        for (String permToken : rolePermTokens) {
            map.put(permToken, permToken);
        }
        List<String> userPermTokensList = userDao.findAllUserPermTokensByUserId(loginName);
        for (String permToken : userPermTokensList) {
            map.put(permToken, permToken);
        }
        return new ArrayList<>(map.keySet());
    }

    public String loginPost(User user, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword(), user.isRememberMe());
        try {
            currentUser.login(token);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "用户名或密码错误！");
            return "redirect:/login";
        }
        if (currentUser.isAuthenticated()) {
            user = userDao.findRoleIdByLoginName(LoginUserUtil.getLoginName());
            if (user.getRoleId().equals("0")) return "admin/getAdminInfo";
            if (user.getRoleId().equals("2")) return "study/getStudyPage";
            else return "client/getClientListDo";
        } else {
            redirectAttributes.addFlashAttribute("message", "用户名或密码错误！");
            return "redirect:/login";
        }
    }

    @Override
    public String validateUser(String loginName, String password) {
        User user = findUserByLoginName(loginName);
        if( user != null && password.equals(user.getPassword())){
            return "true";
        }
        return "false";
    }

}
