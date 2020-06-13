package com.cct;

import com.cct.beans.Houses;
import com.cct.beans.User;
import com.cct.dao.HousesDao;
import com.cct.dao.UserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-dao.xml")
public class UserDaoTest {
    @Resource
    private UserDao userDao;
    @Resource
    private HousesDao housesDao;

    @Test
    public void select(){
        User user = new User();
        user.setUserIdentity("123456");
        try {
            User login = userDao.login(user);
            System.err.println(login);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void update() throws Exception {
        Houses houses = new Houses(2, "郑州", "陈春涛", "1122", "2", "500", "2019/1/12");
        housesDao.updateHouse(houses);
    }

    @Test
    public void set1() throws Exception {
        List<Houses> a = housesDao.selectByHouseProjec(1,2,"郑州");
        System.err.println(a);
    }

    @Test
    public void resgist() throws Exception {
        User user = new User(1, "111", "444", "123456");
        int registe = userDao.registe(user);
        System.err.println(registe);
    }

    @Test
    public void se1() throws Exception {
        User cct = userDao.selectByName("cct");
        System.err.println(cct);
        User user = userDao.selectByUserIdentity("123456");
        System.err.println(user);
    }

    @Test
    public void se12() throws Exception {
        int i = housesDao.getCountByHouseProjec("郑州");
        System.err.println(i);

        int countByArea = housesDao.getCountByArea("50");
        System.err.println(countByArea);

        int c = housesDao.getCountByPossessor("陈春涛");
        System.err.println(c);
    }
}
