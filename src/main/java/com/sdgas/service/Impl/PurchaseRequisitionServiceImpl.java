package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.PurchaseRequisition;
import com.sdgas.service.PurchaseRequisitionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by 120378 on 2014/5/13.
 */
@Service
@Transactional
public class PurchaseRequisitionServiceImpl extends DaoSupport<PurchaseRequisition> implements PurchaseRequisitionService {


    @Override
    public PurchaseRequisition findPRById(int id) {
        return this.find(PurchaseRequisition.class, id);
    }

    @Override
    public PurchaseRequisition findPRByPrId(String prId) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("prId", prId);
        return (PurchaseRequisition) this.findSpecialObject(PurchaseRequisition.class, params);
    }


}
