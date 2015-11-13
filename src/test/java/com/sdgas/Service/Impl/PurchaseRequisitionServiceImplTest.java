package com.sdgas.Service.Impl;

import com.sdgas.model.PurchaseRequisition;
import com.sdgas.service.PurchaseRequisitionService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class PurchaseRequisitionServiceImplTest {

    private static ApplicationContext ac;
    private static PurchaseRequisitionService purchaseRequisitionService;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        try {
            //通过读取spring容器，给dao注入相应的实现类
            ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            purchaseRequisitionService = (PurchaseRequisitionService) ac.getBean("purchaseRequisitionServiceImpl");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testFindAll() {
        List<PurchaseRequisition> demandPlans = purchaseRequisitionService.findAll();
        System.out.println(demandPlans.size());
        for (PurchaseRequisition dp : demandPlans)
            System.out.println("de:" + dp.getApplyDate());
    }


}