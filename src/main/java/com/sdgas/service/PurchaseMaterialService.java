package com.sdgas.service;

import com.sdgas.VO.PurchaseMaterialVO;
import com.sdgas.base.DAO;
import com.sdgas.model.DemandPlans;
import com.sdgas.model.PurchaseMaterial;
import com.sdgas.model.PurchaseRequisition;

import java.util.List;

/**
 * Created by 120378 on 2014/8/5.
 */
public interface PurchaseMaterialService extends DAO {

    /**
     * 查找需求物料
     *
     * @param demandPlans 需求计划
     * @return 需求物料
     */
    public List<PurchaseMaterial> findMaterialByPlan(DemandPlans demandPlans);

    /**
     * 查找需求物料
     *
     * @param pr 请购计划
     * @return 需求物料
     */
    public List<PurchaseMaterial> findMaterialByPR(PurchaseRequisition pr);

    /**
     * 上传附件
     *
     * @param purchaseMaterialVO 页面信息
     * @return 文件名
     */
    public String uploadAttachment(PurchaseMaterialVO purchaseMaterialVO);

    /**
     * 查找需求物料
     *
     * @param demandPlans 需求计划
     * @param materialId  物料编号
     * @return 需求物料
     */
    public PurchaseMaterial findMaterial(DemandPlans demandPlans, String materialId);
}
