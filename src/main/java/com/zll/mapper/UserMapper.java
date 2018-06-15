package com.zll.mapper;

import com.zll.model.User;

import java.util.List;

/**
 * @description userMapper
 */
public interface UserMapper {
	List<User> queryAllUser();
    User getUserByName(String name);
    User checkLogin(String name,String pwd);
    int addUser(String name,String pwd,String tel);
}
