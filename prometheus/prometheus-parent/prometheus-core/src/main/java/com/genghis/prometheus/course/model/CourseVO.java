package com.genghis.prometheus.course.model;

import com.genghis.steed.mybatis.model.PageBase;

/**
 * Created by Demon on 2015/1/16.
 */
public class CourseVO extends PageBase{

    //课程编号
    private String courseId;
    //课程名称
    private String courseName;
    //对应树节点
    private String treeId;
    //课程状态
    private String courseState;
    //课程总共的小结数
    private String totalSection;
    //课程图片url
    private String courseImage;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

    public String getCourseState() {
        return courseState;
    }

    public void setCourseState(String courseState) {
        this.courseState = courseState;
    }

    public String getTotalSection() {
        return totalSection;
    }

    public void setTotalSection(String totalSection) {
        this.totalSection = totalSection;
    }

    public String getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(String courseImage) {
        this.courseImage = courseImage;
    }

}
