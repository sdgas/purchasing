package com.sdgas.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 需求材料
 * Created by 120378 on 2014/7/14.
 */

@Entity
public class PurchaseMaterial {

    /**
     * 标识列
     */
    private int id;

    /**
     * 需求计划
     */
    private DemandPlans plan;

    /**
     * 采购物料
     */
    private Material material;

    /**
     * 数量
     */
    private double amount;

    /**
     * 状态
     */
    private FormStatus status;

    /**
     * 请购单
     */
    private PurchaseRequisition requisition;

    /**
     * 单价
     */
    private double price;

    /**
     * 交付日期
     */
    private Date deadline;

    /**
     * 供应商
     */
    private Supplier supplier;



    /**
     * 物料总价
     */
    private double totalPay;

    @Id
    @GeneratedValue
    @Column(length = 4)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "plan", nullable = false)
    public DemandPlans getPlan() {
        return plan;
    }

    public void setPlan(DemandPlans plan) {
        this.plan = plan;
    }

    @ManyToOne
    @JoinColumn(name = "material", nullable = false)
    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    @Column(nullable = false, length = 4)
    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    @Enumerated(EnumType.ORDINAL)
    public FormStatus getStatus() {
        return status;
    }

    public void setStatus(FormStatus status) {
        this.status = status;
    }

    @ManyToOne
    @JoinColumn(name = "prId")
    public PurchaseRequisition getRequisition() {
        return requisition;
    }

    public void setRequisition(PurchaseRequisition requisition) {
        this.requisition = requisition;
    }

    //精度为12位，小数点位数为2位
    @Column(precision = 12, scale = 2)
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @ManyToOne
    @JoinColumn(name = "supplier")
    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    @Temporal(TemporalType.DATE)
    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public double getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(double totalPay) {
        this.totalPay = totalPay;
    }
}
