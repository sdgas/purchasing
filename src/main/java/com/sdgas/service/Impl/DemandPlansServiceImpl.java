package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.DemandPlans;
import com.sdgas.model.DemandStatus;
import com.sdgas.model.User;
import com.sdgas.service.DemandPlansService;
import com.sdgas.service.DepartmentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by 120378 on 2014/5/13.
 */
@Service
@Transactional
public class DemandPlansServiceImpl extends DaoSupport<DemandPlans> implements DemandPlansService {

    private DepartmentService departmentService;

    @Override
    public String findDPByUser(User user) {
        switch (user.getPosition().getPositionName()) {
            case "管理员":
            case "总经理":
                return "";
            case "部门经理":
                return "department = '" + user.getDepartment().getDepartmentId() + "'";
            case "分管领导":
                return create(user, false);
            case "员工":
                return creatMap(user);
            default:
                return "bad";
        }
    }

    @Override
    public String checkDP(User user) {
        switch (user.getPosition().getPositionName()) {
            case "管理员":
                return "";
            case "部门经理":
                return "department = '" + user.getDepartment().getDepartmentId() + "' and status=" + DemandStatus.APPLY.getStatus();
            case "分管领导":
                return create(user, true);
            case "员工":
                return creatMap(user);
            default:
                return "bad";
        }
    }

    @Override
    public List<DemandPlans> findBPWhitPR(boolean b, String msg) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("status", DemandStatus.PR);
        if (b) {
            List<DemandPlans> demandPlanses = this.findByFields(DemandPlans.class, params);
            for (int i = 0; i < demandPlanses.size(); i++) {
                if (!demandPlanses.get(i).getProject().contains(msg)) {
                    demandPlanses.remove(demandPlanses.get(i));
                    i--;
                }
            }
            return demandPlanses;
        } else
            return this.findByFields(DemandPlans.class, params);
    }

    public String create(User user, boolean b) {
        String[] departments = user.getRemarks().trim().split("；");
        String query;
        if (departments.length > 1) {
            query = "department in ('" + departmentService.findDepartmentByName(departments[0]).getDepartmentId() + "' ,'" + departmentService.findDepartmentByName(departments[1]).getDepartmentId() + "')";
        } else {
            query = "department ='" + departmentService.findDepartmentByName(departments[0]).getDepartmentId() + "'";
        }
        if (b)
            query = query + " and status=" + DemandStatus.HEAD.getStatus();
        return query;
    }

    public String creatMap(User user) {
        String query;
        if ("物料采购".equals(user.getRemarks()))
            query = "status=" + DemandStatus.LEADER.getStatus();
        else
            query = "demandUser='" + user.getUserId() + "'";
        return query;
    }

    @Resource(name = "departmentServiceImpl")
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
}
