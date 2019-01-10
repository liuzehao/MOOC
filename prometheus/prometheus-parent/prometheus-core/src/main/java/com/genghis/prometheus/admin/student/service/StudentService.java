/*
* studentService.java
* Created on  2014-11-4 下午4:46
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.student.service;

import com.genghis.prometheus.admin.student.model.StudentVO;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author wexuda
 * @version 1.0.1
 */
public interface StudentService {

    List<StudentVO> getStudentInfoList(StudentVO studentVO);

    StudentVO getStudentInfo(String studentId);

    void addStudentInfo(StudentVO studentVO);

    void deleteManyStudentInfo(String[] studentIds);

    StudentVO showStudentInfo(String studentId);

    void updateStudentInfo(StudentVO studentVO);
     //自己加的
    void adduser(String username,String password);
}
