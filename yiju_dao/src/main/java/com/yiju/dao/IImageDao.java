package com.yiju.dao;

import com.yiju.bean.Image;

public interface IImageDao {

    public int insertImage(Image image); //向数据库插入图片

    public int deleteImageById(int id); //根据id删除图片信息

    public int udpateImage(Image image); //更新图片信息

    public String getImageNmaeById(int img_id); //根据图片id获取图片信息(名字)

}
