package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.Supplier;

import java.util.List;

/**
 * Created by 120378 on 2014/7/25.
 */

public interface SupplierService extends DAO {

    /**
     * 根据供应商编号查找
     *
     * @param supplierId 供应商编号
     * @return 供应商
     */
    public Supplier findSupplierById(int supplierId);

    /**
     * 查询全部供应商
     *
     * @return
     */
    public List<Supplier> findAllSupplier();

    /**
     * 根据供应商名称查找
     *
     * @param supplierName 供应商名称
     * @return 供应商
     */
    public Supplier findSupplierByName(String supplierName);

}
