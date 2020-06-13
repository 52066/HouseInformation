package com.cct.service;

import com.cct.beans.Houses;

import java.util.List;

public interface HousesService {
    void insertHouse(Houses houses) throws Exception;
    void deleteHouse(int id) throws Exception;
    void updateHouse(Houses houses) throws Exception;
    List<Houses> selectHouses(Integer start, Integer limit)throws Exception;
    int getCountHouses() throws Exception;

    List<Houses> selectByHouseProjec(Integer page, Integer limit ,String content) throws Exception;
    List<Houses> selectByPossessor(Integer page, Integer limit,String content) throws Exception;

    List<Houses> selectByArea(Integer page, Integer limit,String content) throws Exception;

    int getCountByHouseProjec(String houseProjec) throws Exception;
    int getCountByPossessor(String possessor) throws Exception;
    int getCountByArea(String area) throws Exception;

}
