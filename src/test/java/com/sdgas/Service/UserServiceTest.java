package com.sdgas.Service;

import com.sdgas.model.PurchaseRequisition;
import com.sdgas.model.User;
import com.sdgas.service.PurchaseRequisitionService;
import com.sdgas.service.UserService;
import junit.framework.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.persistence.Query;


/**
 * Created by 120378 on 2014/5/13.
 */

public class UserServiceTest {

    private static ApplicationContext ac;
    private User user;
    private static UserService userService;
    private static PurchaseRequisitionService purchaseRequisitionService;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        try {
            //通过读取spring容器，给dao注入相应的实现类
            ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            userService = (UserService) ac.getBean("userServiceImpl");
            purchaseRequisitionService = (PurchaseRequisitionService) ac.getBean("purchaseRequisitionServiceImpl");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testFindUserById() {
        user = userService.findById("admin");
        Assert.assertNotNull(user);
    }

    @Test
    public void testDpSendMail() {
        User user = userService.findNextUser("DP", userService.findById("leader"),null);
        Assert.assertEquals("", user.getUserName());

    }

    @Test
    public void testPRSendMail() {
        PurchaseRequisition pr = purchaseRequisitionService.findPRById(10);
        User user = userService.findNextUser("PR", userService.findById("manager"),pr);
        Assert.assertEquals("", user.getUserName());

    }
}
