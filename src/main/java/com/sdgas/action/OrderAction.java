package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.OrderVO;
import com.sdgas.base.PageView;
import com.sdgas.model.*;
import com.sdgas.service.OrderService;
import com.sdgas.service.PurchaseMaterialService;
import com.sdgas.service.PurchaseRequisitionService;
import com.sdgas.service.SupplierService;
import com.sdgas.util.ChangeTime;
import com.sdgas.util.UserUtil;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by 斌 on 2014/9/3.
 */
@Component("order")
@Scope("prototype")
public class OrderAction extends MyActionSupport implements
        ModelDriven<OrderVO> {

    private final OrderVO orderVO = new OrderVO();
    private OrderService orderService;
    private PurchaseRequisitionService purchaseRequisitionService;
    private PurchaseMaterialService purchaseMaterialService;
    private SupplierService supplierService;
    private static final Logger logger = LogManager
            .getLogger(OrderAction.class);

    // 获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    @Override
    public String execute() throws Exception {
        if (UserUtil.checkUserLogIn(user)) {
            orderVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<PurchaseOrder> pageView = new PageView<PurchaseOrder>(
                maxResult, orderVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("orderDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");

        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(purchaseRequisitionService.getScrollData(
                PurchaseOrder.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        orderVO.setPageView(pageView);
        view = "/page/order/findAllOrder.jsp";
        return VIEW;
    }

    public String showOrder() {
        if (UserUtil.checkUserLogIn(user)) {
            orderVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }

        PurchaseRequisition pr = purchaseRequisitionService
                .findPRByPrId(orderVO.getPrId());
        List<PurchaseMaterial> pms = purchaseMaterialService
                .findMaterialByPR(pr);
        orderVO.setPurchaseMaterials(pms);
        orderVO.setPr(pr);
        view = "/page/order/addOrder.jsp";
        return VIEW;
    }

    public String addOrder() {
        PurchaseRequisition pr = purchaseRequisitionService
                .findPRByPrId(orderVO.getPrId());
        pr.setStatus(PRStatus.PU);
        purchaseMaterialService.update(pr);

        String[] orderIds = orderVO.getOrderId().split(",");
        String[] materialIds = orderVO.getMaterialId().split(",");
        String[] factNums = orderVO.getFactNum().split(",");
        for (int i = 0; i < orderIds.length; i++) {
            List<PurchaseMaterial> pms = purchaseMaterialService
                    .findMaterialByPR(pr);

            PurchaseOrder order = new PurchaseOrder();
            order.setAmount(Float.valueOf(factNums[i].trim()));
            order.setApplyUser(user);
            order.setConsignee(orderVO.getConsignee());
            order.setContactPhone(orderVO.getContactPhone());
            order.setDeliveryAddress(orderVO.getDeliveryAddress());
            order.setOrderDate(pr.getPrDate());
            order.setOrderId(orderIds[i].trim());
            order.setRemarks(orderVO.getRemarks());
            order.setStatus(OrderStatus.PU);

            for (PurchaseMaterial pm : pms) {
                if (pm.getMaterial().getMaterialId()
                        .equals(materialIds[i].trim())) {
                    order.setPm(pm);
                    order.setSupplier(pm.getSupplier());
                    break;
                }
            }
            order.setTotalPay(order.getPm().getPrice() * order.getAmount());
            orderService.save(order);
            logger.info(user.getPosition().getPositionName() + ":"
                    + user.getUserName() + "生成一张订单(" + order.getOrderId() + ")");
        }
        orderVO.setResultMessage("<script>alert('申请成功！');location.href='PurchaseRequisition!findOrder.action';</script>");
        return SUCCESS;
    }

    public String findOrder() {

        List<PurchaseOrder> order = orderService.findOrderByOrderId(orderVO
                .getOrderId());
        orderVO.setOrder(order.get(0));
        orderVO.setPurchaseOrders(order);
        if (orderVO.getFlag() == 4) {
            view = "/page/order/arrival.jsp";
        } else {
            view = "/page/order/showOne.jsp";
        }
        return VIEW;
    }

    public String check() {
        if (UserUtil.checkUserLogIn(user)) {
            orderVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }

        List<PurchaseOrder> order = orderService.findOrderByOrderId(orderVO
                .getOrderId());
        if (orderVO.getStatus().equals("true")) {
            for (PurchaseOrder purchaseOrder : order) {
                switch (purchaseOrder.getStatus()) {
                    case PU:
                        purchaseOrder.setStatus(OrderStatus.HEAD);
                        orderService.update(purchaseOrder);
                        logger.info(user.getPosition().getPositionName() + ":"
                                + user.getUserName() + "审批采购单（"
                                + orderVO.getOrderId() + ") IP：" + ip);
                        break;
                }
            }

        } else {
            for (PurchaseOrder purchaseOrder : order) {
                purchaseOrder.setStatus(OrderStatus.CANCEL);
                orderService.update(purchaseOrder);
            }
            logger.info(user.getPosition().getPositionName() + ":"
                    + user.getUserName() + "审批采购单（" + orderVO.getOrderId()
                    + ")不通过。IP:" + ip);
        }

        orderVO.setResultMessage("<script>alert('审批流程完成！');location.href='Order.action';</script>");
        return SUCCESS;
    }

    public String arrival() {
        if (UserUtil.checkUserLogIn(user)) {
            orderVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<PurchaseOrder> pageView = new PageView<PurchaseOrder>(
                maxResult, orderVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("orderDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("status="
                + OrderStatus.HEAD.getStatus());

        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(purchaseRequisitionService.getScrollData(
                PurchaseOrder.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        orderVO.setPageView(pageView);
        view = "/purchasing/page/order/findAllOrders.jsp";
        return VIEW;
    }

    public String arrivalUpdate() {

        String[] ids = orderVO.getId().split(",");
        String[] ams = orderVO.getAmount().split(",");
        for (int i = 0; i < ids.length; i++) {
            PurchaseOrder order = orderService.find(PurchaseOrder.class,
                    Integer.valueOf(ids[i].trim()));

            if (order.getAmount() == order.getArrivalNum()) {
                continue;
            }
            order.setArrivalNum(Float.valueOf(ams[i].trim())
                    + order.getArrivalNum());
            if (order.getAmount() == order.getArrivalNum()) {
                order.setStatus(OrderStatus.DONE);
            }
            orderService.update(order);
            logger.info(user.getPosition().getPositionName() + ":"
                    + user.getUserName() + "采购单到货情况（" + order.getId() + ") IP:"
                    + ip);
        }

        orderVO.setResultMessage("<script>alert('录入信息成功！');location.href='Order!arrival.action';</script>");
        return SUCCESS;
    }

    public String search() {
        if (UserUtil.checkUserLogIn(user)) {
            orderVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<PurchaseOrder> pageView = new PageView<PurchaseOrder>(
                maxResult, orderVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("orderDate", "DESC");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");
        if (!orderVO.getOrderDate().isEmpty())
            jpql.append(" and orderDate<='" + orderVO.getOrderDate() + "'");
        if (!orderVO.getOrderId().isEmpty())
            jpql.append(" and orderId like '%" + orderVO.getOrderId() + "%'");
        if(!orderVO.getSupplier().isEmpty())
            jpql.append(" and supplier like '%" + orderVO.getSupplier() + "%'");
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(purchaseRequisitionService.getScrollData(
                PurchaseOrder.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        if (!orderVO.getSupplier().isEmpty())
            pageView = duplicate(pageView, orderVO.getSupplier());
        orderVO.setPageView(pageView);
        switch (orderVO.getFlag()) {
            case 4:
                view = "/page/order/findAllOrders.jsp";
                break;
            case 5:
                view = "/page/order/findAll.jsp";
                break;
            case 6:
                view = "/page/order/findAllOrder.jsp";
                break;
        }
        return VIEW;
    }

    private PageView<PurchaseOrder> duplicate(PageView<PurchaseOrder> pageView,
                                              String supplierId) {
        List<PurchaseOrder> purchaseOrders = new ArrayList<PurchaseOrder>();
        for (PurchaseOrder purchaseOrder : (List<PurchaseOrder>) pageView
                .getRecords()) {
            if (Integer.valueOf(supplierId) != purchaseOrder.getPm()
                    .getSupplier().getSupplierId())
                purchaseOrders.add(purchaseOrder);
        }
        for (PurchaseOrder order : purchaseOrders)
            pageView.getRecords().remove(order);
        return pageView;
    }

    //TODO:未完善
    public String searchByDate() {
        if (UserUtil.checkUserLogIn(user)) {
            orderVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        System.out.println("测试~！");
        List<PurchaseOrder> orders = new ArrayList<PurchaseOrder>();
        if (!"".equals(orderVO.getSupplier())) {
            Supplier supplier = supplierService.findSupplierByName(orderVO
                    .getSupplier());
            Date begin = ChangeTime.parseStringToShortDate(orderVO.getBegin());
            Date end = ChangeTime.parseStringToShortDate(orderVO.getEnd());
            orders = orderService.findOrdersBySupplier(
                    supplier, begin, end);
        } else if (!"".equals(orderVO.getMaterial())) {
            System.out.println("test");
        } else if ("".equals(orderVO.getBegin()) || "".equals(orderVO.getEnd())) {
            orders = null;
        }

        orderVO.setOrders(orders);
        double total = 0.0d;
        if (orders != null)
            for (PurchaseOrder order : orders)
                total += order.getTotalPay();
        orderVO.setTotal(total);
        view = "/page/supplier/statistics.jsp";
        return VIEW;
    }


    @Override
    public OrderVO getModel() {
        return orderVO;
    }

    @Resource(name = "orderServiceImpl")
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Resource(name = "purchaseRequisitionServiceImpl")
    public void setPurchaseRequisitionService(
            PurchaseRequisitionService purchaseRequisitionService) {
        this.purchaseRequisitionService = purchaseRequisitionService;
    }

    @Resource(name = "purchaseMaterialServiceImpl")
    public void setPurchaseMaterialService(
            PurchaseMaterialService purchaseMaterialService) {
        this.purchaseMaterialService = purchaseMaterialService;
    }

    @Resource(name = "supplierServiceImpl")
    public void setSupplierService(SupplierService supplierService) {
        this.supplierService = supplierService;
    }

}
