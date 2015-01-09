package com.sdgas.VO;

import com.sdgas.model.DemandPlans;
import com.sdgas.model.PurchaseMaterial;
import com.sdgas.model.PurchaseRequisition;

import java.util.List;

/**
 * Created by 斌 on 2014/8/25.
 */
public class PRVO extends BaseVO {

    /**
     * 请购单号
     */
    private String prId;

    /**
     * 请购部门
     */
    private String applyUser;

    /**
     * 请购日期
     */
    private String prDate;

    /**
     * 备注
     */
    private String remarks;
    private String status;
    private int dpId;
    private DemandPlans demandPlans;
    private PurchaseRequisition pr;
    private List<PurchaseMaterial> purchaseMaterials;
    private String supplier;
    private String materialId;
    private String price;
    private String project;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public PurchaseRequisition getPr() {
        return pr;
    }

    public void setPr(PurchaseRequisition pr) {
        this.pr = pr;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public DemandPlans getDemandPlans() {
        return demandPlans;
    }

    public void setDemandPlans(DemandPlans demandPlans) {
        this.demandPlans = demandPlans;
    }

    public List<PurchaseMaterial> getPurchaseMaterials() {
        return purchaseMaterials;
    }

    public void setPurchaseMaterials(List<PurchaseMaterial> purchaseMaterials) {
        this.purchaseMaterials = purchaseMaterials;
    }

    public int getDpId() {
        return dpId;
    }

    public void setDpId(int dpId) {
        this.dpId = dpId;
    }

    public String getPrId() {
        return prId;
    }

    public void setPrId(String prId) {
        this.prId = prId;
    }

    public String getApplyUser() {
        return applyUser;
    }

    public void setApplyUser(String applyUser) {
        this.applyUser = applyUser;
    }

    public String getPrDate() {
        return prDate;
    }

    public void setPrDate(String prDate) {
        this.prDate = prDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
