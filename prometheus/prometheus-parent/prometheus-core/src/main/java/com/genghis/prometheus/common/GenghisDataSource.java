/*
* GenghisDataSource.java
* Created on  2014-3-8 下午9:24
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-8       gaoxinyu    初始版本
*
*/
package com.genghis.prometheus.common;

import com.genghis.steed.util.Des;
import org.apache.tomcat.jdbc.pool.DataSource;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public class GenghisDataSource extends DataSource {

    @Override
    public void setPassword(String password) {
        super.setPassword(new Des().decrypt(password));
    }

    @Override
    public void setUsername(String username) {
        super.setUsername(new Des().decrypt(username));
    }
}
