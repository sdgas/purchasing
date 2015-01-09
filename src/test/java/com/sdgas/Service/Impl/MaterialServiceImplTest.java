package com.sdgas.Service.Impl;

import com.sdgas.model.Material;
import com.sdgas.service.MaterialService;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MaterialServiceImplTest{

    private static ApplicationContext ac;
    private static MaterialService materialService;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        try {
            //通过读取spring容器，给dao注入相应的实现类
            ac = new ClassPathXmlApplicationContext("applicationContext.xml");
            materialService = (MaterialService) ac.getBean("materialServiceImpl");
            System.out.println(materialService);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testFindAll(){
        List<Material> materials = materialService.findAll();
        System.out.println(materials.size());
    }

}