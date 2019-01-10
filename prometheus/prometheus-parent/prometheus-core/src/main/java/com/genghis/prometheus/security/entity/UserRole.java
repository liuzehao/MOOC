package com.genghis.prometheus.security.entity;

/**
 * Created with IntelliJ IDEA.
 * User: qinw
 * Date: 13-11-9
 * Time: 下午1:44
 * To change this template use File | Settings | File Templates.
 */
public class UserRole {
    private String userId;
    private String roleId;

    public UserRole() {
    }

    public UserRole(String userId, String roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
