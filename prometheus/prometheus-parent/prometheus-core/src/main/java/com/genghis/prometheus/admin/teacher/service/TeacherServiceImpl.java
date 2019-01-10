/*
* TeacherService.java
* Created on  2014-11-4 下午3:17
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-11-4       weixuda    初始版本
*
*/
package com.genghis.prometheus.admin.teacher.service;

import com.genghis.prometheus.admin.teacher.dao.TeacherDao;
import com.genghis.prometheus.admin.teacher.model.TeacherVO;
import com.genghis.prometheus.exception.ValidateErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Class Description
 *
 * @author weixuda
 * @version 1.0.1
 */
@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherDao teacherDao;

    @Override
    public List<TeacherVO> getTeacherInfoList(TeacherVO teacherVO) {
        return teacherDao.getTeacherInfoList(teacherVO);
    }

    @Override
    public void addTeacherInfo(TeacherVO teacherVO) {
        checkTeacherId(teacherVO);
        teacherDao.addTeacherInfo(teacherVO);
        teacherDao.addTeacherCourseInfo(teacherVO);
    }

    private void checkTeacherId(TeacherVO teacherVO) {
        if (teacherDao.checkTeacherId(teacherVO) > 0) {
            throw new ValidateErrorException("教师工号已存在");
        }
    }

    /**
     * Delete Teacher Information
     */
    @Override
    public void deleteManyTeacherInfo(String[] teacherIds) {

        teacherDao.deleteManyTeacherInfo(teacherIds);
        teacherDao.deleteManyTeacherCourseInfo(teacherIds);
    }

    @Override
    public void deleteTeacherInfo(String teacherId) {

        teacherDao.deleteTeacherInfo(teacherId);
        teacherDao.deleteTeacherCourseInfo(teacherId);
    }

    /**
     * Query Teacher Information
     */
    @Override
    public TeacherVO showTeacherInfo(String teacherId) {
        return teacherDao.showTeacherInfo(teacherId);
    }

    /**
     * Modify Teacher Information
     */
    @Override
    public void updateTeacherInfo(TeacherVO teacherVO) {
        teacherDao.updateTeacherInfo(teacherVO);
        teacherDao.updateTeacherCourseInfo(teacherVO);
    }

}
