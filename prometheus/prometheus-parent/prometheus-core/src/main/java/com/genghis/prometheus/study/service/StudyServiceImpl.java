package com.genghis.prometheus.study.service;

import com.genghis.prometheus.course.model.CourseVO;
import com.genghis.prometheus.study.dao.StudyDao;
import com.genghis.prometheus.study.model.StudyVO;
import com.genghis.prometheus.util.TimeFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

/**
 * Created by Demon on 2015/1/15.
 */
@Service("studyService")
@Transactional
public class StudyServiceImpl implements StudyService {
    @Autowired
    private StudyDao studyDao;

    @Override
    public List<StudyVO> getPersonStudyCourseList(String studentId){
        List<StudyVO> studyVOList = studyDao.getPersonStudyCourseList(studentId);
        Iterator<StudyVO> iterator= studyVOList.iterator();
        StudyVO studyVO;
        try {
            while (iterator.hasNext()) {
                studyVO = iterator.next();
                studyVO.setCourseTime(TimeFormatUtil.get(studyVO.getCourseTime(), TimeFormatUtil.HOUR_AND_MINUTE));
            }
        }catch (NullPointerException e){
            e.printStackTrace();
        }
        return studyVOList;
    }

    @Override
    public List<CourseVO> getCourseInfoList() {
        return studyDao.getCourseInfoList();
    }

    @Override
    public List<StudyVO> getStudyHistoryList(String studentId) {
        List<StudyVO> studyHistoryVOList = studyDao.getStudyHistoryList(studentId);
        return studyHistoryVOList;
    }
}