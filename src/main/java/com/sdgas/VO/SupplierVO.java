package com.sdgas.VO;

import com.sdgas.model.Supplier;

/**
 * 供应商 Created by 120378 on 2014/7/25.
 */
public class SupplierVO extends BaseVO {

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
    private String fax;

    /**
     * 评价
     */
    private String evaluation;

    private boolean enableUse = true;
    private String message;
    private Supplier supplier;

    public boolean isEnableUse() {
        return enableUse;
    }

    public void setEnableUse(boolean enableUse) {
        this.enableUse = enableUse;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

}
