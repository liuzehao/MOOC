package com.genghis.prometheus.security.entity;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public class Permission {

    private String id;
    private String permToken;
    private String description;


    public Permission() {
        // reserved for JavaBean Instant
    }

    public Permission(String permToken, String description) {
        this.permToken = permToken;
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPermToken() {
        return permToken;
    }

    public void setPermToken(String permToken) {
        this.permToken = permToken;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
