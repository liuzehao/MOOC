/*
* AutoUpdateController.java
* Created on  2014-8-1 下午5:05
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-8-1       gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.client;

import com.genghis.prometheus.autoupdate.model.UpdateLog;
import com.genghis.prometheus.autoupdate.service.UpdateLogService;
import com.genghis.prometheus.client.model.Client;
import com.genghis.prometheus.client.service.ClientService;
import com.genghis.prometheus.globalparam.service.GlobalParamService;
import com.genghis.prometheus.util.IpUtil;
import com.genghis.steed.ajax.response.PageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ClientController {

    @Autowired
    @Qualifier("prometheusGlobalParamService")
    private GlobalParamService globalParamService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private UpdateLogService updateLogService;

    @RequestMapping("/client/getClientListDo")
    public String getClientListDo() {
        return "client/getClientListDo";
    }

    @RequestMapping("/client/getClientListPage")
    @ResponseBody
    public PageResponse<Client> getClientListPage(Client client) {
        return new PageResponse<>(client.getPage(), clientService.getClientListPage(client));
    }

    @RequestMapping("/client/getClientContextName")
    @ResponseBody
    public String getClientContextName(String clientId, HttpServletRequest request) {
        updateLogService.addUpdateLog(new UpdateLog(IpUtil.getIp(request), "获取contextName", clientId, "", ""));
        return clientService.getClient(clientId).getContextName();
    }

    @RequestMapping("/client/getTargetVersion")
    @ResponseBody
    public String getTargetVersion(String clientId, HttpServletRequest request) {
        updateLogService.addUpdateLog(new UpdateLog(IpUtil.getIp(request), "获取最新版本", clientId, "", ""));
        return globalParamService.getParamValue("current_version");
    }

    @RequestMapping("/client/updateVersion")
    @ResponseBody
    public int updateVersion(Client client, HttpServletRequest request) {
        updateLogService.addUpdateLog(new UpdateLog(IpUtil.getIp(request), "升级成功更新客户版本", client.getId(), client.getVersion(), client.getTargetVersion()));
        return clientService.updateVersion(client);
    }

    @RequestMapping("/client/rollbackVersion")
    @ResponseBody
    public int rollbackVersion(Client client, HttpServletRequest request) {
        updateLogService.addUpdateLog(new UpdateLog(IpUtil.getIp(request), "回滚成功更新客户版本", client.getId(), client.getVersion(), client.getTargetVersion()));
        return clientService.updateVersion(client);
    }
}
