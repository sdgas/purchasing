package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.PRVO;
import com.sdgas.base.PageView;
import com.sdgas.model.*;
import com.sdgas.service.*;
import com.sdgas.util.ChangeTime;
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
 * Created by 120378 on 2014/5/12.
 */
@Component("purchaseRequisition")
@Scope("prototype")
public class PurchaseRequisitionAction extends MyActionSupport implements ModelDriven<PRVO> {

    private PRVO prVo = new PRVO();
    private UserService userService;
    private DemandPlansService demandPlansService;
    private PurchaseMaterialService purchaseMaterialService;
    private SupplierService supplierService;
    private PurchaseRequisitionService purchaseRequisitionService;
    private static final Logger logger = LogManager.getLogger(PurchaseRequisitionAction.class);

    //获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    @Override
    public String execute() throws Exception {

        DemandPlans demandPlans = demandPlansService.find(DemandPlans.class, prVo.getDpId());
        List<PurchaseMaterial> purchaseMaterials = purchaseMaterialService.findMaterialByPlan(demandPlans);
        prVo.setPurchaseMaterials(purchaseMaterials);
        prVo.setDemandPlans(demandPlans);
        view = "/page/pr/createPR.jsp";
        return VIEW;
    }

    public String addPR() {

        DemandPlans demandPlans = demandPlansService.find(DemandPlans.class, prVo.getDpId());
        List<PurchaseMaterial> purchaseMaterials = purchaseMaterialService.findMaterialByPlan(demandPlans);

        demandPlans.setStatus(DemandStatus.PR);
        demandPlansService.update(demandPlans);
        demandPlansService.clear();

        PurchaseRequisition pr = purchaseMaterials.get(0).getRequisition();
        pr.setApplyUser(user);
        pr.setPrId(prVo.getPrId());
        pr.setStatus(PRStatus.PR);
        pr.setRemarks(prVo.getRemarks());
        pr.setApplyDate(ChangeTime.parseDate(ChangeTime.getCurrentDate()));
        purchaseRequisitionService.update(pr);
        logger.info(user.getPosition().getPositionName() + " " + user.getUserName() + ",填写请购单（" + pr.getPrId() + "） IP:" + ip);


        String[] materialIds = prVo.getMaterialId().split(",");
        String[] suppliers = prVo.getSupplier().split(",");
        String[] price = prVo.getPrice().split(",");
        for (int i = 0; i < materialIds.length; i++) {
            PurchaseMaterial pm = purchaseMaterialService.findMaterial(demandPlans, materialIds[i].trim());
            pm.setRequisition(pr);
            pm.setStatus(FormStatus.REQUISITION);
            Supplier supplier = supplierService.findSupplierByName(suppliers[i].trim());
            pm.setSupplier(supplier);
            pm.setPrice(Double.valueOf(price[i].trim()));
            pm.setTotalPay(pm.getAmount() * pm.getPrice());
            purchaseMaterialService.update(pm);
            purchaseMaterialService.clear();
        }

        //TODO:MAIL
        User person = userService.findNextUser("DP", user, null);
        String msg = "项目：" + pr.getProject() + "的请购单，请审批！";
        Mail.sendMail(person.getEmail(), "请购单审批", msg, "html");

        //返回查询页面
        prVo.setResultMessage("<script>alert('申请成功！');location.href='PurchaseRequisition!findAll.action';</script>");
        return SUCCESS;
    }

    public String findAll() {
        if (UserUtil.checkUserLogIn(user)) {
            prVo.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<PurchaseRequisition> pageView = new PageView<PurchaseRequisition>(maxResult,
                prVo.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("prDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("");
        if (prVo.getFlag() == 2)
            jpql.append("status IS NOT NULL");
        else
            jpql.append("status=" + PRStatus.DEMAND.getStatus());
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        try {
            pageView.setQueryResult(purchaseRequisitionService.getScrollData(PurchaseRequisition.class, firstIndex, maxResult, jpql.toString(),
                    params.toArray(), orderBy));
            prVo.setPageView(pageView);
        } catch (Exception e) {
            prVo.setResultMessage("<script>alert('无法查询数据！请重试');location.href='PurchaseRequisition!findAll.action';</script>");
            return SUCCESS;
        }
        view = "/page/pr/findAllPR.jsp";
        return VIEW;
    }

    public String search() {
        if (UserUtil.checkUserLogIn(user)) {
            prVo.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<PurchaseRequisition> pageView = new PageView<PurchaseRequisition>(maxResult,
                prVo.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("prDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("status IS NOT NULL");
        if (!prVo.getProject().isEmpty())
            jpql.append(" and project like '%" + prVo.getProject()).append("%' or prId like '%" + prVo.getProject()).append("%'");
        if (!prVo.getPrDate().isEmpty())
            jpql.append(" and prDate <= '" + prVo.getPrDate()).append("'");
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        try {
            pageView.setQueryResult(purchaseRequisitionService.getScrollData(PurchaseRequisition.class, firstIndex, maxResult, jpql.toString(),
                    params.toArray(), orderBy));
            prVo.setPageView(pageView);
        } catch (Exception e) {
            prVo.setResultMessage("<script>alert('无法查询数据！请重试');location.href='PurchaseRequisition!findAll.action';</script>");
            return SUCCESS;
        }
        if (pageView.getRecords().isEmpty()) {
            if (prVo.getFlag() == 9)
                prVo.setResultMessage("<script>alert('尚未找到相关信息');location.href='PurchaseRequisition!findOrder.action';</script>");
            else
                prVo.setResultMessage("<script>alert('尚未找到相关信息');location.href='PurchaseRequisition!findAll.action?flag=2';</script>");
            return ERROR;
        }
        if (prVo.getFlag() == 9)
            view = "/page/order/findAll.jsp";
        else
            view = "/page/pr/findAllPR.jsp";
        return VIEW;
    }

    public String showOne() {
        PurchaseRequisition pr = purchaseRequisitionService.findPRByPrId(prVo.getPrId());
        List<PurchaseMaterial> purchaseMaterials = purchaseMaterialService.findMaterialByPR(pr);
        prVo.setPurchaseMaterials(purchaseMaterials);
        prVo.setPr(pr);
        view = "/page/pr/showOne.jsp";
        return VIEW;
    }

    //审批
    public String check() {
        if (UserUtil.checkUserLogIn(user)) {
            prVo.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        PurchaseRequisition pr = purchaseRequisitionService.findPRByPrId(prVo.getPrId());
        List<PurchaseMaterial> purchaseMaterials = purchaseMaterialService.findMaterialByPR(pr);
        if (prVo.getStatus().equals("true")) {
            switch (pr.getStatus()) {
                case PR:
                    pr.setStatus(PRStatus.HEAD);
                    break;
                case HEAD:
                    pr.setStatus(PRStatus.LEADER);
                    pr = checkGoToGM(pr, purchaseMaterials);
                    break;
                case LEADER:
                    pr.setStatus(PRStatus.GM);
                    break;
                case GM:
                    pr.setStatus(PRStatus.PU);
                    break;
            }
        } else {
            pr.setStatus(PRStatus.CANCEL);
            for (PurchaseMaterial purchaseMaterial : purchaseMaterials) {
                purchaseMaterial.setStatus(FormStatus.CANCEL);
                purchaseMaterialService.update(purchaseMaterial);
            }
        }
        if (pr.getComment() != null)
            pr.setComment(pr.getComment() + "<br/>" + prVo.getRemarks());
        else
            pr.setComment(prVo.getRemarks());
        purchaseRequisitionService.update(pr);

        //TODO:MAIL
        if (pr.getStatus() == PRStatus.CANCEL) {
            User person = pr.getApplyUser();
            String msg = "项目：" + pr.getProject() + "的请购单审批不通过，已被取消！";
            Mail.sendMail(person.getEmail(), "请购单审批", msg, "html");
        } else {

            User person = userService.findNextUser("DP", user, null);
            String msg = "项目：" + pr.getProject() + "的请购单，请审批！";
            Mail.sendMail(person.getEmail(), "请购单审批", msg, "html");
        }
        prVo.setResultMessage("<script>alert('审批流程完成！');location.href='PurchaseRequisition!findAll.action?flag=2';</script>");
        return SUCCESS;
    }

    public String findOrder() {
        if (UserUtil.checkUserLogIn(user)) {
            prVo.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<PurchaseRequisition> pageView = new PageView<PurchaseRequisition>(maxResult,
                prVo.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("prDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("");

        jpql.append("status=" + PRStatus.GM.getStatus());
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(purchaseRequisitionService.getScrollData(PurchaseRequisition.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        prVo.setPageView(pageView);
        view = "/page/order/findAll.jsp";
        return VIEW;
    }

    //是否需要梁总审批
    private PurchaseRequisition checkGoToGM(PurchaseRequisition pr, List<PurchaseMaterial> purchaseMaterials) {
        if ("市政类工程".equals(pr.getDemandType())) {
            double total = 0.0d;
            for (PurchaseMaterial pm : purchaseMaterials) {
                if (pm.getPrice() >= 50000)
                    return pr;
                total += pm.getTotalPay();
            }
            if (total >= 300000)
                return pr;
        } else if ("工商小区工程".equals(pr.getDemandType())) {
            double total = 0.0d;
            for (PurchaseMaterial pm : purchaseMaterials) {
                if (pm.getPrice() >= 50000)
                    return pr;
                total += pm.getTotalPay();
            }
            if (total >= 100000)
                return pr;
        } else {
            double total = 0.0d;
            for (PurchaseMaterial pm : purchaseMaterials) {
                if (pm.getPrice() >= 50000)
                    return pr;
                total += pm.getTotalPay();
            }
            if (total >= 500000)
                return pr;
        }
        pr.setStatus(PRStatus.GM);
        return pr;
    }

    @Override
    public PRVO getModel() {
        return prVo;
    }

    @Resource(name = "demandPlansServiceImpl")
    public void setDemandPlansService(DemandPlansService demandPlansService) {
        this.demandPlansService = demandPlansService;
    }

    @Resource(name = "purchaseMaterialServiceImpl")
    public void setPurchaseMaterialService(PurchaseMaterialService purchaseMaterialService) {
        this.purchaseMaterialService = purchaseMaterialService;
    }

    @Resource(name = "supplierServiceImpl")
    public void setSupplierService(SupplierService supplierService) {
        this.supplierService = supplierService;
    }

    @Resource(name = "purchaseRequisitionServiceImpl")
    public void setPurchaseRequisitionService(PurchaseRequisitionService purchaseRequisitionService) {
        this.purchaseRequisitionService = purchaseRequisitionService;
    }

    @Resource(name = "userServiceImpl")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
