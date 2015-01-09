package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.Supplier;
import com.sdgas.service.SupplierService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 120378 on 2014/7/25.
 */

@Service
@Transactional
public class SupplierServiceImpl extends DaoSupport<Supplier> implements SupplierService {
    @Override
    public Supplier findSupplierById(int supplierId) {
        return this.find(Supplier.class, supplierId);
    }

    @Override
    public List<Supplier> findAllSupplier() {
        return this.find(Supplier.class);
    }

    @Override
    public Supplier findSupplierByName(String supplierName) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("supplierName", supplierName);
        return (Supplier) this.findSpecialObject(Supplier.class, params);
    }
}
