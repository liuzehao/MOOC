/*
* StudentInfoVO.java
* Created on  2014-11-4 下午2:57
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.student.model;

import com.genghis.prometheus.admin.college.CollegeVO;
import com.genghis.prometheus.admin.profession.ProfessionVO;
import com.genghis.steed.mybatis.model.PageBase;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
public class StudentVO extends PageBase {
    //学号
    private String studentId;
    //学生姓名
    private String studentName;
    //学院
    private CollegeVO collegeVO;
    //专业
    private ProfessionVO professionVO;;
    //电子邮件
    private String email;
    //学生昵称
    private String studentNikeName;
    //学生头像链接
    private String studentImage;
    //上次学习url记录
    private String lastStudyUrl;

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public CollegeVO getCollegeVO() {
        return collegeVO;
    }

    public void setCollegeVO(CollegeVO collegeVO) {
        this.collegeVO = collegeVO;
    }

    public ProfessionVO getProfessionVO() {
        return professionVO;
    }

    public void setProfessionVO(ProfessionVO professionVO) {
        this.professionVO = professionVO;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStudentNikeName() {
        return studentNikeName;
    }

    public void setStudentNikeName(String studentNikeName) {
        this.studentNikeName = studentNikeName;
    }

    public String getStudentImage() {
        return studentImage;
    }

    public void setStudentImage(String studentImage) {
        this.studentImage = studentImage;
    }

    public String getLastStudyUrl() {
        return lastStudyUrl;
    }

    public void setLastStudyUrl(String lastStudyUrl) {
        this.lastStudyUrl = lastStudyUrl;
    }
}
