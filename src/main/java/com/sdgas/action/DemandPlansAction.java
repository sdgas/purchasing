package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.DemandPlansVO;
import com.sdgas.base.PageView;
import com.sdgas.model.*;
import com.sdgas.service.DemandPlansService;
import com.sdgas.service.PurchaseMaterialService;
import com.sdgas.service.PurchaseRequisitionService;
import com.sdgas.service.UserService;
import com.sdgas.util.Mail;
import com.sdgas.util.UserUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by 120378 on 2014/7/30.
 */

@Component("demandPlans")
@Scope("prototype")
public class DemandPlansAction extends MyActionSupport implements ModelDriven<DemandPlansVO> {

    private DemandPlansVO demandPlansVO = new DemandPlansVO();
    private UserService userService;
    private DemandPlansService demandPlansService;
    private PurchaseRequisitionService purchaseRequisitionService;
    private PurchaseMaterialService purchaseMaterialService;

    private static final Logger logger = LogManager.getLogger(DemandPlansAction.class);
    //获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    //需求审核
    public String check() {
        DemandPlans demandPlans = demandPlansService.find(DemandPlans.class, demandPlansVO.getDpId());
        PurchaseMaterial pm = purchaseMaterialService.findMaterialByPlan(demandPlans).get(0);
        PurchaseRequisition pr = pm.getRequisition();

        if (demandPlansVO.getStatus().equals("true")) {
            switch (demandPlans.getStatus()) {
                case APPLY:
                    demandPlans.setStatus(DemandStatus.HEAD);
                    break;
                case HEAD:
                    demandPlans.setStatus(DemandStatus.LEADER);
                    break;
                case LEADER:
                    demandPlans.setStatus(DemandStatus.PR);
                    //更新请购单
                    pr.setStatus(PRStatus.DEMAND);
                    purchaseRequisitionService.update(pr);
                    break;
            }
            logger.info(user.getUserName() + "修改了需求计划申请（项目：" + demandPlans.getProject() + "的状态).IP:" + ip);
        } else {
            demandPlans.setStatus(DemandStatus.CANCEL);
            List<PurchaseMaterial> purchaseMaterials = purchaseMaterialService.findMaterialByPlan(demandPlans);
            for (PurchaseMaterial purchaseMaterial : purchaseMaterials) {
                purchaseMaterial.setStatus(FormStatus.CANCEL);
                purchaseMaterial.setRequisition(null);
                purchaseMaterialService.update(purchaseMaterial);
            }
            purchaseRequisitionService.delete(pr);
            logger.info(user.getUserName() + "终止了需求计划申请（项目：" + demandPlans.getProject() + "的审批流程).IP:" + ip);
        }
        if (demandPlans.getComment() != null)
            demandPlans.setComment(demandPlans.getComment() + "<br/>" + demandPlansVO.getRemarks());
        else
            demandPlans.setComment(demandPlansVO.getRemarks());

        demandPlansService.update(demandPlans);

        //TODO:MAIL
        if (demandPlans.getStatus() == DemandStatus.CANCEL) {
            User person = demandPlans.getDemandUser();
            String msg = "项目：" + demandPlans.getProject() + "的需求计划申请单审批不通过，已被取消！";
            Mail.sendMail(person.getEmail(), "请购单审批", msg, "html");
        } else {
            User person = userService.findNextUser("DP", user, null);
            String msg = demandPlans.getDemandUser().getDepartment().getDepartmentName() + ":" + demandPlans.getDemandUser().getUserName() + "的需求计划需要审批。项目为："
                    + demandPlans.getProject();
            Mail.sendMail(person.getEmail(), "需求计划审批", msg, "html");
        }

        demandPlansVO.setResultMessage("<script>alert('审批流程完成！');location.href='DemandPlans.action?flag=2';</script>");
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        if (UserUtil.checkUserLogIn(user)) {
            demandPlansVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<DemandPlans> pageView = new PageView<DemandPlans>(maxResult,
                demandPlansVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("demandDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");
        String str;
        if (demandPlansVO.getFlag() == 2) {
            str = demandPlansService.checkDP(user);
        } else
            str = demandPlansService.findDPByUser(user);
        if (!"".equals(str)) {
            if (!"bad".equals(str))
                jpql.append(" and ").append(str);
            else {
                demandPlansVO.setResultMessage("<script>alert('该用户尚未分配职位！请联系管理员');location.href='index.jsp';</script>");
                return ERROR;
            }
        }

        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(demandPlansService.getScrollData(DemandPlans.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        demandPlansVO.setPageView(pageView);
        view = "/page/dp/findPlan.jsp";
        return VIEW;
    }

    public String search() {
        if (UserUtil.checkUserLogIn(user)) {
            demandPlansVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<DemandPlans> pageView = new PageView<DemandPlans>(maxResult,
                demandPlansVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("demandDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");
        String str = demandPlansService.findDPByUser(user);
        if (!"".equals(str)) {
            if (!"bad".equals(str))
                jpql.append(" and ").append(str);
            else {
                demandPlansVO.setResultMessage("<script>alert('该用户尚未分配职位！请联系管理员');location.href='index.jsp';</script>");
                return ERROR;
            }
        }
        jpql.append(" and project LIKE '%" + demandPlansVO.getProject() + "%'");
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(demandPlansService.getScrollData(DemandPlans.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        demandPlansVO.setPageView(pageView);
        if (pageView.getRecords().isEmpty()) {
            demandPlansVO.setResultMessage("<script>alert('尚未找到相关信息');location.href='DemandPlans.action';</script>");
            return ERROR;
        }
        view = "/page/dp/findPlan.jsp";
        return VIEW;
    }

    @Override
    public DemandPlansVO getModel() {
        return demandPlansVO;
    }

    @Resource(name = "demandPlansServiceImpl")
    public void setDemandPlansService(DemandPlansService demandPlansService) {
        this.demandPlansService = demandPlansService;
    }

    @Resource(name = "purchaseRequisitionServiceImpl")
    public void setPurchaseRequisitionService(PurchaseRequisitionService purchaseRequisitionService) {
        this.purchaseRequisitionService = purchaseRequisitionService;
    }

    @Resource(name = "purchaseMaterialServiceImpl")
    public void setPurchaseMaterialService(PurchaseMaterialService purchaseMaterialService) {
        this.purchaseMaterialService = purchaseMaterialService;
    }

    @Resource(name = "userServiceImpl")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
