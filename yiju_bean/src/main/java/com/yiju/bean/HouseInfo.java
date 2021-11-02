package com.yiju.bean;

/**
 * 房屋信息表
 */
public class HouseInfo {

    private int info_id; //房源详细信息表唯一标识ID
    private int house_id; //对应房源表唯一ID
    private String house_nature; //房源性质:商品房 住宅房
    private String house_model; //普通式住宅 公寓式住宅 别墅 独栋
    private int house_year; //房源建造时间
    private String house_valid; //房源期限: 70年、100年、永久
    private String house_layout; //房源户型：几室几厅几卫
    private String house_area; //房源面积
    private String house_turn; //朝向
    private int house_floor; //楼层
    private int floor_all; //总楼层
    private String house_decorate; //装饰类型：精装 简装
    private String house_lift; //是否有电梯: 0无 1有
    private long create_time; //创建时间
    private long update_time; //更新时间

    public int getInfo_id() {
        return info_id;
    }

    public void setInfo_id(int info_id) {
        this.info_id = info_id;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
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

    public int getHouse_year() {
        return house_year;
    }

    public void setHouse_year(int house_year) {
        this.house_year = house_year;
    }

    public String getHouse_valid() {
        return house_valid;
    }

    public void setHouse_valid(String house_valid) {
        this.house_valid = house_valid;
    }

    public String getHouse_layout() {
        return house_layout;
    }

    public void setHouse_layout(String house_layout) {
        this.house_layout = house_layout;
    }

    public String getHouse_area() {
        return house_area;
    }

    public void setHouse_area(String house_area) {
        this.house_area = house_area;
    }

    public String getHouse_turn() {
        return house_turn;
    }

    public void setHouse_turn(String house_turn) {
        this.house_turn = house_turn;
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

    public String getHouse_decorate() {
        return house_decorate;
    }

    public void setHouse_decorate(String house_decorate) {
        this.house_decorate = house_decorate;
    }

    public String getHouse_lift() {
        return house_lift;
    }

    public void setHouse_lift(String house_lift) {
        this.house_lift = house_lift;
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
        return "HouseInfo{" +
                "info_id=" + info_id +
                ", house_id=" + house_id +
                ", house_nature='" + house_nature + '\'' +
                ", house_model='" + house_model + '\'' +
                ", house_year=" + house_year +
                ", house_valid='" + house_valid + '\'' +
                ", house_layout='" + house_layout + '\'' +
                ", house_area='" + house_area + '\'' +
                ", house_turn='" + house_turn + '\'' +
                ", house_floor=" + house_floor +
                ", floor_all=" + floor_all +
                ", house_decorate='" + house_decorate + '\'' +
                ", house_lift='" + house_lift + '\'' +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }
}
