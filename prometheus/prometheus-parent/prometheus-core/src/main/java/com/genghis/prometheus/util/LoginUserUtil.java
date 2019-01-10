package com.genghis.prometheus.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class LoginUserUtil {

    private LoginUserUtil() {
    }

    public static String getLoginName() {
        Subject currentUser = SecurityUtils.getSubject();
        return currentUser.getPrincipal() == null ? "" : (String) currentUser.getPrincipal();
    }
}
