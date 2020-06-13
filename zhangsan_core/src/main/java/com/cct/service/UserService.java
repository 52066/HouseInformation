package com.cct.service;

import com.cct.beans.User;

public interface UserService {
    User login(User user) throws Exception;

    int registe(User user) throws  Exception;

    User selectByUserIdentity(String userIdentity) throws Exception;

    User selectByName(String name) throws Exception;
}
