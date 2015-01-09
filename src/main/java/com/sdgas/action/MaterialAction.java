package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.MaterialVO;
import com.sdgas.base.PageView;
import com.sdgas.model.Material;
import com.sdgas.model.User;
import com.sdgas.service.MaterialService;
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
@Component("material")
@Scope("prototype")
public class MaterialAction extends MyActionSupport implements ModelDriven<MaterialVO> {

    private MaterialVO materialVO = new MaterialVO();
    private MaterialService materialService;
    private static final Logger logger = LogManager.getLogger(MaterialAction.class);
    //获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    public String addMaterial() {
        if (UserUtil.checkUserLogIn(user)) {
            materialVO.setResultMessage("<script>alert('请登录！');location.href='login.jsp';</script>");
            return ERROR;
        }

        Material material = new Material();
        material.setMaterialId(materialVO.getMaterialId());
        material.setMaterialName(materialVO.getMaterialName());
        material.setMaterialType(materialVO.getMaterialType());
        material.setMaterialUnit(materialVO.getMaterialUnit());
        material.setStandard(materialVO.getStandard());
        materialService.save(material);
        logger.info(user.getUserName() + ",新增物料(" + material.getMaterialName() + ") IP:" + ip);
        materialVO.setResultMessage("<script>alert('添加物料信息成功！');location.href='/page/material/addMaterial.jsp';</script>");
        return SUCCESS;
    }


    public String findMaterial() {

        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView<Material> pageView = new PageView<Material>(maxResult,
                materialVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("materialId", "asc");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("");
        jpql.append("materialId LIKE '%" + materialVO.getMessage() + "%'");
        jpql.append(" or materialName LIKE '%" + materialVO.getMessage() + "%'");
        jpql.append(" or materialType LIKE '%" + materialVO.getMessage() + "%'");
        jpql.append(" or standard LIKE '%" + materialVO.getMessage() + "%'");
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(materialService.getScrollData(Material.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        materialVO.setPageView(pageView);

        if (pageView.getRecords().isEmpty()) {
            materialVO.setResultMessage("<script>alert('尚未找到相关信息');location.href='Material.action';</script>");
            return ERROR;
        }
        view = "/page/material/findMaterial.jsp";
        return VIEW;
    }

    public String findOne() {
        Material material = materialService.findByMaterialId(materialVO.getMaterialId());
        materialVO.setMaterial(material);
        view = "/page/material/showOneMaterial.jsp";
        return VIEW;
    }

    public String alter() {
        Material material = materialService.findByMaterialId(materialVO.getMaterialId());
        material.setMaterialName(materialVO.getMaterialName());
        material.setMaterialType(materialVO.getMaterialType());
        material.setMaterialUnit(materialVO.getMaterialUnit());
        material.setStandard(materialVO.getStandard());
        materialService.update(material);
        materialVO.setResultMessage("<script>alert('修改物料信息成功！');location.href='Material.action';</script>");
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        /** 每页显示的结果数 **/
        int maxResult = 10;
        /** 封装的页面数据 **/
        PageView pageView = new PageView<Material>(maxResult,
                materialVO.getPage());
        int firstIndex = ((pageView.getCurrentPage() - 1) * pageView
                .getMaxResult());// 开始索引

        // 按照条件排序
        LinkedHashMap<String, String> orderBy = new LinkedHashMap<String, String>();
        orderBy.put("materialId", "asc");
        /** 列表条件 **/
        StringBuffer jpql = new StringBuffer("1=1");
        /** 列表条件的值 **/
        List<Object> params = new ArrayList<Object>();
        pageView.setQueryResult(materialService.getScrollData(Material.class, firstIndex, maxResult, jpql.toString(),
                params.toArray(), orderBy));
        materialVO.setPageView(pageView);
        if (pageView.getRecords().isEmpty()) {
            materialVO.setResultMessage("<script>alert('当前还没有相应的物料信息！请到对应页面添加');location.href='/page/material/addMaterial.jsp';</script>");
            return ERROR;
        }

        view = "/page/material/findMaterial.jsp";
        return VIEW;
    }

    @Override
    public MaterialVO getModel() {
        return materialVO;
    }

    @Resource(name = "materialServiceImpl")
    public void setMaterialService(MaterialService materialService) {
        this.materialService = materialService;
    }
}
