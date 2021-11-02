package com.yiju.bean;

import java.math.BigDecimal;

/**
 * 房屋表
 */
public class House {

    private int house_id; //房源表唯一标识ID
    private int user_id; //发布此房源的用户ID
    private int house_type; //房源类型 0:新房 1:旧房 2:租房
    private String house_title; //房源帖子标题
    private String house_headimg; //房源帖子头像
    private String house_planimg1; //房屋户型平面图1 外键
    private String house_planimg2; //房屋户型平面图2 外键
    private String house_img1; //房源室内图1
    private String house_img2; //房源室内图2
    private String house_img3; //房源室内图3
    private String house_img4; //房源室内图4
    private String house_img5; //房源室内图5
    private String house_img6; //房源室内图6
    private BigDecimal house_price; //房源预计售价
    private String price_unit; //售价单位 元/每月 元/每套 元/每年
    private String house_address; //房源地址
    private int is_delete; //0:未删除 1:已删除
    private long create_time; //创建时间
    private long update_time; //更新时间

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getHouse_type() {
        return house_type;
    }

    public void setHouse_type(int house_type) {
        this.house_type = house_type;
    }

    public String getHouse_title() {
        return house_title;
    }

    public void setHouse_title(String house_title) {
        this.house_title = house_title;
    }

    public String getHouse_headimg() {
        return house_headimg;
    }

    public void setHouse_headimg(String house_headimg) {
        this.house_headimg = house_headimg;
    }

    public String getHouse_planimg1() {
        return house_planimg1;
    }

    public void setHouse_planimg1(String house_planimg1) {
        this.house_planimg1 = house_planimg1;
    }

    public String getHouse_planimg2() {
        return house_planimg2;
    }

    public void setHouse_planimg2(String house_planimg2) {
        this.house_planimg2 = house_planimg2;
    }

    public String getHouse_img1() {
        return house_img1;
    }

    public void setHouse_img1(String house_img1) {
        this.house_img1 = house_img1;
    }

    public String getHouse_img2() {
        return house_img2;
    }

    public void setHouse_img2(String house_img2) {
        this.house_img2 = house_img2;
    }

    public String getHouse_img3() {
        return house_img3;
    }

    public void setHouse_img3(String house_img3) {
        this.house_img3 = house_img3;
    }

    public String getHouse_img4() {
        return house_img4;
    }

    public void setHouse_img4(String house_img4) {
        this.house_img4 = house_img4;
    }

    public String getHouse_img5() {
        return house_img5;
    }

    public void setHouse_img5(String house_img5) {
        this.house_img5 = house_img5;
    }

    public String getHouse_img6() {
        return house_img6;
    }

    public void setHouse_img6(String house_img6) {
        this.house_img6 = house_img6;
    }

    public BigDecimal getHouse_price() {
        return house_price;
    }

    public void setHouse_price(BigDecimal house_price) {
        this.house_price = house_price;
    }

    public String getPrice_unit() {
        return price_unit;
    }

    public void setPrice_unit(String price_unit) {
        this.price_unit = price_unit;
    }

    public String getHouse_address() {
        return house_address;
    }

    public void setHouse_address(String house_address) {
        this.house_address = house_address;
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

    @Override
    public String toString() {
        return "House{" +
                "house_id=" + house_id +
                ", user_id=" + user_id +
                ", house_type=" + house_type +
                ", house_title='" + house_title + '\'' +
                ", house_headimg='" + house_headimg + '\'' +
                ", house_planimg1='" + house_planimg1 + '\'' +
                ", house_planimg2='" + house_planimg2 + '\'' +
                ", house_img1='" + house_img1 + '\'' +
                ", house_img2='" + house_img2 + '\'' +
                ", house_img3='" + house_img3 + '\'' +
                ", house_img4='" + house_img4 + '\'' +
                ", house_img5='" + house_img5 + '\'' +
                ", house_img6='" + house_img6 + '\'' +
                ", house_price=" + house_price +
                ", price_unit='" + price_unit + '\'' +
                ", house_address='" + house_address + '\'' +
                ", is_delete=" + is_delete +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }
    
}
