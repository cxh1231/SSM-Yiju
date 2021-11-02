package com.yiju.bean;

/**
 * 公告类
 */
public class Notice {

    private int notice_id; //公告ID
    private int admin_id; //发布公告的管理员ID
    private String notice_title; //公告标题
    private String notice_content; //公告内容
    private int notice_status; //公告状态0-隐藏 1-显示
    private int is_delete; //是否已删除
    private long create_time; //创建时间

    public int getNotice_id() {
        return notice_id;
    }

    public void setNotice_id(int notice_id) {
        this.notice_id = notice_id;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getNotice_title() {
        return notice_title;
    }

    public void setNotice_title(String notice_title) {
        this.notice_title = notice_title;
    }

    public String getNotice_content() {
        return notice_content;
    }

    public void setNotice_content(String notice_content) {
        this.notice_content = notice_content;
    }

    public int getNotice_status() {
        return notice_status;
    }

    public void setNotice_status(int notice_status) {
        this.notice_status = notice_status;
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

    @Override
    public String toString() {
        return "Notice{" +
                "notice_id=" + notice_id +
                ", admin_id=" + admin_id +
                ", notice_title='" + notice_title + '\'' +
                ", notice_content='" + notice_content + '\'' +
                ", notice_status='" + notice_status + '\'' +
                ", is_delete=" + is_delete +
                ", create_time=" + create_time +
                '}';
    }

}
