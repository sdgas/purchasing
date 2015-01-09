package com.sdgas.Service.Impl;

import com.sdgas.model.Supplier;
import com.sdgas.service.SupplierService;
import junit.framework.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class SupplierServiceImplTest {


    private static ApplicationContext ac;
    private Supplier supplier;
    private static SupplierService supplierService;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        try {
            //通过读取spring容器，给dao注入相应的实现类
            ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            supplierService = (SupplierService) ac.getBean("supplierServiceImpl");
            System.out.println(supplierService);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void findAllSupplierTest() {
        supplier = supplierService.findSupplierById(1);
        Assert.assertEquals("", supplier.getSupplierName());
    }
}