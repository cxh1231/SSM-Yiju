package com.yiju.bean;

/**
 * 收藏类
 */
public class Collect {

    private int coll_id; //收藏记录的唯一标识ID
    private int user_id; //用户ID
    private int house_id; //用户收藏的房源ID
    private int is_delete; //是否删除 0-未删除 1-已删除
    private long create_time; //创建时间
    private long update_time; //更新时间

    public int getColl_id() {
        return coll_id;
    }

    public void setColl_id(int coll_id) {
        this.coll_id = coll_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
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
        return "Collect{" +
                "coll_id=" + coll_id +
                ", user_id=" + user_id +
                ", house_id=" + house_id +
                ", is_delete=" + is_delete +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }

    public Collect(int user_id, int house_id) {
        this.user_id = user_id;
        this.house_id = house_id;
    }

    public Collect(int user_id, int house_id, long create_time, long update_time) {
        this.user_id = user_id;
        this.house_id = house_id;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public Collect() {
    }
}
