package com.yiju.service;

import com.yiju.bean.House;
import com.yiju.bean.HouseInfo;
import com.yiju.bean.HouseInter;
import com.yiju.bean.HouseView;

import java.util.List;

public interface IHouseService {

    public boolean postHouse(House house); //发布房源

    public boolean postHouseInfo(HouseInfo houseInfo); //发布房源信息

    public boolean postHouseInter(HouseInter houseInter); //发布房屋内饰信息

    public List<HouseView> getHouseByFuzzySearch(String house_title, int house_type); //根据房屋类型及关键字模糊查询房屋的基本信息

    public List<HouseView> searchThreeRandomView(); //随机获取三个房源信息

    public List<HouseView> searchFourHouseViewByType(int house_type); //根据房屋类型查询四条房屋综合信息

    public List<HouseView> searchHouseViewByType(int page, int size, int house_type); //根据房屋类型查询房屋综合信息

    public HouseView searchHouseViewByHouseId(int house_id); //根据房屋id获取房屋视图信息

    public List<HouseView> getAllHouseByFuzzySearch(String house_title); //获取所有相关房屋信息

    public List<House> getAllHouseBasicInfo(); //获取所有房源的基本信息

    public List<HouseInfo> getAllHouseInfo(); //获取所有房源的详细信息

    public House getHouseBasicInfoByHouseId(int house_id); //根据房源id获取房源基本信息

    public HouseInfo getHouseInfoByHouseId(int house_id); //根据房源id获取房源详细信息

    public HouseInter getHouseInterByHouseId(int house_id); //根据房源id查找房源内饰信息

    public List<House> getHouseByRecentPost(); //根据最近发布时间来获取房屋基本信息

    public List<House> getHouseByHouseIncPrice(); //根据价格升序来获取房屋信息

    public List<House> getHouseByHouseDescPrice(); //根据价格降序来获取房屋信息

    public List<House> getHouseByTypeAndDescPrice(int house_type); //根据价格升序来获取house_type类型的房屋信息

    public List<House> getHouseByTypeAndIncPrice(int house_type); //根据价格降序来获取house_type类型的房屋信息

    public List<House> getHouseByHouseType(int house_type); //根据房屋类型来获取房屋信息

    public List<House> selectTopFourHouseByType(int house_type); //根据房屋类型获取四条信息

    public boolean updateHouse(House house); //更改房屋基本信息

    public boolean updateHouseInfo(HouseInfo houseInfo); //更新房屋的基本信息

    public boolean updateHouseInter(HouseInter houseInter); //更新房屋内饰信息

}
