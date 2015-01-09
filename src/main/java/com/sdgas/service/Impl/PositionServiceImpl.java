package com.sdgas.service.Impl;

import com.sdgas.base.DaoSupport;
import com.sdgas.model.Position;
import com.sdgas.service.PositionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by 120378 on 2014/5/13.
 */
@Service
@Transactional
public class PositionServiceImpl extends DaoSupport<Position> implements PositionService {


    @Override
    public Position findPositionByName(String position) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("positionName",position);
        return (Position) this.findSpecialObject(Position.class,params);
    }
}
