package com.genghis.prometheus.leaderboard.service;

import com.genghis.prometheus.leaderboard.model.CourseRankVO;
import com.genghis.prometheus.leaderboard.dao.LeaderBoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Collections;
/**
 * Created by Demon on 2015/1/30.
 */

@Service("LeaderBoardService")
public class LeaderBoardServiceImpl implements LeaderBoardService {
    @Autowired
    private LeaderBoardDao leaderBoardDao;

    @Override
    public List<CourseRankVO> getCourseLeaderBoardList(String courseId){
        List<CourseRankVO> courseRankVOList = leaderBoardDao.getCourseLeaderBoardList(courseId);
        try {
            Collections.sort(courseRankVOList, new Comparator<CourseRankVO>() {
                @Override
                public int compare(CourseRankVO o1, CourseRankVO o2) {
                    return Integer.parseInt(o2.getTotalScore()) - Integer.parseInt(o1.getTotalScore());
                }
            });
        }catch (NullPointerException e){
            e.printStackTrace();
        }
        return courseRankVOList;
    }
}