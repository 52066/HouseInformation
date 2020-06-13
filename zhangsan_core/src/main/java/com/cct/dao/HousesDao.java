package com.cct.dao;

import com.cct.beans.Houses;
import com.cct.beans.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HousesDao {
    void insertHouse(Houses houses) throws Exception;
    void deleteHouse(int id) throws Exception;
    void updateHouse(Houses houses) throws Exception;
    List<Houses> selectHouses(@Param("start") Integer start,
                              @Param("limit") Integer limit)throws Exception;

    int getCountHouses() throws Exception;

    List<Houses> selectByHouseProjec(@Param("start") Integer start,
                                     @Param("limit") Integer limit,
                                     @Param("content") String content) throws Exception;

    List<Houses> selectByPossessor(@Param("start") Integer start,
                                   @Param("limit") Integer limit,
                                   @Param("content") String content) throws Exception;

    List<Houses> selectByArea(@Param("start") Integer start,
                              @Param("limit") Integer limit,
                              @Param("content") String content) throws Exception;

    int getCountByHouseProjec(String houseProjec) throws Exception;
    int getCountByPossessor(String possessor) throws Exception;
    int getCountByArea(String area) throws Exception;

}
