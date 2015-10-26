package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.SupplierVO;
import com.sdgas.base.PageView;
import com.sdgas.model.Supplier;
import com.sdgas.model.User;
import com.sdgas.service.SupplierService;
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
 * Created by 120378 on 2014/7/25.
 */

@Component("supplier")
@Scope("prototype")
public class SupplierAction extends MyActionSupport implements
        ModelDriven<SupplierVO> {

    private final SupplierVO supplierVO = new SupplierVO();
    private Supplier supplier = new Supplier();
    private SupplierService supplierService;

    private static final Logger logger = LogManager
            .getLogger(SupplierAction.class);

    // 获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    // 查询所有供应商信息
    @Override
    public String execute() throws Exception {
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView pageView = new PageView<Supplier>(maxResult,
                supplierVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("supplierId", "asc");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(supplierService.getScrollData(Supplier.class,
                firstIndex, maxResult, jpql.toString(), params.toArray(),
                orderBy));
        supplierVO.setPageView(pageView);
        if (pageView.getRecords().isEmpty()) {
            supplierVO
                    .setResultMessage("<script>alert('当前还没有供应商信息！请到对应页面添加供应商信息');location.href='/purchasing/page/supplier/addSupplier.jsp';</script>");
            return ERROR;
        }

        view = "/page/supplier/findSupplier.jsp";
        return VIEW;
    }

    // 增加供应商信息
    public String addSupplier() {
        if (UserUtil.checkUserLogIn(user)) {
            supplierVO
                    .setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        if (supplierService.findSupplierByName(supplierVO.getSupplierName()) == null) {
            supplier.setAddress(supplierVO.getAddress());
            supplier.setContacts(supplierVO.getContacts());
            String evaluation = supplierVO.getEvaluation().equals("请输入对应的评价") ? ""
                    : supplierVO.getEvaluation();
            supplier.setEvaluation(evaluation);
            supplier.setPhone(supplierVO.getPhone());
            supplier.setSupplierName(supplierVO.getSupplierName());
            supplier.setFax(supplierVO.getFax());
            supplier.setEnableUse(true);
            try {
                supplierService.save(supplier);
                logger.info(user.getPosition().getPositionName() + ":"
                        + user.getUserName() + " 成功添加供应商（"
                        + supplier.getSupplierName() + "）操作IP：" + ip);
            } catch (Exception e) {
                logger.error(e);
                supplierVO
                        .setResultMessage("<script>alert('供应商信息保存失败！');location.href='/purchasing/page/supplier/addSupplier.jsp';</script>");
                return ERROR;
            }
            supplierVO
                    .setResultMessage("<script>alert('供应商信息保存成功！');location.href='/purchasing/page/supplier/addSupplier.jsp';</script>");
            return SUCCESS;
        } else {
            supplierVO
                    .setResultMessage("<script>alert('供应商已存在请勿重复增加！');location.href='/purchasing/page/supplier/addSupplier.jsp';</script>");
            return ERROR;
        }
    }

    // 查找供应商
    public String findSupplier() {

        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<Supplier> pageView = new PageView<Supplier>(maxResult,
                supplierVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("supplierId", "asc");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");
        jpql.append(" and (address LIKE '%" + supplierVO.getMessage() + "%'");
        jpql.append(" or contacts LIKE '%" + supplierVO.getMessage() + "%'");
        jpql.append(" or phone LIKE '%" + supplierVO.getMessage() + "%'");
        jpql.append(" or supplierName LIKE '%" + supplierVO.getMessage()
                + "%')");
        jpql.append(" or evaluation LIKE '%" + supplierVO.getMessage() + "%')");

        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(supplierService.getScrollData(Supplier.class,
                firstIndex, maxResult, jpql.toString(), params.toArray(),
                orderBy));
        supplierVO.setPageView(pageView);

        if (pageView.getRecords().isEmpty()) {
            supplierVO
                    .setResultMessage("<script>alert('尚未找到相关信息');location.href='Supplier.action';</script>");
            return ERROR;
        }
        view = "/page/supplier/findSupplier.jsp";
        return VIEW;
    }

    // 修改供应商信息
    public String alterSupplier() {
        if (UserUtil.checkUserLogIn(user)) {
            supplierVO
                    .setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }
        supplier = supplierService.findSupplierById(supplierVO.getSupplierId());
        supplier.setAddress(supplierVO.getAddress());
        supplier.setContacts(supplierVO.getContacts());
        supplier.setEvaluation(supplierVO.getEvaluation());
        supplier.setPhone(supplierVO.getPhone());
        supplier.setSupplierName(supplierVO.getSupplierName());
        supplier.setFax(supplierVO.getFax());
        supplier.setEnableUse(supplierVO.isEnableUse());
        try {
            supplierService.update(supplier);
            logger.info(user.getPosition().getPositionName() + ":"
                    + user.getUserName() + " 修改供应商信息（"
                    + supplier.getSupplierName() + "）操作IP：" + ip);
        } catch (Exception e) {
            logger.error(e);
            supplierVO
                    .setResultMessage("<script>alert('更新信息不成功，请核对资料后再次操作！');location.href='Supplier!findOneSupplier.action?supplierId="
                            + supplierVO.getSupplierId() + "';</script>");
            return ERROR;
        }
        supplierVO
                .setResultMessage("<script>alert('信息更新成功！');location.href='Supplier!findOneSupplier.action?flag=1&supplierId="
                        + supplierVO.getSupplierId() + "';</script>");
        return SUCCESS;
    }

    public String findOneSupplier() {
        supplier = supplierService.findSupplierById(supplierVO.getSupplierId());
        supplierVO.setSupplier(supplier);
        if (1 == supplierVO.getFlag())
            view = "/page/supplier/showOneSupplier.jsp";
        else
            view = "/page/supplier/alterSupplier.jsp";
        return VIEW;
    }

    @Override
    public SupplierVO getModel() {
        return supplierVO;
    }

    @Resource(name = "supplierServiceImpl")
    public void setSupplierService(SupplierService supplierService) {
        this.supplierService = supplierService;
    }
}
