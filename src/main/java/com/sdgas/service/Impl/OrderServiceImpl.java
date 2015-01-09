package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.OrderStatus;
import com.sdgas.model.PurchaseMaterial;
import com.sdgas.model.PurchaseOrder;
import com.sdgas.model.Supplier;
import com.sdgas.service.OrderService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

/**
 * Created by 斌 on 2014/9/3.
 */
@Service
@Transactional
public class OrderServiceImpl extends DaoSupport<PurchaseOrder> implements
		OrderService {

	@Override
	public List<PurchaseOrder> findOrderByOrderId(String orderId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", orderId);
		return this.findByFields(PurchaseOrder.class, params);
	}

	public boolean checkUniqo(String orderId, List<PurchaseMaterial> pms) {
		PurchaseOrder order = this.findOrderByOrderId(orderId).get(0);
		if (order != null) {
			Supplier supplier = order.getPm().getSupplier();
			for (int i = 0; i < pms.size(); i++) {
				if (supplier.getSupplierId() != pms.get(i).getSupplier()
						.getSupplierId())
					return false;
			}
		}
		return true;
	}

	@Override
	public List<PurchaseOrder> findOrdersBySupplier(Supplier supplier,
			Date begin, Date end) {
		Query query = em
				.createQuery("select o from PurchaseOrder o where o.supplier=?1 and o.orderDate>?2 and o.orderDate<?3 and o.status=?4");
		query.setParameter(1, supplier);
		query.setParameter(2, begin);
		query.setParameter(3, end);
		query.setParameter(4, OrderStatus.DONE);
		return query.getResultList();
	}
}
