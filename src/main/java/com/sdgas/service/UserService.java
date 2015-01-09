package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.Department;
import com.sdgas.model.PurchaseRequisition;
import com.sdgas.model.User;

/**
 * Created by 120378 on 2014/5/13.
 */
public interface UserService extends DAO {

    /**
     * 根据用户名查找用户
     *
     * @param userId 佛燃工号
     * @return 用户
     */
    public User findById(String userId);

    /**
     * 查询下一个处理人
     *
     * @param workflow 流程
     * @param user     当前环节
     * @param pr       请购单
     * @return 用户
     */
    public User findNextUser(String workflow, User user, PurchaseRequisition pr);

}
