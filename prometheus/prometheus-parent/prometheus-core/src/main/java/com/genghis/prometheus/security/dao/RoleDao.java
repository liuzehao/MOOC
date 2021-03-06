/*
* RoleDao.java
* Created on  2013-9-26 下午10:03
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26        gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.security.dao;

import com.genghis.steed.annotation.mybatisRepository;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色dao接口
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
@mybatisRepository
public interface RoleDao {

    List<String> findAllRoleNamesByLoginName(@Param("loginName") String loginName);

    List<String> findAllRolePermTokensByLoginName(@Param("loginName") String loginName);
}
