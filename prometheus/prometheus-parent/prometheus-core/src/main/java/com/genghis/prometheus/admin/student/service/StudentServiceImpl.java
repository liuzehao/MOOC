/*
* StudentServiceImpl.java
* Created on  2014-11-4 下午4:49
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.student.service;

import com.genghis.prometheus.admin.student.dao.StudentDao;
import com.genghis.prometheus.admin.student.model.StudentVO;
import com.genghis.prometheus.exception.ValidateErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author weixuda
 * @version 1.0.1
 */
@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;

    @Override
    public List<StudentVO> getStudentInfoList(StudentVO studentVO) {
        return studentDao.getStudentInfoList(studentVO);
    }

    @Override
    public StudentVO getStudentInfo(String studentId) {
        return studentDao.getStudentInfo(studentId);
    }

    @Override
    public void addStudentInfo(StudentVO studentVO) {
        checkStudentId(studentVO);
        studentDao.addStudentInfo(studentVO);
    }

    private void checkStudentId(StudentVO studentVO) {
        if (studentDao.checkStudentId(studentVO) > 0) {
            throw new ValidateErrorException("学生学号已存在");
        }
    }

    /**
     * Delete Student Information
     */
    @Override
    public void deleteManyStudentInfo(String[] StudentIds) {

        studentDao.deleteManyStudentInfo(StudentIds);

        studentDao.deleteManyStudentCourseInfo(StudentIds);
    }

    /**
     * Query Student Information
     */
    @Override
    public StudentVO showStudentInfo(String studentId) {
        return studentDao.showStudentInfo(studentId);
    }

    /**
     * Modify Student Information
     */
    @Override
    public void updateStudentInfo(StudentVO studentVO) {
        studentDao.updateStudentInfo(studentVO);
    }
    @Override
    public void adduser(String username,String password) {
        studentDao.adduser(username,password);

    }
}
