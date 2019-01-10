package com.genghis.prometheus.globalparam.service;

import com.genghis.prometheus.globalparam.dao.GlobalParamDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created by genghis on 14-8-7.
 */
@Service("prometheusGlobalParamService")
public class GlobalParamServiceImpl implements GlobalParamService {

    @Autowired
    @Qualifier("prometheusGlobalParamDao")
    GlobalParamDao globalParamDao;

    @Override
    public String getParamValue(String paramName) {
        return globalParamDao.getParamValue(paramName);
    }
}
