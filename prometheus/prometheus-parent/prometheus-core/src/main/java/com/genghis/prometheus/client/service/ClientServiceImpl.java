/*
* ClientServiceImpl.java
* Created on  2014-8-2 下午4:05
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-8-2       gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.client.service;

import com.genghis.prometheus.client.dao.ClientDao;
import com.genghis.prometheus.client.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Service("clientService")
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientDao clientDao;

    @Override
    public List<Client> getClientListPage(Client client) {
        return clientDao.getClientListPage(client);
    }

    @Override
    public Client getClient(String id) {
        return clientDao.getClient(id);
    }

    @Override
    public int updateVersion(Client client) {
        return clientDao.updateVersion(client);
    }

}
