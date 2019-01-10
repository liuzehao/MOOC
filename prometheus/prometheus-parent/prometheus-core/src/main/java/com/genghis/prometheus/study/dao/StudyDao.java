package com.genghis.prometheus.study.dao;

import com.genghis.prometheus.course.model.CourseVO;
import com.genghis.prometheus.study.model.StudyVO;
import com.genghis.steed.annotation.mybatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Demon on 2015/1/15.
 */
@mybatisRepository
public interface StudyDao {

    List<StudyVO> getPersonStudyCourseList(String studentId);

    List<CourseVO> getCourseInfoList();

    List<StudyVO> getStudyHistoryList(String studentId);
}
