package com.sdgas.VO;

import com.sdgas.model.PurchaseMaterial;
import com.sdgas.model.PurchaseOrder;
import com.sdgas.model.PurchaseRequisition;

import java.util.List;

/**
 * Created by 斌 on 2014/9/3.
 */
public class OrderVO extends BaseVO {

    private String id;
    /**
     * 采购单编号
     */
    private String orderId;

    /**
     * 请购材料
     */
    private PurchaseMaterial pm;
    private String pmIds;
    private List<PurchaseOrder> orders;
    private double total;
    private String material;

    /**
     * 收货人
     */
    private String consignee;

    /**
     * 联系电话
     */
    private String contactPhone;

    /**
     * 订单日期
     */
    private String orderDate;

    /**
     * 收货地址
     */
    private String deliveryAddress;

    /**
     * 采购数量
     */
    private String amount;
    // 实际数量
    private String factNum;

    /**
     * 备注
     */
    private String remarks;
    private String prId;
    private PurchaseRequisition pr;
    private List<PurchaseMaterial> purchaseMaterials;
    private List<PurchaseOrder> purchaseOrders;
    private String materialId;
    private PurchaseOrder order;
    private String status;
    private String supplier;
    /**
     * 查询开始时间
     */
    private String begin;
    /**
     * 查询结束时间
     */
    private String end;

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<PurchaseOrder> getPurchaseOrders() {
        return purchaseOrders;
    }

    public void setPurchaseOrders(List<PurchaseOrder> purchaseOrders) {
        this.purchaseOrders = purchaseOrders;
    }

    public PurchaseOrder getOrder() {
        return order;
    }

    public void setOrder(PurchaseOrder order) {
        this.order = order;
    }

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public String getFactNum() {
        return factNum;
    }

    public void setFactNum(String factNum) {
        this.factNum = factNum;
    }

    public PurchaseRequisition getPr() {
        return pr;
    }

    public void setPr(PurchaseRequisition pr) {
        this.pr = pr;
    }

    public List<PurchaseMaterial> getPurchaseMaterials() {
        return purchaseMaterials;
    }

    public void setPurchaseMaterials(List<PurchaseMaterial> purchaseMaterials) {
        this.purchaseMaterials = purchaseMaterials;
    }

    public String getPrId() {
        return prId;
    }

    public void setPrId(String prId) {
        this.prId = prId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public PurchaseMaterial getPm() {
        return pm;
    }

    public void setPm(PurchaseMaterial pm) {
        this.pm = pm;
    }

    public String getPmIds() {
        return pmIds;
    }

    public void setPmIds(String pmIds) {
        this.pmIds = pmIds;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getBegin() {
        return begin;
    }

    public void setBegin(String begin) {
        this.begin = begin;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public List<PurchaseOrder> getOrders() {
        return orders;
    }

    public void setOrders(List<PurchaseOrder> orders) {
        this.orders = orders;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }
}
