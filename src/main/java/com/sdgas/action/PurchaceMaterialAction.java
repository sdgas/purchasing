package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.PurchaseMaterialVO;
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
import java.util.List;

/**
 * Created by 120378 on 2014/8/5.
 */
@Component("purchaceMaterial")
@Scope("prototype")
public class PurchaceMaterialAction extends MyActionSupport implements ModelDriven<PurchaseMaterialVO> {

    private PurchaseMaterialVO purchaseMaterialVO = new PurchaseMaterialVO();
    private UserService userService;
    private PurchaseMaterialService purchaseMaterialService;
    private MaterialService materialService;
    private DemandPlansService demandPlansService;
    private DepartmentService departmentService;
    private PurchaseRequisitionService purchaseRequisitionService;

    private static final Logger logger = LogManager.getLogger(DemandPlansAction.class);
    //获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    //添加需求材料
    @Override
    public String execute() throws Exception {
        if (UserUtil.checkUserLogIn(user)) {
            purchaseMaterialVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        //添加需求计划
        DemandPlans demandPlan = new DemandPlans();
        demandPlan.setApplyDate(ChangeTime.parseDate(ChangeTime.getCurrentDate()));
        demandPlan.setCeaNum(purchaseMaterialVO.getCeaNum());
        demandPlan.setDemandType(purchaseMaterialVO.getDemandType());
        demandPlan.setDemandDate(ChangeTime.parseShortDate(purchaseMaterialVO.getDemandDate()));

        demandPlan.setDemandUser(user);
        Department department = departmentService.find(Department.class, Integer.valueOf(purchaseMaterialVO.getDepartmentId()));
        demandPlan.setDepartment(department);
        demandPlan.setProject(purchaseMaterialVO.getProject());
        demandPlan.setRemarks(purchaseMaterialVO.getRemarks());
        demandPlan.setStatus(DemandStatus.APPLY);

        PurchaseRequisition pr = new PurchaseRequisition();
        pr.setCeaNum(purchaseMaterialVO.getCeaNum());
        pr.setProject(purchaseMaterialVO.getProject());
        pr.setDepartment(department);
        pr.setDemandType(purchaseMaterialVO.getDemandType());
        pr.setPrDate(ChangeTime.parseShortDate(purchaseMaterialVO.getDemandDate()));

        //处理附件
        if (purchaseMaterialVO.getAttachment() != null) {
            String name = purchaseMaterialService.uploadAttachment(purchaseMaterialVO);
            if (name != "") {
                demandPlan.setAttachment(name);
                pr.setAttachment(name);
            } else {
                purchaseMaterialVO.setResultMessage("<script>alert('附件上传失败，请重新上传！');location.href='/purchasing/page/dp/addPlans.jsp';</script>");
                return ERROR;
            }
        }
        purchaseRequisitionService.save(pr);
        demandPlansService.save(demandPlan);

        //TODO:MAIL
        User person = userService.findNextUser("DP", user, null);
        String msg = user.getDepartment().getDepartmentName() + ":" + user.getUserName() + "提交了需求计划。项目为："
                + demandPlan.getProject();
        Mail.sendMail(person.getEmail(), "需求计划审批", msg, "html");

        logger.info(user.getUserName() + ",新增需求计划id：" + demandPlan.getDpId() + " IP:" + ip);
        String[] amounts = purchaseMaterialVO.getAmount().trim().split(",");
        String[] materialIds = purchaseMaterialVO.getMaterialIds().trim().split(",");

        try {
            for (int i = 0; i < materialIds.length; i++) {
                Material material = materialService.findByMaterialId(materialIds[i].trim());
                if (material == null)
                    throw new Exception("物料不存在!");
                double amount = Double.valueOf(amounts[i]);
                PurchaseMaterial purchaseMaterial = new PurchaseMaterial();
                purchaseMaterial.setAmount(amount);
                purchaseMaterial.setMaterial(material);
                purchaseMaterial.setPlan(demandPlan);
                purchaseMaterial.setStatus(FormStatus.DEMAND);
                purchaseMaterial.setRequisition(pr);
                purchaseMaterialService.save(purchaseMaterial);
                logger.info(user.getUserName() + ",新增需求计划（" + demandPlan.getDpId() + "）物料id：" + purchaseMaterial.getId() + " IP:" + ip);
            }
        } catch (Exception e) {
            logger.error(e);
            List<PurchaseMaterial> materialList = purchaseMaterialService.findMaterialByPlan(demandPlan);
            if (materialList.size() != 0) {
                for (PurchaseMaterial m : materialList) {
                    purchaseMaterialService.clear();
                    purchaseMaterialService.delete(m);
                }
            }
            demandPlansService.delete(demandPlan);
            purchaseMaterialVO.setResultMessage("<script>alert('输入物料信息有误，请重新录入！');location.href='/purchasing/page/dp/addPlans.jsp';</script>");
            return ERROR;
        }
        purchaseMaterialVO.setResultMessage("<script>alert('需求计划已成功提交！');location.href='/purchasing/page/dp/addPlans.jsp';</script>");
        return SUCCESS;
    }

    public String findOne() {
        DemandPlans demandPlans = demandPlansService.find(DemandPlans.class, purchaseMaterialVO.getDpId());
        List<PurchaseMaterial> purchaseMaterials = purchaseMaterialService.findMaterialByPlan(demandPlans);
        purchaseMaterialVO.setPurchaseMaterials(purchaseMaterials);
        purchaseMaterialVO.setDemandPlans(demandPlans);
        view = "/page/dp/showPlans.jsp";
        return VIEW;
    }

    @Override
    public PurchaseMaterialVO getModel() {
        return purchaseMaterialVO;
    }

    @Resource(name = "purchaseMaterialServiceImpl")
    public void setPurchaseMaterialService(PurchaseMaterialService purchaseMaterialService) {
        this.purchaseMaterialService = purchaseMaterialService;
    }

    @Resource(name = "materialServiceImpl")
    public void setMaterialService(MaterialService materialService) {
        this.materialService = materialService;
    }

    @Resource(name = "demandPlansServiceImpl")
    public void setDemandPlansService(DemandPlansService demandPlansService) {
        this.demandPlansService = demandPlansService;
    }

    @Resource(name = "departmentServiceImpl")
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
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
