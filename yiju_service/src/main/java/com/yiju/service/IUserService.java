package com.yiju.service;

import com.yiju.bean.*;

import java.util.List;

public interface IUserService {
    void signup(UserInfo userInfo);

    boolean checkPhone(String phone);

    /**
     * 通过用户的手机号很密码进行登录
     * @param userInfo
     * @return
     */
    UserInfo loginByPassword(UserInfo userInfo);

    /**
     * 通过用户的ID和密码进行登录
     * @param userInfo
     * @return
     */
    UserInfo loginByIdPasswoed(UserInfo userInfo);

    UserInfo getUserInfoById(int user_id);
    void updateUserInfo(UserInfo userInfo);

    /**
     * 更新用户的密码
     * @param userInfo
     */
    void updateUserPsd(UserInfo userInfo);

    Collect getCollectByHouseId(int house_id);

    List<CollectView> getCollectByUserId(int user_id);

    void deleteCollect(int coll_id);

    void updateCollectAddColl(int coll_id);

    void postCollect(Collect collect);

    Collect getCollectByUserAndHouse(Collect collect);

//    List<Collect> getCollectByUserId(int user_id);

    UserAuth getUserAuthById(int user_id);

    void postUserAuth(UserAuth userAuth);

    void postNeed(Need need);

    List<Need> getNeed(int page,int size);
}
