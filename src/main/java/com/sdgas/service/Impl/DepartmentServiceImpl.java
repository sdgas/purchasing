package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.Department;
import com.sdgas.service.DepartmentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by 120378 on 2014/5/13.
 */
@Service
@Transactional
public class DepartmentServiceImpl extends DaoSupport<Department> implements DepartmentService {

    @Override
    public List<Department> findAllDepartment() {
        return this.find(Department.class);
    }

    @Override
    public Department findDepartmentByName(String department) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("departmentName",department);
        return (Department) this.findSpecialObject(Department.class,params);
    }


}
