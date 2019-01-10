package com.genghis.prometheus.course.dao;

import com.genghis.prometheus.course.model.TreeVO;
import com.genghis.steed.annotation.mybatisRepository;

import java.util.HashMap;
import java.util.List;
import com.genghis.prometheus.study.model.StudyVO;
import org.apache.ibatis.annotations.Param;

/**
 * Created by V5-552G on 2015/1/13.
 */
@mybatisRepository
public interface CourseDao {

    List<HashMap<String,String>> getTreeAll(@Param("courseId") String courseId,@Param("studentId") String studentId);

    StudyVO getStudyInfo(@Param("studentId") String studentId,@Param("courseId") String courseId);

    void updateInfo(TreeVO treeVO);
}
