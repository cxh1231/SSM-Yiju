package com.yiju.dao;

import com.yiju.bean.Collect;
import com.yiju.bean.Image;
import com.yiju.bean.UserAuth;
import com.yiju.bean.UserInfo;

import java.util.List;

public interface IAdminDao {

    public List<UserInfo> findAllUsers(); //获取所有用户信息

    public int deleteUserById(int user_id); //根据用户ID删除用户

    public UserAuth getUserAuthById(int user_id); //根据用户id获取用户认证信息

    public int updateUser(UserInfo userInfo); //修改用户信息

    public List<Image> findAllImages(); //获取所有图片信息

    public List<Collect> findAllCollects(); //获取所有收藏信息

}
