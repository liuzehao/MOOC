package com.genghis.prometheus.autoupdate.service;

import com.genghis.prometheus.autoupdate.dao.UpdateLogDao;
import com.genghis.prometheus.autoupdate.model.UpdateLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by genghis on 14-8-8.
 */
@Service("updateLogService")
public class UpdateLogServiceImpl implements UpdateLogService {

    @Autowired
    private UpdateLogDao updateLogDao;

    @Override
    public void addUpdateLog(UpdateLog updateLog) {
        updateLogDao.addUpdateLog(updateLog);
    }
}
