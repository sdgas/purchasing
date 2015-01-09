package com.sdgas.service;

import com.sdgas.base.DAO;
import com.sdgas.model.Position;

/**
 * Created by 120378 on 2014/5/13.
 */
public interface PositionService extends DAO {

    /**
     *  根据职位名称查找职位
     * @param position 职位名称
     * @return 职位
     */
    public Position findPositionByName(String position);
}
