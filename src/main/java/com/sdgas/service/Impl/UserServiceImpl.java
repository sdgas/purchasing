package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.*;
import com.sdgas.service.DepartmentService;
import com.sdgas.service.PositionService;
import com.sdgas.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.Query;


/**
 * Created by 120378 on 2014/5/13.
 */
@Service
@Transactional
public class UserServiceImpl extends DaoSupport<User> implements UserService {

    private PositionService positionService;
    private DepartmentService departmentService;

    @Override
    public User findById(String userId) {
        return this.find(User.class, userId);
    }

    @Override
    public User findNextUser(String workflow, User user, PurchaseRequisition pr) {
        switch (workflow) {
            case "DP":
                return dpSendMail(user);
            case "PR":
                return prSendMail(user, pr);
            default:
                return null;
        }
    }

    private User dpSendMail(User user) {
        Query query = em.createQuery("select o from User o where department.departmentName=?1 and position.positionName=?2 and remarks like ?3");
        if ("员工".equals(user.getPosition().getPositionName()) || "管理员".equals(user.getPosition().getPositionName())) {
            query = em.createQuery("select o from User o where department.departmentName=?1 and position.positionName=?2");
            query.setParameter(1, user.getDepartment().getDepartmentName());
            query.setParameter(2, "部门经理");
        } else if ("部门经理".equals(user.getPosition().getPositionName())) {
            query.setParameter(1, "经营班子");
            query.setParameter(2, "分管领导");
            query.setParameter(3, "%" + user.getDepartment().getDepartmentName() + "%");
        } else if ("分管领导".equals(user.getPosition().getPositionName())) {
            query.setParameter(1, "招标采购部");
            query.setParameter(2, "员工");
            query.setParameter(3, "%物料采购%");
        }
        return (User) query.getSingleResult();
    }

    private User prSendMail(User user, PurchaseRequisition pr) {
        Query query = em.createQuery("select o from User o where department.departmentName=?1 and position.positionName=?2 and remarks like ?3");
        if ("员工".equals(user.getPosition().getPositionName())) {
            query = em.createQuery("select o from User o where department.departmentName=?1 and position.positionName=?2");
            query.setParameter(1, user.getDepartment().getDepartmentName());
            query.setParameter(2, "部门经理");
        } else if ("部门经理".equals(user.getPosition().getPositionName())) {
            query.setParameter(1, "经营班子");
            query.setParameter(2, "分管领导");
            query.setParameter(3, "%招标采购部%");
        } else if ("分管领导".equals(user.getPosition().getPositionName())) {
            if (pr.getStatus() == PRStatus.GM) {
                query = em.createQuery("select o from User o where department.departmentName=?1 and position.positionName=?2");
                query.setParameter(1, "经营班子");
                query.setParameter(2, "总经理");
            } else {
                query.setParameter(1, "招标采购部");
                query.setParameter(2, "员工");
                query.setParameter(3, "%物料采购%");
            }
        } else if ("总经理".equals(user.getPosition().getPositionName())) {
            query = em.createQuery("select o from User o where department.departmentName=?1 and position.positionName=?2");
            query.setParameter(1, "经营班子");
            query.setParameter(2, "总经理");
        }
        return (User) query.getSingleResult();
    }

    @Resource(name = "positionServiceImpl")
    public void setPositionService(PositionService positionService) {
        this.positionService = positionService;
    }

    @Resource(name = "departmentServiceImpl")
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
}
