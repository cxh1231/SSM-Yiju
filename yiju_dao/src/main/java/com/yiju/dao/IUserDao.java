package com.yiju.dao;

import com.yiju.bean.*;

import java.util.List;

public interface IUserDao {
    /**
     * 用户注册信息写入
     * @param userInfo：用户信息类
     */
    void signup(UserInfo userInfo);

    /**
     * 根据电话号码查询用户是否存在，防止重复注册
     * @param phone 电话号码
     * @return 用户集合或NULL
     */
    UserInfo checkPhone(String phone);

    /**
     * 通过用户的手机号和密码进行登录
     * @param userInfo 用户输入的信息类
     * @return 通过查询用户名和密码匹配的用户
     */
    UserInfo loginByPassword(UserInfo userInfo);

    /**
     * 通过用户的ID和密码进行登录
     * @param userInfo
     * @return
     */
    UserInfo loginByIdPassword(UserInfo userInfo);

    /**
     * 通过用户的ID获取对应用户的信息
     * @param user_id 用户ID
     * @return 信息集合类
     */
    UserInfo getUserInfoById(int user_id);

    /**
     * 更新用户的基本信息
     * @param userInfo 用户信息集合
     */
    void updateUserInfo(UserInfo userInfo);

    /**
     * 更新用户的密码
     * @param userInfo 新的用户密码
     */
    void updateUserPsd(UserInfo userInfo);

    /**
     * 通过用户的ID获取用户的认证信息
     * @param user_id 用户的ID
     * @return 返回用户的认证信息集合类
     */
    UserAuth getUserAuthById(int user_id);

    /**
     * 提交认证信息
     * @param userAuth 用户的认证信息类
     */
    void postUserAuth(UserAuth userAuth);

    /**
     * 删除用户的认证信息
     * @param user_id 用户的ID
     */
    void deleteUserAuth(int user_id);

    /**
     * 修改用户的认证信息
     * @param userAuth 用户新的认证信息
     */
    void updateUserAuth(UserAuth userAuth);

    /**
     * 提交用户的收藏信息
     * @param collect 用户的收藏信息
     */
    void postCollect(Collect collect);

    /**
     * 删除指定房源的收藏信息
     * @param house_id 房源ID
     */
    void deleteCollect(int house_id);

    /**
     * 得到指定房源的收藏信息，以判断该房源是否已被收藏
     * @param house_id 房源的id
     * @return
     */
    Collect getCollectByHouseId(int house_id);

    /**
     * 获取指定用户的信息
     * @param collect
     * @return
     */
    Collect getCollectByUserAndHouse(Collect collect);

    List<CollectView> getAllCollectByUser(int user_id);

    void deleteCollectByCollId(int coll_id);

    void updateCollectAddColl(int coll_id);

//    UserAuth getUserAuthById(int user_id);


    void postNeed(Need need);

    List<Need> getNeed();
}
