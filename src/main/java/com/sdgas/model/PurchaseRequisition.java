package com.sdgas.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 请购单
 * Created by 120378 on 2014/7/14.
 */

@Entity
@Table(name = "pr")
public class PurchaseRequisition {

    /**
     * 标识列
     */
    private int id;
    /**
     * 请购单号
     */
    private String prId;

    /**
     * 请购人
     */
    private User applyUser;

    /**
     * 请购日期
     */
    private Date prDate;

    /**
     * 请购单状态
     */
    private PRStatus status;

    /**
     * 请购项目
     */
    private String project;

    /**
     * 申请日期
     */
    private Date applyDate;

    /**
     * 需求部门
     */
    private Department department;

    /**
     * CEA号
     */
    private String ceaNum;

    /**
     * 意见
     */
    private String comment;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 附件
     */
    private String attachment;

    /**
     * 需求类型
     */
    private String demandType;

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(length = 15, unique = true)
    public String getPrId() {
        return prId;
    }

    public void setPrId(String prId) {
        this.prId = prId;
    }

    @ManyToOne
    @JoinColumn(name = "user")
    public User getApplyUser() {
        return applyUser;
    }

    public void setApplyUser(User applyUser) {
        this.applyUser = applyUser;
    }

    @Temporal(TemporalType.DATE)
    public Date getPrDate() {
        return prDate;
    }

    public void setPrDate(Date prDate) {
        this.prDate = prDate;
    }

    @Column(length = 150)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Enumerated(EnumType.ORDINAL)
    public PRStatus getStatus() {
        return status;
    }

    public void setStatus(PRStatus status) {
        this.status = status;
    }

    @Column(length = 20)
    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    @Temporal(TemporalType.TIMESTAMP)
    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public String getCeaNum() {
        return ceaNum;
    }

    @Column(length = 20)
    public void setCeaNum(String ceaNum) {
        this.ceaNum = ceaNum;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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

    public String getDemandType() {
        return demandType;
    }

    public void setDemandType(String demandType) {
        this.demandType = demandType;
    }
}
