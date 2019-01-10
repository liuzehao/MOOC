/*
* TeacherService.java
* Created on  2014-11-4 下午3:18
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.teacher.service;

import com.genghis.prometheus.admin.teacher.model.TeacherVO;

import java.util.List;

/**
 * Class Description
 *
 * @author weixuda
 * @version 1.0.1
 */
public interface TeacherService {

    List<TeacherVO> getTeacherInfoList(TeacherVO teacherVO);

    void addTeacherInfo(TeacherVO teacherVO);

    void deleteManyTeacherInfo(String[] teacherIds);

    void deleteTeacherInfo(String teacherId);

    TeacherVO showTeacherInfo(String teacherId);

    void updateTeacherInfo(TeacherVO teacherVO);

}
