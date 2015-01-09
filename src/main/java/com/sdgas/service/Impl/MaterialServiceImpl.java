package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.Material;
import com.sdgas.service.MaterialService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 斌 on 2014/8/16.
 */
@Service
@Transactional
public class MaterialServiceImpl extends DaoSupport<Material> implements MaterialService {

    @Override
    public Material findByMaterialId(String materialId) {
        Material material = this.find(Material.class, materialId);
        return material;
    }

    @Override
    public List<Material> findAll() {
        return this.find(Material.class);
    }
}
