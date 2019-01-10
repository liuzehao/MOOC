package com.genghis.prometheus.client.dao;

import com.genghis.prometheus.client.model.Client;
import com.genghis.steed.annotation.mybatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@mybatisRepository
public interface ClientDao {

    Client getClient(@Param("id") String id);

    List<Client> getClientListPage(Client client);

    int updateVersion(Client client);
}
