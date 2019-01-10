package com.genghis.prometheus.course.service;



import java.util.HashMap;
import java.util.List;

import com.genghis.prometheus.course.model.TreeVO;
import com.genghis.prometheus.study.model.StudyVO;

/**
 * Created by V5-552G on 2015/1/13.
 */
public interface CourseService {

    List<HashMap<String,String>> getTreeAll(String courseId,String studentId);

    StudyVO getStudyInfo(String studentId,String courseId);

    void updateInfo(TreeVO treeVO);
}
