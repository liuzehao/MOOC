/*
* StudentInfoVO.java
* Created on  2014-11-4 下午2:57
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.researchroom;

import com.genghis.steed.mybatis.model.PageBase;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
public class ResearchRoomVO extends PageBase {
    //学号
    private String researchRoomId;
    //学生姓名
    private String researchRoomName;

    private String collegeId;

    public String getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(String collegeId) {
        this.collegeId = collegeId;
    }

    public String getResearchRoomId() {
        return researchRoomId;
    }

    public void setResearchRoomId(String researchRoomId) {
        this.researchRoomId = researchRoomId;
    }

    public String getResearchRoomName() {
        return researchRoomName;
    }

    public void setResearchRoomName(String researchRoomName) {
        this.researchRoomName = researchRoomName;
    }
}
