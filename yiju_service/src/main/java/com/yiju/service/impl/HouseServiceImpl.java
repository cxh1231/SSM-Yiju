package com.yiju.service.impl;

import com.github.pagehelper.PageHelper;
import com.yiju.bean.House;
import com.yiju.bean.HouseInfo;
import com.yiju.bean.HouseInter;
import com.yiju.bean.HouseView;
import com.yiju.dao.IHouseDao;
import com.yiju.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseServiceImpl implements IHouseService {

    @Autowired
    private IHouseDao houseDao;

    @Override
    public boolean postHouse(House house) {

        return houseDao.postHouse(house) != 0;
    }

    @Override
    public boolean postHouseInfo(HouseInfo houseInfo) {

        return houseDao.postHouseInfo(houseInfo) != 0;
    }

    @Override
    public boolean postHouseInter(HouseInter houseInter) {

        return houseDao.postHouseInter(houseInter) != 0;
    }

    @Override
    public List<House> getAllHouseBasicInfo() {

        return houseDao.getAllHouseBasicInfo();
    }

    @Override
    public List<HouseInfo> getAllHouseInfo() {

        return houseDao.getAllHouseInfo();
    }

    @Override
    public House getHouseBasicInfoByHouseId(int house_id) {

        return houseDao.getHouseBasicInfoByHouseId(house_id);
    }

    @Override
    public HouseInfo getHouseInfoByHouseId(int house_id) {

        return houseDao.getHouseInfoByHouseId(house_id);
    }

    @Override
    public HouseInter getHouseInterByHouseId(int house_id) {

        return houseDao.getHouseInterByHouseId(house_id);
    }

    @Override
    public List<House> getHouseByRecentPost() {

        return houseDao.getHouseByRecentPost();
    }

    @Override
    public List<HouseView> getHouseByFuzzySearch(String house_title, int house_type) {

        return houseDao.getHouseByFuzzySearch(house_title, house_type);
    }

    @Override
    public List<House> getHouseByHouseIncPrice() {

        return houseDao.getHouseByHouseIncPrice();
    }

    @Override
    public List<House> getHouseByHouseDescPrice() {

        return houseDao.getHouseByHouseDescPrice();
    }

    @Override
    public List<House> getHouseByTypeAndDescPrice(int house_type) {

        return houseDao.getHouseByTypeAndDescPrice(house_type);
    }

    @Override
    public List<House> getHouseByTypeAndIncPrice(int house_type) {

        return houseDao.getHouseByTypeAndIncPrice(house_type);
    }

    @Override
    public List<House> getHouseByHouseType(int house_type) {

        return houseDao.getHouseByHouseType(house_type);
    }

    @Override
    public List<House> selectTopFourHouseByType(int house_type) {

        return houseDao.selectTopFourHouseByType(house_type);
    }

    @Override
    public List<HouseView> searchThreeRandomView() {

        return houseDao.searchThreeRandomView();
    }

    @Override
    public List<HouseView> searchHouseViewByType(int page, int size, int house_type) {

        PageHelper.startPage(page, size);
        return houseDao.searchHouseViewByType(house_type);
    }

    @Override
    public List<HouseView> searchFourHouseViewByType(int house_type) {

        return houseDao.searchFourHouseViewByType(house_type);
    }

    @Override
    public HouseView searchHouseViewByHouseId(int house_id) {
        return houseDao.searchHouseViewByHouseId(house_id);
    }

    @Override
    public List<HouseView> getAllHouseByFuzzySearch(String house_title) {

        return houseDao.getAllHouseByFuzzySearch(house_title);
    }

    @Override
    public boolean updateHouse(House house) {

        return houseDao.updateHouse(house) != 0;
    }

    @Override
    public boolean updateHouseInfo(HouseInfo houseInfo) {

        return houseDao.updateHouseInfo(houseInfo) != 0;
    }

    @Override
    public boolean updateHouseInter(HouseInter houseInter) {

        return houseDao.updateHouseInter(houseInter) != 0;
    }
}
