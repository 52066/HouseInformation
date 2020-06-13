package com.cct.service.Impl;

import com.cct.beans.Houses;
import com.cct.dao.HousesDao;
import com.cct.service.HousesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HousesServiceImpl implements HousesService {

    @Resource
    private HousesDao housesDao;

    @Override
    public void insertHouse(Houses houses) throws Exception {
        housesDao.insertHouse(houses);
    }

    @Override
    public void deleteHouse(int id) throws Exception {
        housesDao.deleteHouse(id);
    }

    @Override
    public void updateHouse(Houses houses) throws Exception {
        housesDao.updateHouse(houses);
    }

    @Override
    public List<Houses> selectHouses(Integer page, Integer limit) throws Exception {
        int start = (page-1)*limit;
        return housesDao.selectHouses(start,limit);
    }

    @Override
    public int getCountHouses() throws Exception {
        return housesDao.getCountHouses();
    }

    @Override
    public List<Houses> selectByHouseProjec(Integer page, Integer limit,String content) throws Exception {
        int start = (page-1)*limit;
        return housesDao.selectByHouseProjec(start,limit,content);
    }

    @Override
    public List<Houses> selectByPossessor(Integer page, Integer limit,String content) throws Exception {
        int start = (page-1)*limit;
        return housesDao.selectByPossessor(start,limit,content);
    }

    @Override
    public List<Houses> selectByArea(Integer page, Integer limit,String content) throws Exception {
        int start = (page-1)*limit;
        return housesDao.selectByArea(start,limit,content);
    }

    @Override
    public int getCountByHouseProjec(String houseProjec) throws Exception {
        return housesDao.getCountByHouseProjec(houseProjec);
    }

    @Override
    public int getCountByPossessor(String possessor) throws Exception {
        return housesDao.getCountByPossessor(possessor);
    }

    @Override
    public int getCountByArea(String area) throws Exception {
        return housesDao.getCountByArea(area);
    }
}
