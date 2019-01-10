package com.genghis.prometheus.security.service;

import com.genghis.prometheus.security.entity.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {

    ModelAndView loginPost(HttpServletRequest request, User user);

}