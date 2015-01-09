package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.Material;

import java.util.List;

/**
 * Created by 斌 on 2014/8/16.
 */
public interface MaterialService extends DAO {

    /**
     * 根据材料编号查询
     *
     * @param materialId 材料编号
     * @return 材料
     */
    public Material findByMaterialId(String materialId);

    /**
     * 查找全部材料
     *
     * @return 全部材料
     */
    public List<Material> findAll();
}
