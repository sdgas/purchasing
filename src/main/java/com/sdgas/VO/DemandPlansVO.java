package com.sdgas.VO;


/**
 * Created by 120378 on 2014/7/30.
 */
public class DemandPlansVO extends BaseVO {

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
    private int dpId;
    private String status;
    private String demandType;

    public String getDemandType() {
        return demandType;
    }

    public void setDemandType(String demandType) {
        this.demandType = demandType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getDpId() {
        return dpId;
    }

    public void setDpId(int dpId) {
        this.dpId = dpId;
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
}
