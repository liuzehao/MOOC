package com.genghis.prometheus.course.service;

import com.genghis.prometheus.course.dao.CourseDao;
import com.genghis.prometheus.course.model.TreeVO;
import com.genghis.prometheus.util.TimeFormatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import com.genghis.prometheus.study.model.StudyVO;

/**
 * Created by WangXin on 2015/1/13.
 */
@Service("courseService")
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;

    @Override
    public List<HashMap<String, String>> getTreeAll(String courseId,String studentId) {
        return courseDao.getTreeAll(courseId,studentId);
    }

    public StudyVO getStudyInfo(String studentId,String courseId){
        StudyVO studyVO = courseDao.getStudyInfo(studentId,courseId);
        try{
            studyVO.setCourseTime(TimeFormatUtil.get(studyVO.getCourseTime(),TimeFormatUtil.HOUR_AND_MINUTE));
        }catch(NullPointerException e){
            e.printStackTrace();
        }
        return studyVO;
    }

    public void updateInfo(TreeVO treeVO){courseDao.updateInfo(treeVO);}
}
