/*
* StudentDao.java
* Created on  2014-11-4 下午4:54
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.student.dao;

import com.genghis.prometheus.admin.student.model.StudentVO;
import com.genghis.steed.annotation.mybatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@mybatisRepository
public interface StudentDao {

    List<StudentVO> getStudentInfoList(StudentVO studentVO);

    StudentVO getStudentInfo(String studentId);

    void addStudentInfo(StudentVO studentVO);

    void deleteManyStudentInfo(@Param("studentIds") String[] studentIds);

    void deleteManyStudentCourseInfo(@Param("studentIds") String[] studentIds);

    StudentVO showStudentInfo(String studentId);

    void updateStudentInfo(StudentVO studentVO);

    int checkStudentId(StudentVO studentVO);

    void adduser(@Param("username")String username,@Param("password")String password);

}
