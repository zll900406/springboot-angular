package com.zll.service;

import com.zll.mapper.UserMapper;
import com.zll.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description userService
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User getUserByName(String name){
        User user=userMapper.getUserByName(name);
        return user;
    }
    public User checkLogin(String name,String pwd){
    	 User user=userMapper.checkLogin(name,pwd);
         return user;
    }
    public int addUser(String name,String pwd,String tel){
    	User user=userMapper.getUserByName(name);
    	if(user==null){
    		 return userMapper.addUser(name,pwd,tel);
    	}
    	else{
    		return -1;//代表用户已经存在
    	}
   }
    
    public List<User> queryAllUser(){
    	return userMapper.queryAllUser();
    }
}
