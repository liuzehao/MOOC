package com.genghis.prometheus.autoupdate.dao;

import com.genghis.prometheus.autoupdate.model.UpdateLog;
import com.genghis.steed.annotation.mybatisRepository;

/**
 * Created by genghis on 14-8-8.
 */
@mybatisRepository
public interface UpdateLogDao {

    void addUpdateLog(UpdateLog updateLog);
}
