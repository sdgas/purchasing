package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.PurchaseMaterial;
import com.sdgas.model.PurchaseOrder;
import com.sdgas.model.Supplier;

import java.util.Date;
import java.util.List;

/**
 * Created by 斌 on 2014/9/3.
 */
public interface OrderService extends DAO {

    /**
     * 查找采购单
     *
     * @param orderId 采购单编号
     * @return 采购单
     */
    public List<PurchaseOrder> findOrderByOrderId(String orderId);

    /**
     * 检测唯一性
     *
     * @param orderId 订单编号
     * @param pms     物料
     * @return
     */
    public boolean checkUniqo(String orderId, List<PurchaseMaterial> pms);

    /**
     * 统计供应商供应额
     *
     * @param supplier 供应商
     * @param begin    开始日期
     * @param end      结束日期
     * @return
     */
    public List<PurchaseOrder> findOrdersBySupplier(Supplier supplier,
                                                    Date begin, Date end);

    public List<PurchaseOrder> findAll();
}
