package com.cct.service.Impl;

import com.cct.beans.User;
import com.cct.dao.UserDao;
import com.cct.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public User login(User user) throws Exception {
        return userDao.login(user);
    }

    @Override
    public int registe(User user) throws Exception {
        return userDao.registe(user);
    }

    @Override
    public User selectByUserIdentity(String userIdentity) throws Exception {
        return userDao.selectByUserIdentity(userIdentity);
    }

    @Override
    public User selectByName(String name) throws Exception {
        return userDao.selectByName(name);
    }
}
