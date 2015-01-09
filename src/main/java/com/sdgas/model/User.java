package com.sdgas.model;

import javax.persistence.*;

/**
 * 用户（员工）
 * Created by 120378 on 2014/5/13.
 */

@Entity
@Table(name = "person")
public class User {

    /**
     * 用户编号（工号）
     */
    private String userId;
    /**
     * 用户姓名
     */
    private String userName;

    /**
     * 用户登录密码
     */
    private String password;

    /**
     * 部门
     */
    private Department department;

    /**
     * 职位
     */
    private Position position;

    /**
     * 邮件
     */
    private String email;

    /**
     * 备注，仅分管领导以及招标使用
     */
    private String remarks;

    @Id
    @Column(length = 10)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(length = 10, nullable = false)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(length = 20, nullable = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ManyToOne
    @JoinColumn(name = "department")
    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @ManyToOne
    @JoinColumn(name = "position", nullable = false)
    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(length = 25, nullable = false, unique = true)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
