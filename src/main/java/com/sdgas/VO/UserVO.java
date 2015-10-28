package com.sdgas.VO;

import com.sdgas.model.DemandPlans;
import com.sdgas.model.PurchaseOrder;
import com.sdgas.model.PurchaseRequisition;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 120378 on 2014/5/13.
 */
public class UserVO extends BaseVO {


    private String userId;

    private String userName;

    private String password;

    private String department;

    private String position;

    private String pwd1;

    private String pwd2;

    private List<DemandPlans> demandPlanses = new ArrayList<DemandPlans>();
    private List<PurchaseRequisition> purchaseRequisitions = new ArrayList<PurchaseRequisition>();
    private List<PurchaseOrder> purchaseOrders = new ArrayList<PurchaseOrder>();

    public String getPwd2() {
        return pwd2;
    }

    public void setPwd2(String pwd2) {
        this.pwd2 = pwd2;
    }

    public String getPwd1() {
        return pwd1;
    }

    public void setPwd1(String pwd1) {
        this.pwd1 = pwd1;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public List<DemandPlans> getDemandPlanses() {
        return demandPlanses;
    }

    public void setDemandPlanses(List<DemandPlans> demandPlanses) {
        this.demandPlanses = demandPlanses;
    }

    public List<PurchaseRequisition> getPurchaseRequisitions() {
        return purchaseRequisitions;
    }

    public void setPurchaseRequisitions(List<PurchaseRequisition> purchaseRequisitions) {
        this.purchaseRequisitions = purchaseRequisitions;
    }

    public List<PurchaseOrder> getPurchaseOrders() {
        return purchaseOrders;
    }

    public void setPurchaseOrders(List<PurchaseOrder> purchaseOrders) {
        this.purchaseOrders = purchaseOrders;
    }
}
