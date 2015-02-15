package com.sdgas.model;

import com.sdgas.util.ExcelResources;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 供应商
 * Created by 120378 on 2014/7/15.
 */
@Entity
public class Supplier {

    /**
     * 供应商编号
     */
    private int supplierId;

    /**
     * 供应商名字
     */
    private String supplierName;

    /**
     * 联系人
     */
    private String contacts;

    /**
     * 地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 传真
     */
    private String fax;

    /**
     * 评价
     */
    private String evaluation;

    /**
     * 是否可用
     */
    private boolean enableUse = true;

    @Id
    @GeneratedValue
    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    @Column(length = 30, nullable = false)
    @ExcelResources(title = "供应商名称", order = 1)
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(length = 10)
    @ExcelResources(title = "联系人", order = 2)
    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    @Column(length = 50, nullable = false)
    @ExcelResources(title = "地址", order = 5)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(length = 15, nullable = false)
    @ExcelResources(title = "联系电话", order = 3)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(length = 50, nullable = false)
    @ExcelResources(title = "传真号码", order = 4)
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(length = 400)
    @ExcelResources(title = "评价", order = 6)
    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public boolean isEnableUse() {
        return enableUse;
    }

    public void setEnableUse(boolean enableUse) {
        this.enableUse = enableUse;
    }
}
