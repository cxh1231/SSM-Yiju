package com.yiju.bean;

public class UserInfo {

    private int user_id; //用户id
    private String phone; //用户手机号,用于登录
    private String password; //密码
    private String email; //邮箱
    private String nickname; //昵称
    private String truename; //真实姓名
    private int gender; //性别 0:男 1:女
    private String province; //省份
    private String city; //城市
    private int is_delete; //是否删除 0:未删除 1:已删除
    private long create_time; //创建时间
    private long update_time; //更新时间

    public int getUser_id() {
        return user_id;
    }

    public String getPhone() {
        return phone;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getNickname() {
        return nickname;
    }

    public String getTruename() {
        return truename;
    }

    public int getGender() {
        return gender;
    }

    public String getProvince() {
        return province;
    }

    public String getCity() {
        return city;
    }

    public int getIs_delete() {
        return is_delete;
    }

    public long getCreate_time() {
        return create_time;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setIs_delete(int is_delete) {
        this.is_delete = is_delete;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

    public UserInfo(String phone, String password, long create_time, long update_time) {
        this.phone = phone;
        this.password = password;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "user_id=" + user_id +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", truename='" + truename + '\'' +
                ", gender=" + gender +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", is_delete=" + is_delete +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                '}';
    }

    public UserInfo(String phone, String password) {
        this.phone = phone;
        this.password = password;
    }

    public UserInfo() {
    }

    public UserInfo(int user_id, String nickname, String truename, int gender, String city, long update_time) {
        this.user_id = user_id;
        this.nickname = nickname;
        this.truename = truename;
        this.gender = gender;
        this.city = city;
        this.update_time = update_time;
    }

    public UserInfo(int user_id, String password) {
        this.user_id = user_id;
        this.password = password;
    }
}
