package com.sdgas.Service.Impl;

import com.sdgas.service.DemandPlansService;
import com.sdgas.service.UserService;
import junit.framework.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DemandPlansServiceImplTest {

    private static ApplicationContext ac;
    private static DemandPlansService demandPlansService;
    private static UserService userService;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        try {
            //通过读取spring容器，给dao注入相应的实现类
            ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            demandPlansService = (DemandPlansService) ac.getBean("demandPlansServiceImpl");
            userService = (UserService) ac.getBean("userServiceImpl");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testFindDPByUser() {
        String demandPlans = demandPlansService.findDPByUser(userService.findById("staff"));
        Assert.assertEquals("", demandPlans);
    }

    @Test
    public void testCheckDP() {
        String str = demandPlansService.checkDP(userService.findById("leader"));
        Assert.assertEquals("", str);
    }

}