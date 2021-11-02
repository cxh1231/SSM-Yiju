package com.yiju.bean;

/**
 * 图片类
 */
public class Image {

    private int img_id; //图片主键ID
    private int user_id; //用户ID
    private String img_name; //图片名称
    private int is_delete; //是否已删除 0-未删除 1-已删除
    private long create_time; //创建时间
    private long update_time; //更新时间

    public int getImg_id() {
        return img_id;
    }

    public void setImg_id(int img_id) {
        this.img_id = img_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getImg_name() {
        return img_name;
    }

    public void setImg_name(String img_name) {
        this.img_name = img_name;
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
        return "Image{" +
                "img_id=" + img_id +
                ", user_id=" + user_id +
                ", img_name='" + img_name + '\'' +
                ", is_delete=" + is_delete +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }

}
