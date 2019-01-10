/*
* TeacherInfoVO.java
* Created on  2014-11-4 下午2:52
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.teacher.model;

import com.genghis.prometheus.admin.college.CollegeVO;
import com.genghis.prometheus.admin.researchroom.ResearchRoomVO;
import com.genghis.prometheus.course.model.CourseVO;
import com.genghis.steed.mybatis.model.PageBase;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
public class TeacherVO extends PageBase {
    //职工号
    private String teacherId;
    //教师姓名
    private String teacherName;
    //学院名称
    private String collegeId;
    //专业名称
    private String researchRoomId;
    //课程
    private CourseVO courseVO;
    //电子邮件
    private String email;
    //电话
    private String telephone;

    private CollegeVO collegeVO;

    private ResearchRoomVO researchRoomVO;

//    public TeacherVO() {
//        collegeVO = new CollegeVO();
//        researchRoomVO=new ResearchRoomVO();
//    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getResearchRoomId() {
        return researchRoomId;
    }

    public void setResearchRoomId(String researchRoomId) {
        this.researchRoomId = researchRoomId;
    }

    public String getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(String collegeId) {
        this.collegeId = collegeId;
    }

    public CourseVO getCourseVO() {
        return courseVO;
    }

    public void setCourseVO(CourseVO courseVO) {
        this.courseVO = courseVO;
    }

    public CollegeVO getCollegeVO() {
           return collegeVO;
    }

    public void setCollegeVO(CollegeVO collegeVO) {
        this.collegeVO = collegeVO;
    }

    public ResearchRoomVO getResearchRoomVO() {
        return researchRoomVO;
    }

    public void setResearchRoomVO(ResearchRoomVO researchRoomVO) {
        this.researchRoomVO = researchRoomVO;
    }

}
