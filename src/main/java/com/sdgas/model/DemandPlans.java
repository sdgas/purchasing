package com.sdgas.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 需求计划申请
 * Created by 120378 on 2014/7/14.
 */

@Entity
@Table(name = "dp")
public class DemandPlans {

    /**
     * 需求计划编号
     */
    private int dpId;

    /**
     * 申请项目名称
     */
    private String project;

    /**
     * 申请部门
     */
    private Department department;

    /**
     * 需求日期
     */
    private Date demandDate;

    /**
     * 申请日期
     */
    private Date applyDate;

    /**
     * CEA号
     */
    private String ceaNum;

    /**
     * 申请人
     */
    private User demandUser;

    /**
     * 申请状态
     */
    private DemandStatus status;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 附件
     */
    private String attachment;
    /**
     * 意见
     */
    private String comment;

    /**
     * 需求类型
     */
    private String demandType;

    @Id
    @GeneratedValue
    @Column(length = 4)
    public int getDpId() {
        return dpId;
    }

    public void setDpId(int dpId) {
        this.dpId = dpId;
    }

    @Column(length = 20)
    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    @Temporal(TemporalType.DATE)
    public Date getDemandDate() {
        return demandDate;
    }

    public void setDemandDate(Date demandDate) {
        this.demandDate = demandDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    @Column(length = 20)
    public String getCeaNum() {
        return ceaNum;
    }

    public void setCeaNum(String ceaNum) {
        this.ceaNum = ceaNum;
    }

    @ManyToOne
    @JoinColumn(name = "applyUser")
    public User getDemandUser() {
        return demandUser;
    }

    public void setDemandUser(User demandUser) {
        this.demandUser = demandUser;
    }

    @Column(length = 50)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false)
    public DemandStatus getStatus() {
        return status;
    }

    public void setStatus(DemandStatus status) {
        this.status = status;
    }

    @ManyToOne
    @JoinColumn(name = "department")
    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDemandType() {
        return demandType;
    }

    public void setDemandType(String demandType) {
        this.demandType = demandType;
    }
}
