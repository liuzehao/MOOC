package com.genghis.prometheus.leaderboard.dao;

import com.genghis.prometheus.leaderboard.model.CourseRankVO;
import com.genghis.steed.annotation.mybatisRepository;

import java.util.List;

/**
 * Created by Demon on 2015/1/30.
 */
@mybatisRepository
public interface LeaderBoardDao {
    List<CourseRankVO> getCourseLeaderBoardList(String courseId);
}
