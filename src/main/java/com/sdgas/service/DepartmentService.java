package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.Department;

import java.util.List;

/**
 * Created by 120378 on 2014/5/13.
 */
public interface DepartmentService extends DAO {

    /**
     * 查询全部部门
     *
     * @return 全部部门
     */
    public List<Department> findAllDepartment();

    /**
     * 根据部门名称查找
     *
     * @param department 部门名称
     * @return 部门
     */
    public Department findDepartmentByName(String department);
}
