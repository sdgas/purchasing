package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.PurchaseRequisition;

/**
 * Created by 120378 on 2014/5/13.
 */
public interface PurchaseRequisitionService extends DAO {

    /**
     * 根据Id查找PR
     *
     * @param id 请购单系统编号
     * @return 请购单
     */
    public PurchaseRequisition findPRById(int id);

    /**
     * 查找PR
     * @param prId 请购单编号
     * @return 请购单
     */
    public PurchaseRequisition findPRByPrId(String prId);
}
