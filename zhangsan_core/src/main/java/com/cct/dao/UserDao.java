package com.cct.dao;

import com.cct.beans.User;

public interface UserDao {
    User login(User user) throws Exception;

    int registe(User user) throws  Exception;

    User selectByUserIdentity(String userIdentity) throws Exception;

    User selectByName(String name) throws Exception;
}
