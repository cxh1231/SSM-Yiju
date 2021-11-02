package com.yiju.bean;

public class CollectView {
    private int coll_id;
    private int user_id;
    private int house_id;
    private int id_delete;
    private long create_time;
    private long update_time;
    private String house_title;
    private String house_headimg;
    private String house_address;

    public int getColl_id() {
        return coll_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public int getHouse_id() {
        return house_id;
    }

    public int getId_delete() {
        return id_delete;
    }

    public long getCreate_time() {
        return create_time;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public String getHouse_title() {
        return house_title;
    }

    public String getHouse_headimg() {
        return house_headimg;
    }

    public String getHouse_address() {
        return house_address;
    }

    public void setColl_id(int coll_id) {
        this.coll_id = coll_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public void setId_delete(int id_delete) {
        this.id_delete = id_delete;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

    public void setHouse_title(String house_title) {
        this.house_title = house_title;
    }

    public void setHouse_headimg(String house_headimg) {
        this.house_headimg = house_headimg;
    }

    public void setHouse_address(String house_address) {
        this.house_address = house_address;
    }

    public CollectView() {
    }

    @Override
    public String toString() {
        return "CollectView{" +
                "coll_id=" + coll_id +
                ", user_id=" + user_id +
                ", house_id=" + house_id +
                ", id_delete=" + id_delete +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                ", house_title='" + house_title + '\'' +
                ", house_headimg='" + house_headimg + '\'' +
                ", house_address='" + house_address + '\'' +
                '}';
    }
}
