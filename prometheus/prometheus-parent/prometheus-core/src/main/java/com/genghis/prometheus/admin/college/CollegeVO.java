/*
* StudentInfoVO.java
* Created on  2014-11-4 下午2:57
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.college;

import com.genghis.steed.mybatis.model.PageBase;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
public class CollegeVO extends PageBase {
    //学号
    private String collegeId;
    //学生姓名
    private String collegeName;

    public String getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(String collegeId) {
        this.collegeId = collegeId;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }
}
