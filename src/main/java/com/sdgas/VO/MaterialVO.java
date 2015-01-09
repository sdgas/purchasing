package com.sdgas.VO;

import com.sdgas.model.Material;

/**
 * Created by 斌 on 2014/8/31.
 */
public class MaterialVO extends BaseVO {

    /**
     * 物料编号
     */
    private String materialId;

    /**
     * 物料名称
     */
    private String materialName;

    /**
     * 规格
     */
    private String standard;

    /**
     * 型号
     */
    private String materialType;

    /**
     * 单位
     */
    private String materialUnit;
    private String message;
    private Material material;

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    public String getMaterialUnit() {
        return materialUnit;
    }

    public void setMaterialUnit(String materialUnit) {
        this.materialUnit = materialUnit;
    }
}
