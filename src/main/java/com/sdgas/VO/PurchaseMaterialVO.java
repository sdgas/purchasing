package com.sdgas.VO;

import com.sdgas.model.DemandPlans;
import com.sdgas.model.PurchaseMaterial;

import java.io.File;
import java.util.List;

/**
 * Created by 120378 on 2014/8/5.
 */
public class PurchaseMaterialVO extends BaseVO {

    private int dpId;
    /**
     * 采购物料
     */
    private String materialIds;

    /**
     * 数量
     */
    private String amount;

    /**
     * 请购单
     */
    private String requisition;

    /**
     * 单价
     */
    private double price;

    /**
     * 交付日期
     */
    private String deadline;

    /**
     * 供应商
     */
    private String supplier;

    /**
     * 到货数量
     */
    private int arrivalNum;

    private List<PurchaseMaterial> purchaseMaterials;
    /**
     * 申请项目名称
     */
    private String project;

    /**
     * 申请部门
     */
    private String departmentId;

    /**
     * 需求日期
     */
    private String demandDate;

    /**
     * 申请日期
     */
    private String applyDate;

    /**
     * CEA号
     */
    private String ceaNum;

    /**
     * 申请人
     */
    private String demandUserId;

    /**
     * 备注
     */
    private String remarks;
    private File attachment;
    private String fileName;
    private String path;
    private DemandPlans demandPlans;
    private String demandType;
    private String prId;

    public String getPrId() {
        return prId;
    }

    public void setPrId(String prId) {
        this.prId = prId;
    }

    public String getDemandType() {
        return demandType;
    }

    public void setDemandType(String demandType) {
        this.demandType = demandType;
    }

    public DemandPlans getDemandPlans() {
        return demandPlans;
    }

    public void setDemandPlans(DemandPlans demandPlans) {
        this.demandPlans = demandPlans;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public File getAttachment() {
        return attachment;
    }

    public void setAttachment(File attachment) {
        this.attachment = attachment;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getDemandDate() {
        return demandDate;
    }

    public void setDemandDate(String demandDate) {
        this.demandDate = demandDate;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public String getCeaNum() {
        return ceaNum;
    }

    public void setCeaNum(String ceaNum) {
        this.ceaNum = ceaNum;
    }

    public String getDemandUserId() {
        return demandUserId;
    }

    public void setDemandUserId(String demandUserId) {
        this.demandUserId = demandUserId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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

    public String getMaterialIds() {
        return materialIds;
    }

    public void setMaterialIds(String materialIds) {
        this.materialIds = materialIds;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getRequisition() {
        return requisition;
    }

    public void setRequisition(String requisition) {
        this.requisition = requisition;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public int getArrivalNum() {
        return arrivalNum;
    }

    public void setArrivalNum(int arrivalNum) {
        this.arrivalNum = arrivalNum;
    }
}
