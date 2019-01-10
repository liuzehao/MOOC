package com.genghis.prometheus.autoupdate.model;

/**
 * Created by genghis on 14-8-8.
 */
public class UpdateLog {
    private String id;
    private String requestIp;
    private String operateTime;
    private String operateType;
    private String clientId;
    private String originalVersion;
    private String targetVersion;

    public UpdateLog() {
    }

    public UpdateLog(String requestIp, String operateType, String clientId, String originalVersion, String targetVersion) {
        this.requestIp = requestIp;
        this.operateType = operateType;
        this.clientId = clientId;
        this.originalVersion = originalVersion;
        this.targetVersion = targetVersion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRequestIp() {
        return requestIp;
    }

    public void setRequestIp(String requestIp) {
        this.requestIp = requestIp;
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getOriginalVersion() {
        return originalVersion;
    }

    public void setOriginalVersion(String originalVersion) {
        this.originalVersion = originalVersion;
    }

    public String getTargetVersion() {
        return targetVersion;
    }

    public void setTargetVersion(String targetVersion) {
        this.targetVersion = targetVersion;
    }
}
