package com.genghis.prometheus.leaderboard.service;

import com.genghis.prometheus.leaderboard.model.CourseRankVO;

import java.util.List;

/**
 * Created by Demon on 2015/1/30.
 */
public interface LeaderBoardService {
       List<CourseRankVO> getCourseLeaderBoardList(String courseId);
}
