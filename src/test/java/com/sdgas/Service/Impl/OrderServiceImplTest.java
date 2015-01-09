package com.sdgas.junit;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sdgas.model.PurchaseOrder;
import com.sdgas.model.Supplier;
import com.sdgas.service.OrderService;
import com.sdgas.service.SupplierService;
import com.sdgas.util.ChangeTime;

public class OrderServiceImplTest {

	private static ApplicationContext ac;
	private PurchaseOrder order;
	private static OrderService orderService;
	private static SupplierService supplierService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			// 通过读取spring容器，给dao注入相应的实现类
			ac = new ClassPathXmlApplicationContext("applicationContext.xml");
			orderService = (OrderService) ac.getBean("orderServiceImpl");
			supplierService = (SupplierService) ac
					.getBean("supplierServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFindOrdersBySupplier() {
		Supplier supplier = supplierService.findSupplierByName("测试1");		
		Date begin = ChangeTime.parseStringToShortDate("2014-07-01");
		Date end = ChangeTime.parseStringToShortDate("2014-10-01");
		List<PurchaseOrder> orders = orderService.findOrdersBySupplier(
				supplier, begin, end);
		Assert.assertEquals(2, orders.size());
	}

}
