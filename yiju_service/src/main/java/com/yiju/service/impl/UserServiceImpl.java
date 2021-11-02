package com.yiju.service.impl;

import com.github.pagehelper.PageHelper;
import com.yiju.bean.*;
import com.yiju.dao.IUserDao;
import com.yiju.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    IUserDao userDao;


    @Override
    public void signup(UserInfo userInfo) {
        userDao.signup(userInfo);
    }

    @Override
    public boolean checkPhone(String phone) {
        UserInfo userInfo = null;
        userInfo = userDao.checkPhone(phone);
        if(userInfo!=null){
            return false;
        }
        return true;
    }

    @Override
    public UserInfo loginByPassword(UserInfo userInfo) {
        System.out.println(userInfo);
        return userDao.loginByPassword(userInfo);
    }

    @Override
    public UserInfo loginByIdPasswoed(UserInfo userInfo) {
        return userDao.loginByIdPassword(userInfo);
    }

    @Override
    public UserInfo getUserInfoById(int user_id) {
        return userDao.getUserInfoById(user_id);
    }

    @Override
    public void updateUserInfo(UserInfo userInfo) {
        userDao.updateUserInfo(userInfo);
    }

    @Override
    public void updateUserPsd(UserInfo userInfo) {
        userDao.updateUserPsd(userInfo);
    }

    @Override
    public Collect getCollectByHouseId(int house_id) {
        return userDao.getCollectByHouseId(house_id);
    }

    @Override
    public List<CollectView> getCollectByUserId(int user_id) {
        return userDao.getAllCollectByUser(user_id);
    }

    @Override
    public void deleteCollect(int coll_id) {
        userDao.deleteCollectByCollId(coll_id);
    }

    @Override
    public void updateCollectAddColl(int coll_id) {
        userDao.updateCollectAddColl(coll_id);
    }

    @Override
    public void postCollect(Collect collect) {
        userDao.postCollect(collect);
    }

    @Override
    public Collect getCollectByUserAndHouse(Collect collect) {
        return userDao.getCollectByUserAndHouse(collect);
    }

    @Override
    public UserAuth getUserAuthById(int user_id) {
        return userDao.getUserAuthById(user_id);
    }

    @Override
    public void postUserAuth(UserAuth userAuth) {
        userDao.postUserAuth(userAuth);
    }

    @Override
    public void postNeed(Need need) {
        userDao.postNeed(need);
    }

    @Override
    public List<Need> getNeed(int page, int size) {
        PageHelper.startPage(page,size);
        return userDao.getNeed();
    }

}
