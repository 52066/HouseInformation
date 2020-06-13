package com.cct.controller;


import com.cct.beans.Houses;
import com.cct.service.HousesService;
import com.cct.util.Vo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("houses")
public class HousesController {
    @Resource
    private HousesService housesService;

    @ResponseBody
    @RequestMapping("/houseList.do")
    public Map<String,Object> houseList(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            int count = housesService.getCountHouses();
            List<Houses> houses = housesService.selectHouses(page, limit);
            System.err.println(houses);
            map.put("code", 0);
            map.put("msg", "房源信息列表");
            map.put("count", count);
            map.put("data", houses);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code", 1);
            return map;
        }
    }

    @ResponseBody
    @RequestMapping("/insertHouses.do")
    public Vo insertHouses(Houses houses) {
        try {
            housesService.insertHouse(houses);
            return new Vo(1,"添加成功,返回主页面");
        } catch (Exception e) {
            e.printStackTrace();
            return new Vo(0,"添加失败");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteHouse.do")
    public Vo deleteHouse(Integer houseId){
        try {
            housesService.deleteHouse(houseId);
            return new Vo(1,"删除成功,返回主页面");
        } catch (Exception e) {
            e.printStackTrace();
            return new Vo(0,"删除失败");
        }
    }

    @ResponseBody
    @RequestMapping("updateHouse.do")
    public Vo updateHouse(Houses houses){
        System.err.println(houses);
        try {
            housesService.updateHouse(houses);
            return new Vo(1,"修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Vo(0,"修改失败");
        }
    }

    @ResponseBody
    @RequestMapping("/selectByConter.do")
    public Map<String,Object> selectBy(int distinction,String content,Integer page, Integer limit){
        System.err.println(distinction);
        Map<String, Object> map = new HashMap<String, Object>();
        if (0==distinction){
            try {
                int count = housesService.getCountByHouseProjec(content);
                List<Houses> houses = housesService.selectByHouseProjec(page,limit,content);
                map.put("code", 0);
                map.put("msg", "房源信息列表");
                map.put("count", count);
                map.put("data", houses);
                return map;
            } catch (Exception e) {
                e.printStackTrace();
                map.put("code", 1);
                map.put("msg", "查询失败");
                return map;

            }
        }else if (1==distinction){
            try {
                int count = housesService.getCountByPossessor(content);
                List<Houses> houses = housesService.selectByPossessor(page,limit,content);
                map.put("code", 0);
                map.put("msg", "房源信息列表");
                map.put("count", count);
                map.put("data", houses);
                return map;

            } catch (Exception e) {
                e.printStackTrace();
                map.put("code", 1);
                map.put("msg", "查询失败");
                return map;

            }
        } else if (2==distinction){
            try {
                int count= housesService.getCountByArea(content);
                List<Houses> houses = housesService.selectByArea(page,limit,content);
                map.put("code", 0);
                map.put("msg", "房源信息列表");
                map.put("count", count);
                map.put("data", houses);
                return map;

            } catch (Exception e) {
                e.printStackTrace();
                map.put("code", 1);
                map.put("msg", "查询失败");
                return map;
            }
        }else {
            try {
                int count = housesService.getCountHouses();
                List<Houses> houses = housesService.selectHouses(page, limit);
                System.err.println(houses);
                map.put("code", 0);
                map.put("msg", "房源信息列表");
                map.put("count", count);
                map.put("data", houses);
                return map;
            } catch (Exception e) {
                e.printStackTrace();
                map.put("code", 1);
                return map;
            }
        }
    }

}
