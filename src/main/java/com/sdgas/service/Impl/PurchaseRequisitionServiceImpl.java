package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.PRStatus;
import com.sdgas.model.PurchaseRequisition;
import com.sdgas.service.PurchaseRequisitionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

    @Override
    public List<PurchaseRequisition> findAll() {
        Query query = em.createQuery("select o from PurchaseRequisition o where status =?1 order by applyDate desc");
        query.setParameter(1, PRStatus.PR);
        List<PurchaseRequisition> purchaseRequisitionList = query.getResultList();
        if (purchaseRequisitionList.size() < 10)
            return purchaseRequisitionList;
        else {
            List<PurchaseRequisition> purchaseRequisitions = new ArrayList<>();
            for (int i = 0; i < 10; i++)
                purchaseRequisitions.add(purchaseRequisitionList.get(i));
            return purchaseRequisitions;
        }
    }


}
