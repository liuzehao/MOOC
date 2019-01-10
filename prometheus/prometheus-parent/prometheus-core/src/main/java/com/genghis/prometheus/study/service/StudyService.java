package com.genghis.prometheus.study.service;

import com.genghis.prometheus.admin.student.model.StudentVO;
import com.genghis.prometheus.course.model.CourseVO;
import com.genghis.prometheus.study.model.StudyVO;

import java.util.List;

/**
 * Created by Demon on 2015/1/15.
 */
public interface StudyService {

    List<StudyVO> getPersonStudyCourseList(String studentId);

    List<CourseVO> getCourseInfoList();

    List<StudyVO> getStudyHistoryList(String studentId);
}
