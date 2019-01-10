package com.genghis.prometheus.security.service;


import com.genghis.prometheus.security.entity.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ChenL
 * Date: 13-11-1
 * Time: 上午9:14
 * To change this template use File | Settings | File Templates.
 */
public interface UserService {

    List<String> getRolesByLoginName(String loginName);

    List<String> getPermTokensByLoginName(String loginName);

    User findUserByLoginName(String loginName);

    String loginPost(User user, RedirectAttributes redirectAttributes, HttpServletRequest request);

    String validateUser(String loginName, String password);

}
