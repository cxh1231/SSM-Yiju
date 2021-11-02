package com.yiju.bean;

/**
 * 用户认证实体类
 */
public class UserAuth {

    private int auth_id; //认证id
    private int user_id; //用户id
    private String user_name; //用户姓名
    private int user_gender; //性别
    private String user_card; //身份证号码
    private String user_card_address; //身份证住址
    private String user_live_address; //住址
    private String user_carding; //证件照
    private String user_propertyimg; //房产证照片
    private int auth_status;//认证状态
    private int is_delete; //是否已删除 0-未删除 1-已删除
    private long create_time; //创建时间
    private long update_time; //更新时间

    public int getAuth_status() {
        return auth_status;
    }

    public void setAuth_status(int auth_status) {
        this.auth_status = auth_status;
    }

    public UserAuth(int user_id, String user_name, int user_gender, String user_card, String user_card_address, String user_live_address, long create_time, long update_time) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_gender = user_gender;
        this.user_card = user_card;
        this.user_card_address = user_card_address;
        this.user_live_address = user_live_address;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "UserAuth{" +
                "auth_id=" + auth_id +
                ", user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", user_gender=" + user_gender +
                ", user_card='" + user_card + '\'' +
                ", user_card_address='" + user_card_address + '\'' +
                ", user_live_address='" + user_live_address + '\'' +
                ", user_carding='" + user_carding + '\'' +
                ", user_propertyimg='" + user_propertyimg + '\'' +
                ", auth_status=" + auth_status +
                ", is_delete=" + is_delete +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }

    public int getAuth_id() {
        return auth_id;
    }

    public void setAuth_id(int auth_id) {
        this.auth_id = auth_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(int user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_card() {
        return user_card;
    }

    public void setUser_card(String user_card) {
        this.user_card = user_card;
    }

    public String getUser_card_address() {
        return user_card_address;
    }

    public void setUser_card_address(String user_card_address) {
        this.user_card_address = user_card_address;
    }

    public String getUser_live_address() {
        return user_live_address;
    }

    public void setUser_live_address(String user_live_address) {
        this.user_live_address = user_live_address;
    }

    public String getUser_carding() {
        return user_carding;
    }

    public void setUser_carding(String user_carding) {
        this.user_carding = user_carding;
    }

    public String getUser_propertyimg() {
        return user_propertyimg;
    }

    public void setUser_propertyimg(String user_propertyimg) {
        this.user_propertyimg = user_propertyimg;
    }

    public int getIs_delete() {
        return is_delete;
    }

    public void setIs_delete(int is_delete) {
        this.is_delete = is_delete;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

    public UserAuth() {
    }


}
