package com.sdgas.action;

import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.FileVO;
import com.sdgas.model.Material;
import com.sdgas.model.Supplier;
import com.sdgas.model.User;
import com.sdgas.service.MaterialService;
import com.sdgas.service.SupplierService;
import com.sdgas.util.ChangeTime;
import com.sdgas.util.ExcelUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Component("file")
@Scope("prototype")
public class FileAction extends MyActionSupport implements ModelDriven<FileVO> {

    @Qualifier("excelUtil")
    @Autowired
    private ExcelUtil excelUtil;
    private MaterialService materialService;
    private SupplierService supplierService;
    private final static Logger logger = LogManager.getLogger(FileAction.class);
    private final FileVO fileVO = new FileVO();
    private List<Object> obj = new ArrayList<Object>();
    private List<Material> materials = new ArrayList<Material>();
    private List<Supplier> suppliers = new ArrayList<Supplier>();
    private int count = 0;
    private static String SAVE_PATH_DIR_M = "D:/purchasing/uploadFile/material/";
    private static String SAVE_PATH_DIR_S = "D:/purchasing/uploadFile/supplier/";

    //获取当前登录用户
    HttpSession session = ServletActionContext.getRequest().getSession();
    User user = (User) session.getAttribute("person");
    String ip = (String) session.getAttribute("ip");

    //导入物料信息
    public String recoverExcelByMaterial() {
        count = 0;
        String name = uploadAttachment(fileVO.getUploadFile(), fileVO.getFileName(), SAVE_PATH_DIR_M);
        try {
            obj = excelUtil.readExcelByPath(SAVE_PATH_DIR_M + name, Material.class, 0, 0);
            for (Object anObj : obj) {
                materials.add((Material) anObj);
            }
            for (Material m : materials) {
                Material material = new Material();
                if (materialService.findByMaterialId(m.getMaterialId()) == null) {
                    material.setMaterialId(m.getMaterialId());
                    material.setMaterialName(m.getMaterialName());
                    material.setMaterialType(m.getMaterialType());
                    material.setMaterialUnit(m.getMaterialUnit());
                    material.setStandard(m.getStandard());
                    materialService.save(material);
                    logger.info(user.getUserName() + ",导入物料(" + material.getMaterialName() + ") IP:" + ip);
                    ++count;
                }
            }
        } catch (RuntimeException e) {
            if (e.getMessage().contains("格式"))
                fileVO.setResultMessage("要读取的Excel的格式不正确，请查检测格式！");
            logger.error(e);
            return ERROR;
        }
        fileVO.setResultMessage("成功导入物料信息" + count + "条记录。");
        return SUCCESS;
    }

    //导入供应商信息
    public String recoverExcelBySupplier() {
        count = 0;
        String name = uploadAttachment(fileVO.getUploadFile(), fileVO.getFileName(), SAVE_PATH_DIR_S);
        try {
            obj = excelUtil.readExcelByPath(SAVE_PATH_DIR_S + name, Supplier.class, 0, 0);
            for (Object anObj : obj) {
                suppliers.add((Supplier) anObj);
            }
            for (Supplier s : suppliers) {
                Supplier supplier = new Supplier();
                if (supplierService.findSupplierByName(s.getSupplierName()) == null) {
                    supplier.setSupplierName(s.getSupplierName());
                    supplier.setAddress(s.getAddress());
                    supplier.setContacts(s.getContacts());
                    supplier.setEnableUse(true);
                    supplier.setEvaluation(s.getEvaluation());
                    supplier.setPhone(s.getPhone());
                    supplier.setFax(s.getFax());
                    supplierService.save(supplier);
                    logger.info(user.getUserName() + ",导入供应商(" + supplier.getSupplierName() + ") IP:" + ip);
                    ++count;
                }
            }
        } catch (RuntimeException e) {
            if (e.getMessage().contains("格式"))
                fileVO.setResultMessage("要读取的Excel的格式不正确，请查检测格式！");
            else
                fileVO.setResultMessage("Excel未上传成功！");
            logger.error(e);
            return ERROR;
        }
        fileVO.setResultMessage("成功导入供应商信息" + count + "条记录。");
        return SUCCESS;
    }

    @Resource(name = "materialServiceImpl")
    public void setMaterialService(MaterialService materialService) {
        this.materialService = materialService;
    }

    @Resource(name = "supplierServiceImpl")
    public void setSupplierService(SupplierService supplierService) {
        this.supplierService = supplierService;
    }

    @Override
    public FileVO getModel() {
        return fileVO;
    }

    public String uploadAttachment(File file, String fileName, String path) {
        // 得到保存上传文件的目录的真实路径
        File dir = new File(path);
        // 如果该目录不存在，就创建
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String[] temp = fileName.split("\\\\");
        fileName = temp[temp.length - 1];
        String name = ChangeTime.formatDate() + fileName;
        try {
            FileInputStream is = new FileInputStream(file);
            FileOutputStream os = new FileOutputStream(new File(dir, name));
            byte[] buf = new byte[1024];
            int len = -1;
            while ((len = is.read(buf)) != -1) {
                os.write(buf, 0, len);
            }

            is.close();
            os.close();
        } catch (FileNotFoundException f) {
            logger.error(f);
        } catch (IOException ioe) {
            logger.error(ioe);
        }
        return name;
    }

}
