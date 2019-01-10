/*
* AutoCompleteServiceImpl.java
* Created on  2013-10-31 下午2:23
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-10-31       weixuda    初始版本
*
*/
package com.genghis.prometheus.autocomplete.service;

import com.genghis.prometheus.autocomplete.dao.AutoCompleteDao;
import com.genghis.steed.autocomplete.model.AutoComplete;
import com.genghis.steed.autocomplete.service.AbstractAutoCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * AutoCompleteServiceImpl
 *
 * @author weixuda
 * @version 1.0.1
 */
@Service("autoCompleteService")
public class CustomAutoCompleteServiceImpl extends AbstractAutoCompleteService {

    @Autowired
    private AutoCompleteDao autoCompleteDao;

    @Override
    @PostConstruct
    public void initAutoComplete() {
        super.initAutoComplete();
    }

    @Override
    protected void initAutoCompleteMap() {
        Map<String, List<AutoComplete>> autoCompleteMap = new HashMap<>();
        autoCompleteMap.put("flagClientAutoComplete",autoCompleteDao.getClientAutoCompleteList());
        autoCompleteMap.put("flagStaticCollegeName",autoCompleteDao.getStaticCollegeName());
        autoCompleteMap.put("flagStaticResearchRoomName",autoCompleteDao.getStaticResearchRoomName());
        autoCompleteMap.put("flagStaticCourseName",autoCompleteDao.getStaticCourseName());
        autoCompleteMap.put("flagStaticProfessionName",autoCompleteDao.getStaticProfessionName());
        setAutoCompleteMap(autoCompleteMap);
    }
}
