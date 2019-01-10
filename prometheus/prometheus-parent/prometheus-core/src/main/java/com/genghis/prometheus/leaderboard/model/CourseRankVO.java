package com.genghis.prometheus.leaderboard.model;

import com.genghis.steed.mybatis.model.PageBase;
/**
 * Created by Demon on 2015/1/30.
 */
public class CourseRankVO extends PageBase{
    //学生头像
    private String studentImage;
    //学生姓名
    private String studentName;
    //总积分
    private String totalScore;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(String totalScore) {
        this.totalScore = totalScore;
    }

    public String getStudentImage() {
        return studentImage;
    }

    public void setStudentImage(String studentImage) {
        this.studentImage = studentImage;
    }
}
