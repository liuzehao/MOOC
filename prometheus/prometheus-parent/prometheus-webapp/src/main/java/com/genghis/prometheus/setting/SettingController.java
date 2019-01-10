
package com.genghis.prometheus.setting;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by xfzone on 2015/1/29.
 */

@Controller
public class SettingController {

    @RequestMapping("/toGetSettingInfo")
    public String toGetSettingInfo() {

        return "setting/getSettingInfo";
    }
}

