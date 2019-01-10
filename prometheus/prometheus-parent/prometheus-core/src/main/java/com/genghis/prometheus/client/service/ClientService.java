/*
* ClientService.java
* Created on  2014-8-2 下午4:05
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-8-2        gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.client.service;

import com.genghis.prometheus.client.model.Client;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface ClientService {

    List<Client> getClientListPage(Client client);

    Client getClient(String id);

    int updateVersion(Client client);
}
