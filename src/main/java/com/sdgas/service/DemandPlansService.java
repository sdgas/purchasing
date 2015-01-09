package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.DemandPlans;
import com.sdgas.model.User;

import java.util.List;

/**
 * Created by 120378 on 2014/5/13.
 */
public interface DemandPlansService extends DAO {

    /**
     * 更具用户查找需求计划
     *
     * @param user 用户
     * @return 查询语句
     */
    public String findDPByUser(User user);

    /**
     * @param user
     * @return
     */
    public String checkDP(User user);

    /**
     * 查找已经请购的需求计划
     *
     * @return
     */
    public List<DemandPlans> findBPWhitPR(boolean b, String msg);

}
