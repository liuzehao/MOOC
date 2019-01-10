/*
* TeacherDAO.java
* Created on  2014-11-4 下午3:29
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.teacher.dao;

import com.genghis.prometheus.admin.teacher.model.TeacherVO;
import com.genghis.steed.annotation.mybatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Class Description
 *
 * @author weixuda
 * @version 1.0.1
 */
@mybatisRepository
public interface TeacherDao {

    List<TeacherVO> getTeacherInfoList(TeacherVO teacherVO);

    void addTeacherInfo(TeacherVO teacherVO);

    void addTeacherCourseInfo(TeacherVO teacherVO);

    void deleteManyTeacherInfo(@Param("teacherIds") String[] teacherIds);

    void deleteManyTeacherCourseInfo(@Param("teacherIds") String[] teacherIds);

    TeacherVO showTeacherInfo(String teacherId);

    void updateTeacherInfo(TeacherVO teacherVO);

    void updateTeacherCourseInfo(TeacherVO teacherVO);

    int checkTeacherId(TeacherVO teacherVO);

    void deleteTeacherInfo(String teacherId);

    void deleteTeacherCourseInfo(String teacherId);

}
