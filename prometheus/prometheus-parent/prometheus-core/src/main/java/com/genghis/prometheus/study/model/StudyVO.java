package com.genghis.prometheus.study.model;

import com.genghis.steed.mybatis.model.PageBase;

/**
 * Created by Demon on 2015/1/15.
 */
public class StudyVO extends PageBase{
    //课程ID
    private  String courseId;
    //课程名字
    private String courseName;
    //课程总学习时间
    private String courseTime;
    //课程学习进度
    private String studyProgressRate;
    //课程学习总积分
    private String totalScore;
    //课程学习进度标记
    private String title;
    //课程登出时间
    private String logoutTime;

    public void setCourseId(String courseId) {this.courseId = courseId; }

    public String getCourseId() {return courseId;}

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseTime(String courseTime){
        this.courseTime = courseTime;
    }

    public String getCourseTime(){
        return courseTime;
    }

    public void setStudyProgressRate(String studyProgressRate){
        this.studyProgressRate = studyProgressRate;
    }

    public String getStudyProgressRate(){
      return studyProgressRate;
    }

    public void setTotalScore(String totalScore) {this.totalScore = totalScore;}

    public String getTotalScore() {return totalScore;}

    public void setTitle(String title) {this.title = title;}

    public String getTitle() {return title;}

    public void getLogoutTime(String logoutTime){this.logoutTime = logoutTime;}

    public String getLogoutTime(){return logoutTime;}
}
