package com.sdgas.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sdgas.VO.PurchaseMaterialVO;
import com.sdgas.model.DemandPlans;
import com.sdgas.model.PurchaseRequisition;
import com.sdgas.service.DemandPlansService;
import com.sdgas.service.PurchaseRequisitionService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-8-22
 * Time: 下午9:48
 * To change this template use File | Settings | File Templates.
 */

//文件下载
@Component("FileDownload")
@Scope("prototype")
public class FileDownloadAction extends ActionSupport implements ModelDriven<PurchaseMaterialVO> {

    private final PurchaseMaterialVO purchaseMaterialVO = new PurchaseMaterialVO();
    private Logger logger = LogManager.getLogger(FileDownloadAction.class);
    private static String SAVE_PATH_DIR = "D:/purchasing/attachment/";
    private DemandPlansService demandPlansService;
    private PurchaseRequisitionService purchaseRequisitionService;

    //返回一个输入流，作为一个客户端来说是一个输入流，但对于服务器端是一个 输出流
    public InputStream getDownloadFile() throws Exception {
        String fileName;
        File file;
        if (purchaseMaterialVO.getPrId().isEmpty()) {
            DemandPlans demandPlans = demandPlansService.find(DemandPlans.class, purchaseMaterialVO.getDpId());
            purchaseMaterialVO.setFileName(demandPlans.getAttachment());
            fileName = SAVE_PATH_DIR + demandPlans.getAttachment();
            file = new File(fileName);
        } else {
            PurchaseRequisition pr = purchaseRequisitionService.findPRByPrId(purchaseMaterialVO.getPrId());
            purchaseMaterialVO.setFileName(pr.getAttachment());
            fileName = SAVE_PATH_DIR + pr.getAttachment();
            file = new File(fileName);
        }
        return new FileInputStream(file);
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    @Override
    public PurchaseMaterialVO getModel() {
        return purchaseMaterialVO;
    }

    @Resource(name = "demandPlansServiceImpl")
    public void setDemandPlansService(DemandPlansService demandPlansService) {
        this.demandPlansService = demandPlansService;
    }

    @Resource(name = "purchaseRequisitionServiceImpl")
    public void setPurchaseRequisitionService(PurchaseRequisitionService purchaseRequisitionService) {
        this.purchaseRequisitionService = purchaseRequisitionService;
    }
}