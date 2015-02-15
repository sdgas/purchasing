package com.sdgas.Service.Impl;

import com.sdgas.model.Department;
import com.sdgas.service.DepartmentService;
import junit.framework.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

public class DepartmentServiceImplTest {

    private static ApplicationContext ac;
    private Department department;
    private static DepartmentService departmentService;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        try {
            //通过读取spring容器，给dao注入相应的实现类
            ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            departmentService = (DepartmentService) ac.getBean("departmentServiceImpl");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testFindAllDepartment() {
        List<Department> departments = departmentService.findAllDepartment();
        Assert.assertEquals(8, departments.size());
    }

    @Test
    public void testFindDepartmentByName() {
        department = departmentService.findDepartmentByName("安全技术");
        Assert.assertNotNull(department);
    }

}