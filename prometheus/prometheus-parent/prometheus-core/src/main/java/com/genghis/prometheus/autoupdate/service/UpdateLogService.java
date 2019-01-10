package com.genghis.prometheus.autoupdate.service;

import com.genghis.prometheus.autoupdate.model.UpdateLog;

/**
 * Created by genghis on 14-8-8.
 */
public interface UpdateLogService {

    void addUpdateLog(UpdateLog updateLog);
}
