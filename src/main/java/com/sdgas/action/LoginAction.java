package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.UserVO;
import com.sdgas.model.DemandPlans;
import com.sdgas.model.PurchaseOrder;
import com.sdgas.model.PurchaseRequisition;
import com.sdgas.model.User;
import com.sdgas.service.DemandPlansService;
import com.sdgas.service.OrderService;
import com.sdgas.service.PurchaseRequisitionService;
import com.sdgas.service.UserService;
import com.sdgas.util.SystemHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by 120378 on 2014/5/13.
 */
@Component("login")
@Scope("prototype")
public class LoginAction extends MyActionSupport implements ModelDriven<UserVO> {

    private UserService userService;
    private DemandPlansService demandPlansService;
    private PurchaseRequisitionService purchaseRequisitionService;
    private OrderService orderService;

    private final UserVO userVO = new UserVO();

    private static String ip = "";

    private static final Logger logger = LogManager.getLogger(LoginAction.class);

    //用户登录
    @Override
    public String execute() throws Exception {

        if (userVO.getUserId().isEmpty() || userVO.getPassword().isEmpty()) {
            userVO.setResultMessage("<script>alert('请填写佛燃工号或密码！');location.href='login.jsp';</script>");
            return ERROR;
        }

        User user = userService.findById(userVO.getUserId());
        if (user == null) {
            userVO.setResultMessage("<script>alert('用户不存在！');location.href='login.jsp';</script>");
            return ERROR;
        }
        logger.entry(user.getUserName());

        if (userVO.getPassword().equals(user.getPassword())) {
            storePersonToSession(user);
            logger.info(user.getPosition().getPositionName() + " " + user.getUserName() + ",登录系统 IP:" + ip);
            HttpServletRequest request = ServletActionContext.getRequest();
            Object obj = request.getSession().getAttribute("requestURI");
            if (obj != null) {
                view = obj.toString();
            } else {
                //todo:同步indexPage方法
                List<DemandPlans> demandPlanses = demandPlansService.findAll();
                List<PurchaseRequisition> purchaseRequisitions = purchaseRequisitionService.findAll();
                List<PurchaseOrder> purchaseOrders = new ArrayList<PurchaseOrder>();
                userVO.setDemandPlanses(demandPlanses);
                userVO.setPurchaseOrders(purchaseOrders);
                userVO.setPurchaseRequisitions(purchaseRequisitions);
                view = "/index.jsp";
                return VIEW;
            }
            logger.trace(obj.toString());
            return VIEW;
        }
        logger.info("用户:" + user.getUserName() + "登录密码错误！");
        logger.exit(user.getUserName());
        userVO.setResultMessage("<script>alert('密码错误！');location.href='login.jsp';</script>");
        return ERROR;
    }

    public String loginOut() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        User person = (User) session.getAttribute("person");
        if (person != null) {
            logger.info(person.getPosition().getPositionName() + " " + person.getUserName() + "，登出系统");
            session.removeAttribute("person");
            //session.invalidate();
        }
        view = "/login.jsp";
        return VIEW;
    }

    //todo:复制login方法
    public String indexPage() {
        List<DemandPlans> demandPlanses = demandPlansService.findAll();
        List<PurchaseRequisition> purchaseRequisitions = purchaseRequisitionService.findAll();
        List<PurchaseOrder> purchaseOrders = new ArrayList<PurchaseOrder>();
        userVO.setDemandPlanses(demandPlanses);
        userVO.setPurchaseOrders(purchaseOrders);
        userVO.setPurchaseRequisitions(purchaseRequisitions);
        view = "/index.jsp";
        return VIEW;
    }


    //修改密码
    public String alterPwd() {

        User user = userService.findById(userVO.getUserId());
        if (!user.getPassword().equals(userVO.getPassword())) {
            userVO.setResultMessage("<script>alert('原密码错误');location.href='/purchasing/page/message/alterPwd.jsp';</script>");
            logger.info(user.getPosition().getPositionName() + ":" + user.getUserName() + " 修改用户密码，原密码错误）操作IP：" + ip);
            return ERROR;
        } else {
            user.setPassword(userVO.getPwd2());
            userService.update(user);
            userVO.setResultMessage("<script>alert('修改密码成功！请重新登录系统');location.href='login.jsp';</script>");
            logger.info(user.getPosition().getPositionName() + ":" + user.getUserName() + " 修改用户密码成功。操作IP：" + ip);
            return SUCCESS;
        }
    }

    @Override
    public UserVO getModel() {
        return userVO;
    }

    @Resource(name = "userServiceImpl")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private void storePersonToSession(User target) {
        HttpSession session = ServletActionContext.getRequest().getSession();
        User storedPerson = (User) session.getAttribute("person");
        ip = SystemHelper.getIpAddress();
        if (!ip.trim().equals("") && (storedPerson == null || !storedPerson.equals(target))) {
            session.setAttribute("person", target);
            session.setAttribute("ip", ip);
            session.setAttribute("loginKey", "success");
            session.setMaxInactiveInterval(-1);
        }
    }

    @Resource(name = "demandPlansServiceImpl")
    public void setDemandPlansService(DemandPlansService demandPlansService) {
        this.demandPlansService = demandPlansService;
    }

    @Resource(name = "purchaseRequisitionServiceImpl")
    public void setPurchaseRequisitionService(PurchaseRequisitionService purchaseRequisitionService) {
        this.purchaseRequisitionService = purchaseRequisitionService;
    }

    @Resource(name = "orderServiceImpl")
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
}
