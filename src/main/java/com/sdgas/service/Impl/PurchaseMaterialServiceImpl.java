package com.sdgas.service.Impl;

import com.sdgas.VO.PurchaseMaterialVO;
import com.sdgas.base.DaoSupport;
import com.sdgas.model.DemandPlans;
import com.sdgas.model.Material;
import com.sdgas.model.PurchaseMaterial;
import com.sdgas.model.PurchaseRequisition;
import com.sdgas.service.MaterialService;
import com.sdgas.service.PurchaseMaterialService;
import com.sdgas.util.ChangeTime;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 120378 on 2014/8/5.
 */
@Service
@Transactional
public class PurchaseMaterialServiceImpl extends DaoSupport<PurchaseMaterial> implements PurchaseMaterialService {

    private MaterialService materialService;
    private static String SAVE_PATH_DIR = "D:/purchasing/attachment/";
    private Logger logger = LogManager.getLogger(PurchaseMaterialServiceImpl.class);

    public List<PurchaseMaterial> findMaterialByPlan(DemandPlans demandPlans) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("plan", demandPlans);
        return this.findByFields(PurchaseMaterial.class, params);
    }

    @Override
    public List<PurchaseMaterial> findMaterialByPR(PurchaseRequisition pr) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("requisition", pr);
        return this.findByFields(PurchaseMaterial.class, params);
    }

    @Override
    public String uploadAttachment(PurchaseMaterialVO purchaseMaterialVO) {
        // 得到保存上传文件的目录的真实路径
        File dir = new File(SAVE_PATH_DIR);
        // 如果该目录不存在，就创建
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String name = ChangeTime.formatDate() + purchaseMaterialVO.getFileName();
        try {
            FileInputStream is = new FileInputStream(purchaseMaterialVO.getAttachment());
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
            return "";
        } catch (IOException ioe) {
            logger.error(ioe);
            return "";
        }
        return name;
    }

    @Override
    public PurchaseMaterial findMaterial(DemandPlans demandPlans, String materialId) {
        Material material = materialService.findByMaterialId(materialId);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("plan", demandPlans);
        params.put("material", material);
        return (PurchaseMaterial) this.findSpecialObject(PurchaseMaterial.class, params);
    }

    @Resource(name = "materialServiceImpl")
    public void setMaterialService(MaterialService materialService) {
        this.materialService = materialService;
    }
}
