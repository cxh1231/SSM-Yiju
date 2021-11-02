package com.yiju.controller;

import com.github.pagehelper.PageInfo;
import com.yiju.bean.*;
import com.yiju.controller.util.QiniuCloudUtil;
import com.yiju.controller.util.UploadFiles;
import com.yiju.service.IHouseService;
import com.yiju.service.IUserService;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("house")
public class HouseController {

    @Autowired
    private IHouseService houseService;
    @Autowired
    private IUserService userService;

    @RequestMapping("index.do")
    public String toHomePage() {
        return "redirect:/house/searchFourHouseViewByType.do";
    }

    @RequestMapping("toRequestHouse")
    public String toRequestHouse(Model model,HttpSession session,int page,int size) {
        if(session.getAttribute("user_id") != null) {
            List<Need> needs=userService.getNeed(page,size);
            PageInfo pageInfo = new PageInfo(needs);
            model.addAttribute("needs",pageInfo);
            return "requesthouse";
        }
        return "redirect:/user/loginpage.do";
    }

    /**
     * 点击房源发布
     * @param session
     * @return
     */
    @RequestMapping("toPostHouseInfo.do")
    public String toPostHouseInfo(HttpSession session) {
        if(session.getAttribute("user_id") != null) {
            return "housePost1";
        }
        return "redirect:/user/loginpage.do";
    }

    @RequestMapping("toNoticePage.do")
    public String toNoticePage(HttpSession session) {
        if(session.getAttribute("user_id") != null) {
            return "notice";
        }
        return "redirect:/user/loginpage.do";
    }

    /**
     * 跳转到发布房源信息页
     * @param session
     * @param house_title 房间贴标题
     * @param house_address 房源地址
     * @param house_price 房源预售价格
     * @param price_unit 房源单位
     * @param house_headimg 房源帖头像
     * @param house_planimg1 房源平面图1
     * @param house_planimg2 房源平面图2
     * @param house_img1 房源内视图1
     * @param house_img2 房源内视图2
     * @param house_img3 房源内视图3
     * @param house_img4 房源内视图4
     * @param house_img5 房源内视图5
     * @param house_img6 房源内视图6
     * @return 发布房源详情页
     * @throws Exception
     */
    @RequestMapping("toHousePost2.do")
    public String toHousePost2(HttpSession session,
                               @Param(value = "house_title")String house_title,
                               @Param(value = "house_address")String house_address,
                               @Param(value = "house_price") BigDecimal house_price,
                               @Param(value = "price_unit")String price_unit,
                               @Param(value = "house_headimg")MultipartFile house_headimg,
                               @Param(value = "house_planimg1")MultipartFile house_planimg1,
                               @Param(value = "house_planimg2")MultipartFile house_planimg2,
                               @Param(value = "house_img1")MultipartFile house_img1,
                               @Param(value = "house_img2")MultipartFile house_img2,
                               @Param(value = "house_img3")MultipartFile house_img3,
                               @Param(value = "house_img4")MultipartFile house_img4,
                               @Param(value = "house_img5")MultipartFile house_img5,
                               @Param(value = "house_img6")MultipartFile house_img6) throws Exception {

        House house = new House();

        house.setHouse_title(house_title);
        house.setHouse_price(house_price);
        house.setHouse_address(house_address);
        house.setPrice_unit(price_unit);

        Map<byte[], String> images = new HashMap<>();

        if(house_headimg.getSize() != 0) {
            byte[] headimg_bytes = house_headimg.getBytes();
            String headimg = UploadFiles.getRandomImageName();
            house.setHouse_headimg(headimg);
            images.put(headimg_bytes, headimg);
        }

        if(house_planimg1.getSize() != 0) {
            byte[] planimg1_byte = house_planimg1.getBytes();
            String planimg1 = UploadFiles.getRandomImageName();
            house.setHouse_planimg1(planimg1);
            images.put(planimg1_byte, planimg1);
        }

        if(house_planimg2.getSize() != 0) {
            byte[] planimg2_bytes = house_planimg2.getBytes();
            String planimg2 = UploadFiles.getRandomImageName();
            house.setHouse_planimg2(planimg2);
            images.put(planimg2_bytes, planimg2);
        }

        if(house_img1.getSize() != 0) {
            byte[] img1_bytes = house_img1.getBytes();
            String img1 = UploadFiles.getRandomImageName();
            house.setHouse_img1(img1);
            images.put(img1_bytes, img1);
        }

        if(house_img2.getSize() != 0) {
            byte[] img2_bytes = house_img2.getBytes();
            String img2 = UploadFiles.getRandomImageName();
            house.setHouse_img2(img2);
            images.put(img2_bytes, img2);
        }

        if(house_img3.getSize() != 0) {
            byte[] img3_bytes = house_img3.getBytes();
            String img3 = UploadFiles.getRandomImageName();
            house.setHouse_img3(img3);
            images.put(img3_bytes, img3);
        }

        if(house_img4.getSize() != 0) {
            byte[] img4_bytes = house_img4.getBytes();
            String img4 = UploadFiles.getRandomImageName();
            house.setHouse_img4(img4);
            images.put(img4_bytes, img4);
        }

        if(house_img5.getSize() != 0) {
            byte[] img5_bytes = house_img5.getBytes();
            String img5 = UploadFiles.getRandomImageName();
            house.setHouse_img5(img5);
            images.put(img5_bytes, img5);
        }

        if(house_img6.getSize() != 0) {
            byte[] img6_bytes = house_img6.getBytes();
            String img6 = UploadFiles.getRandomImageName();
            house.setHouse_img6(img6);
            images.put(img6_bytes, img6);
        }

        session.setAttribute("images", images);
        session.setAttribute("house", house);
        return "housePost2";
    }

    /**
     * 详情页按钮响应事件处理
     * @param session
     * @param houseInfo
     * @return
     * @throws Exception
     */
    @RequestMapping("responsePost2.do")
    @ResponseBody
    public String responsePost2(HttpSession session, HouseInfo houseInfo) throws Exception {

        JSONObject resultJSON = new JSONObject();
        session.setAttribute("houseInfo", houseInfo);
        return resultJSON.toString();
    }

    /**
     * 转到发布房源内饰页
     * @return
     * @throws Exception
     */
    @RequestMapping("toHousePost3.do")
    public String toHousePost3() throws Exception {

        return "housePost3";
    }

    /**
     * 房源内设信息页响应事件处理
     * @param session
     * @param houseInter
     * @return
     * @throws Exception
     */
    @RequestMapping("responsePost3.do")
    @ResponseBody
    public String responsePost3(HttpSession session, HouseInter houseInter) throws Exception {

        JSONObject resultJSON = new JSONObject();
        session.setAttribute("houseInter", houseInter);
        return resultJSON.toString();
    }

    /**
     * 处理发布房源信息
     * @param session
     * @return 跳转到发布房源信息页
     * @throws Exception
     */
    @RequestMapping("doHousePost.do")
    public String doHousePost(HttpSession session) throws Exception {

        int user_id = (int) session.getAttribute("user_id");

        // 添加房源基本信息
        House house = (House) session.getAttribute("house");
        house.setCreate_time(new Date().getTime());
        house.setUpdate_time(new Date().getTime());
        house.setUser_id(user_id);
        houseService.postHouse(house);

        // 添加房源详细信息
        HouseInfo houseInfo = (HouseInfo) session.getAttribute("houseInfo");
        houseInfo.setHouse_id(house.getHouse_id());
        houseInfo.setCreate_time(new Date().getTime());
        houseInfo.setUpdate_time(new Date().getTime());
        houseService.postHouseInfo(houseInfo);

        // 添加房源内设信息
        HouseInter houseInter = (HouseInter) session.getAttribute("houseInter");
        houseInter.setHouse_id(house.getHouse_id());
        houseInter.setCreate_time(new Date().getTime());
        houseInter.setUpdate_time(new Date().getTime());
        houseService.postHouseInter(houseInter);

        // 读取图片,上传到七牛云
        HashMap<byte[], String> images = (HashMap<byte[], String>) session.getAttribute("images");
        Set<byte[]> keySet = images.keySet();
        for(byte[] key: keySet) {
            QiniuCloudUtil.put64Image(key, images.get(key));
        }

        // 从session中移除无用信息
        session.removeAttribute("house");
        session.removeAttribute("houseInfo");
        session.removeAttribute("houseInter");

        // 跳转到发布的详细信息页面
        return "redirect:/house/todetails.do?house_id=" + house.getHouse_id();
    }

    /**
     * 全局搜索所有包含house_title的数据信息
     * @param model
     * @param house_title 模糊查询的字段
     * @return 跳到搜索结果页
     */
    @RequestMapping("getAllHouseByFuzzySearch.do")
    public String getAllHouseByFuzzySearch(Model model, String house_title) {

        List<HouseView> houses = houseService.getAllHouseByFuzzySearch(house_title);
        for(HouseView house:houses) {
            house.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date(house.getCreate_time())));
        }
        model.addAttribute("houses", houses);
        return "showSearchedHouse";
    }

    /**
     * 根据房源类型和模糊字段查询房源信息
     * @param model
     * @param house_title 要查询的模糊字段
     * @param house_type 房源类型
     * @return
     */
    @RequestMapping("getHouseByFuzzySearch.do")
    public String getHouseByFuzzySearch(Model model, @Param(value="house_title")String house_title, @Param(value = "house_type")int house_type) {

        List<HouseView> houses = houseService.getHouseByFuzzySearch(house_title, house_type);
        for(HouseView house:houses) {
            house.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date(house.getCreate_time())));
        }
        model.addAttribute("houses", houses);
        return "showSearchedHouse";
    }

//    @RequestMapping("getHouseByTypeAndIncPrice.do")
//    public String sortHouseByIncPrice(Model model, int house_type) {
//
//        List<House> houses = houseService.getHouseByTypeAndIncPrice(house_type);
//        model.addAttribute("houses", houses);
//        if(house_type == 0) {
//            return "newhouse";
//        } else if(house_type == 1) {
//            return "oldhouse";
//        } else if(house_type == 2) {
//            return "renthouse";
//        }
//        return "../error";
//    }

//    @RequestMapping("getHosueByTypeAndDescPrice.do")
//    public String sortHouseByDescPrice(Model model, int house_type) {
//
//        List<House> houses = houseService.getHouseByTypeAndDescPrice(house_type);
//        model.addAttribute("houses", houses);
//        if(house_type == 0) {
//            return "newhouse";
//        } else if(house_type == 1) {
//            return "oldhouse";
//        } else if(house_type == 2) {
//            return "renthouse";
//        }
//        return "../error";
//    }

//    @RequestMapping("getHouseByHouseType.do")
//    public String getHouseByHouseType(Model model, int house_type) {
//
//        List<House> houses = houseService.getHouseByHouseType(house_type);
//        model.addAttribute("houses", houses);
//        if(house_type == 0) {
//            return "newhouse";
//        } else if(house_type == 1) {
//            return "oldhouse";
//        } else if(house_type == 2) {
//            return "renthouse";
//        }
//        return "../error";
//    }

    @RequestMapping("todetails.do")
    public String toDetails(Model model, int house_id) {

        HouseView houseView = houseService.searchHouseViewByHouseId(house_id);
        model.addAttribute("houseInfo", houseView);
        return "details";
    }

    @RequestMapping("searchThreeRandomView")
    public String searchThreeRandomView(Model model) {

        List<HouseView> houseViews = houseService.searchThreeRandomView();
        model.addAttribute("houseViews", houseViews);
        return "showSearchedHouse";
    }

    /**
     * 随机查找四个房源信息
     * @param model
     * @return 返回主界面
     */
    @RequestMapping("searchFourHouseViewByType.do")
    public String searchFourHouseViewByType(Model model) {

        List<HouseView> newhouses = houseService.searchFourHouseViewByType(0);
        List<HouseView> oldhouses = houseService.searchFourHouseViewByType(1);
        List<HouseView> renthouses = houseService.searchFourHouseViewByType(2);
        model.addAttribute("newhouses", newhouses);
        model.addAttribute("oldhouses", oldhouses);
        model.addAttribute("renthouses", renthouses);
        return "../home";
    }

    /**
     * 根据房源类型搜索房源相关信息
     * @param model
     * @param page 当前页
     * @param size 一页显示的记录条数
     * @param house_type 房源类型
     * @return 各详情页面
     */
    @RequestMapping("searchHouseViewByType.do")
    public String searchHouseViewByType(Model model, int page, int size, int house_type) {

        List<HouseView> houses = houseService.searchHouseViewByType(page, size, house_type);
        for (HouseView house:houses) {
            house.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date(house.getCreate_time())));
        }
        List<HouseView> random_houses = houseService.searchThreeRandomView();
        PageInfo pageInfo = new PageInfo(houses);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("random_houses", random_houses);
        if(house_type == 0) {
            return "newhouse";
        } else if(house_type == 1){
            return "oldhouse";
        } else if(house_type == 2){
            return "renthouse";
        }
        return "../error";
    }

}
