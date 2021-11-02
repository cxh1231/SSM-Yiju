package com.yiju.bean;

public class Need {
    private int need_id;
    private int user_id;
    private String need_title;
    private String need_details;
    private int id_delete;
    private long create_time;

    public Need() {
    }

    public Need(int user_id, String need_title, String need_details, long create_time) {
        this.user_id = user_id;
        this.need_title = need_title;
        this.need_details = need_details;
        this.create_time = create_time;
    }

    public int getNeed_id() {
        return need_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getNeed_title() {
        return need_title;
    }

    public String getNeed_details() {
        return need_details;
    }

    public int getId_delete() {
        return id_delete;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setNeed_id(int need_id) {
        this.need_id = need_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setNeed_title(String need_title) {
        this.need_title = need_title;
    }

    public void setNeed_details(String need_details) {
        this.need_details = need_details;
    }

    public void setId_delete(int id_delete) {
        this.id_delete = id_delete;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }
}
