/*
* Role.java
* Created on  2013-9-26 下午10:07
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26       gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.security.entity;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public class Role {

    private String id;
    private String roleName;
    private String description;

    private String permToken;
    private String permId;

    public Role() {
    }

//    public Role(String roleName, String description) {
//        this(0, roleName, description);
//    }

    public Role(String roleName, String description) {
        this.roleName = roleName;
        this.description = description;
    }

    public Role(String id, String roleName, String description) {
        this.id = id;
        this.roleName = roleName;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPermToken() {
        return permToken;
    }

    public void setPermToken(String permToken) {
        this.permToken = permToken;
    }

    public String getPermId() {
        return permId;
    }

    public void setPermId(String permId) {
        this.permId = permId;
    }
}
