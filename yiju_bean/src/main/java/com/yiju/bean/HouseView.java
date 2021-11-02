package com.yiju.bean;

import java.math.BigDecimal;

public class HouseView {

    private int house_id; //房源ID
    private String truename; //发布人
    private String house_title; //房源标题
    private String house_headimg; //房源帖子头像
    private BigDecimal house_price; //房屋价格
    private String price_unit; //售价单位:元/每月 元/套 元/年
    private int house_floor; //楼层
    private int floor_all; //全部楼层
    private String house_address; //房源地址
    private String house_layout; //几室几厅几卫
    private String house_decorate; //精装,简装
    private String house_area; //房间面积
    private long create_time; //创建时间
    private String house_turn; //房屋朝向
    private String house_nature; //房屋性质
    private String house_model; //房屋类型
    private String house_year; //建造年份
    private String house_valid; //有效期
    private int house_lift; //是否有电梯
    private String house_planimg1;
    private String house_planimg2;
    private String house_img1; //房源室内图1
    private String house_img2; //房源室内图2
    private String house_img3; //房源室内图3
    private String house_img4; //房源室内图4
    private String house_img5; //房源室内图5
    private String house_img6; //房源室内图6
    private String date; //获取年月日
    private int bed; //床：0无 1有
    private int washing; //洗衣机：0无 1有
    private int air; //空调: 0无 1有
    private int balcony; //阳台：0无 1有
    private int ice; //冰箱：0无 1有
    private int toilet; //卫生间：0无 1有
    private int kitchen; //厨房：0无 1有
    private int tv; //电视：0无 1有
    private int heater; //热水器：0无 1有
    private int wardrobe; //衣柜：0无 1有
    private int heating; //暖气：0无 1有
    private int internet; //宽带：0无 1有
    private int sofa; //沙发：0无 1有

    public BigDecimal getHouse_price() {
        return house_price;
    }

    public void setHouse_price(BigDecimal house_price) {
        this.house_price = house_price;
    }

    public void setPrice_unit(String price_unit) {
        this.price_unit = price_unit;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
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

    public String getHouse_address() {
        return house_address;
    }

    public void setHouse_address(String house_address) {
        this.house_address = house_address;
    }

    public String getHouse_layout() {
        return house_layout;
    }

    public void setHouse_layout(String house_layout) {
        this.house_layout = house_layout;
    }

    public String getHouse_decorate() {
        return house_decorate;
    }

    public void setHouse_decorate(String house_decorate) {
        this.house_decorate = house_decorate;
    }

    public String getPrice_unit() {
        return price_unit;
    }

    public String getHouse_area() {
        return house_area;
    }

    public void setHouse_area(String house_area) {
        this.house_area = house_area;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public int getHouse_floor() {
        return house_floor;
    }

    public void setHouse_floor(int house_floor) {
        this.house_floor = house_floor;
    }

    public int getFloor_all() {
        return floor_all;
    }

    public void setFloor_all(int floor_all) {
        this.floor_all = floor_all;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public String getHouse_turn() {
        return house_turn;
    }

    public void setHouse_turn(String house_turn) {
        this.house_turn = house_turn;
    }

    public String getHouse_nature() {
        return house_nature;
    }

    public void setHouse_nature(String house_nature) {
        this.house_nature = house_nature;
    }

    public String getHouse_model() {
        return house_model;
    }

    public void setHouse_model(String house_model) {
        this.house_model = house_model;
    }

    public String getHouse_year() {
        return house_year;
    }

    public void setHouse_year(String house_year) {
        this.house_year = house_year;
    }

    public String getHouse_valid() {
        return house_valid;
    }

    public void setHouse_valid(String house_valid) {
        this.house_valid = house_valid;
    }

    public int getHouse_lift() {
        return house_lift;
    }

    public void setHouse_lift(int house_lift) {
        this.house_lift = house_lift;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getBed() {
        return bed;
    }

    public void setBed(int bed) {
        this.bed = bed;
    }

    public int getWashing() {
        return washing;
    }

    public void setWashing(int washing) {
        this.washing = washing;
    }

    public int getAir() {
        return air;
    }

    public void setAir(int air) {
        this.air = air;
    }

    public int getBalcony() {
        return balcony;
    }

    public void setBalcony(int balcony) {
        this.balcony = balcony;
    }

    public int getIce() {
        return ice;
    }

    public void setIce(int ice) {
        this.ice = ice;
    }

    public int getToilet() {
        return toilet;
    }

    public void setToilet(int toilet) {
        this.toilet = toilet;
    }

    public int getKitchen() {
        return kitchen;
    }

    public void setKitchen(int kitchen) {
        this.kitchen = kitchen;
    }

    public int getTv() {
        return tv;
    }

    public void setTv(int tv) {
        this.tv = tv;
    }

    public int getHeater() {
        return heater;
    }

    public void setHeater(int heater) {
        this.heater = heater;
    }

    public int getWardrobe() {
        return wardrobe;
    }

    public void setWardrobe(int wardrobe) {
        this.wardrobe = wardrobe;
    }

    public int getHeating() {
        return heating;
    }

    public void setHeating(int heating) {
        this.heating = heating;
    }

    public int getInternet() {
        return internet;
    }

    public void setInternet(int internet) {
        this.internet = internet;
    }

    public int getSofa() {
        return sofa;
    }

    public void setSofa(int sofa) {
        this.sofa = sofa;
    }

    @Override
    public String toString() {
        return "HouseView{" +
                "house_id=" + house_id +
                ", truename='" + truename + '\'' +
                ", house_title='" + house_title + '\'' +
                ", house_headimg='" + house_headimg + '\'' +
                ", house_price=" + house_price +
                ", price_unit='" + price_unit + '\'' +
                ", house_floor=" + house_floor +
                ", floor_all=" + floor_all +
                ", house_address='" + house_address + '\'' +
                ", house_layout='" + house_layout + '\'' +
                ", house_decorate='" + house_decorate + '\'' +
                ", house_area='" + house_area + '\'' +
                ", create_time='" + create_time + '\'' +
                ", house_turn='" + house_turn + '\'' +
                ", house_nature='" + house_nature + '\'' +
                ", house_model='" + house_model + '\'' +
                ", house_year='" + house_year + '\'' +
                ", house_valid='" + house_valid + '\'' +
                ", house_lift=" + house_lift +
                ", house_img1='" + house_img1 + '\'' +
                ", house_img2='" + house_img2 + '\'' +
                ", house_img3='" + house_img3 + '\'' +
                ", house_img4='" + house_img4 + '\'' +
                ", house_img5='" + house_img5 + '\'' +
                ", house_img6='" + house_img6 + '\'' +
                '}';
    }

}
