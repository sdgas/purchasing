package com.sdgas.model;

import com.sdgas.util.ExcelResources;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 物料信息
 * Created by 120378 on 2014/7/14.
 */

@Entity
public class Material {

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

    @Id
    @Column(length = 20)
    @ExcelResources(title = "存货编码", order = 1)
    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    @Column(length = 50)
    @ExcelResources(title = "存货名称", order = 2)
    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    @Column(length = 50, nullable = false)
    @ExcelResources(title = "规格", order = 3)
    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    @Column(length = 50, nullable = false)
    @ExcelResources(title = "型号", order = 4)
    public String getMaterialType() {
        return materialType;
    }

    public void setMaterialType(String materialType) {
        this.materialType = materialType;
    }

    @Column(length = 10, nullable = false)
    @ExcelResources(title = "计量单位", order = 5)
    public String getMaterialUnit() {
        return materialUnit;
    }

    public void setMaterialUnit(String materialUnit) {
        this.materialUnit = materialUnit;
    }
}
