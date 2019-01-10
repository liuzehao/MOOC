package com.genghis.prometheus.admin.profession;

import com.genghis.steed.mybatis.model.PageBase;

/**
 * Created by Demon on 2015/1/17.
 */
public class ProfessionVO extends PageBase{
    //专业id
    private String professionId;
    //专业名称
    private String professionName;

    public String getProfessionId() {
        return professionId;
    }

    public void setProfessionId(String professionId) {
        this.professionId = professionId;
    }

    public String getProfessionName() {
        return professionName;
    }

    public void setProfessionName(String professionName) {
        this.professionName = professionName;
    }
}
