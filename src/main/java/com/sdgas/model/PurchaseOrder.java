package com.sdgas.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 采购单
 * Created by 120378 on 2014/7/15.
 */
@Entity
public class PurchaseOrder {

    private int id;
    /**
     * 采购单编号
     */
    private String orderId;

    /**
     * 请购材料
     */
    private PurchaseMaterial pm;

    /**
     * 供应商
     */
    private Supplier supplier;

    /**
     * 收货人
     */
    private String consignee;

    /**
     * 申请人
     */
    private User applyUser;

    /**
     * 联系电话
     */
    private String contactPhone;

    /**
     * 订单日期
     */
    private Date orderDate;

    /**
     * 收货地址
     */
    private String deliveryAddress;

    /**
     * 采购数量
     */
    private float amount;

    /**
     * 到货数量
     */
    private float arrivalNum;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 状态
     */
    private OrderStatus status;

    /**
     * 訂單总价格
     */
    private double totalPay;

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(length = 15)
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @ManyToOne
    @JoinColumn(name = "supplier")
    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    @ManyToOne
    @JoinColumn(name = "material")
    public PurchaseMaterial getPm() {
        return pm;
    }

    public void setPm(PurchaseMaterial pm) {
        this.pm = pm;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    @Column(length = 15, nullable = false)
    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    @Temporal(TemporalType.DATE)
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Column(length = 30, nullable = false)
    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    @Column(length = 150)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @ManyToOne
    @JoinColumn(name = "applyUser")
    public User getApplyUser() {
        return applyUser;
    }

    public void setApplyUser(User applyUser) {
        this.applyUser = applyUser;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    @Column(length = 4)
    public float getArrivalNum() {
        return arrivalNum;
    }

    public void setArrivalNum(float arrivalNum) {
        this.arrivalNum = arrivalNum;
    }

    @Enumerated(EnumType.ORDINAL)
    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }
}
