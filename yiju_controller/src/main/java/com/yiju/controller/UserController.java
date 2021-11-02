package com.yiju.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.yiju.bean.*;
import com.yiju.service.IUserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import static com.yiju.controller.util.AliyunSmsUtil.sendSms;

/**
 *  退出功能
 *  指定购房
 *  我的发布
 *
 */

//将Controller放入Spring
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private IUserService userService;

    @RequestMapping("index.do")
    public String  gohome(HttpServletRequest request){
        return "redirect:/index";
    }

    @RequestMapping("signpage.do")
    public String signpage(HttpServletRequest request){
        HttpSession session=request.getSession();
        if(session.getAttribute("user_id")!=null){
            return "redirect:/user/personal.do";
        }
        return "signup";
    }

    @RequestMapping("signup.do")
    @ResponseBody
    public String signup(HttpServletRequest request, String phone, String password, String verifyCode){
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();

        //判断该用户是否已经注册
        if(userService.checkPhone(phone) == false){
            resultJSON.put("result","3");
            return resultJSON.toString();
        }

        //创建Session
        HttpSession session = request.getSession();
        //得到session中的Code JSON
        JSONObject json = JSONObject.fromObject(session.getAttribute("Code"));

        //打印测试
        System.out.println("--------------");
        System.out.println(phone);
        System.out.println(password);
        System.out.println(verifyCode);
        System.out.println(json);

        if(!json.getString("verifyCode").equals(verifyCode)){
            resultJSON.put("result","0");
            return resultJSON.toString();
        }else if((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60 * 5){
            resultJSON.put("result",2);
            return resultJSON.toString();
        }
        else{
            UserInfo userInfo = new UserInfo(phone,password,new Date().getTime(),new Date().getTime());
            System.out.println(userInfo);
            userService.signup(userInfo);

            resultJSON.put("result","1");
            return resultJSON.toString();
        }
    }

    //发送短信验证码控制模块
    @RequestMapping("sendVCode.do")
    @ResponseBody
    public String sendmsg(HttpServletRequest request, String phone) throws ClientException, UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码

        //map集合用来存放返回值
        //Map<String,String> map = new HashMap<String, String>();
        JSONObject resultJSON = new JSONObject();
        System.out.println(phone);
        //首先检索该手机号是否已经注册网站的用户
        //TODO 加入手机号是否已注册的验证
        if(userService.checkPhone(phone) == false){
            resultJSON.put("result","2");
            return resultJSON.toString();
        }

        //如果未注册，则进行验证
        JSONObject json = null;
        //生成验证码随机数
        int verifyCode = (int)(Math.random()*8999)+1000;
        System.out.println(verifyCode);
        //发送短信
        SendSmsResponse response =sendSms(phone,Integer.toString(verifyCode)); // TODO 填写你需要测试的手机号码

        System.out.println("Code=" + response.getCode());
        System.out.println("Message=" + response.getMessage());
        System.out.println("RequestId=" + response.getRequestId());
        System.out.println("BizId=" + response.getBizId());

        //如果发送结果为OK
        //if(true){
        if(response.getCode().equals("OK")){
            //验证码加入session
            HttpSession session = request.getSession();
            json = new JSONObject();
            json.put("verifyCode",verifyCode);
            json.put("createTime",System.currentTimeMillis());
            session.setAttribute("Code",json);
            System.out.println(json);
            System.out.println(session.getAttribute("Code"));

            resultJSON.put("result","1");
            return resultJSON.toString();
        }
        else{
            resultJSON.put("result","0");
            return resultJSON.toString();
        }
    }

    /**
     * 用户点击注册按钮
     * @return 跳转至注册页面
     */
    @RequestMapping("loginpage.do")
    public String loginpage(HttpServletRequest request){
        HttpSession session=request.getSession();
        if(session.getAttribute("user_id")!=null){
            return "redirect:/user/personal.do";
        }
        return "login";
    }


    @RequestMapping("login.do")
    @ResponseBody
    public String login(HttpServletRequest request, String phone, String password){

        System.out.println(phone+"AAAAA"+password);
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();

        //判断该用户是否已经注册：未注册为2
        if(userService.checkPhone(phone) == true){
            System.out.println("Is Sign up");
            resultJSON.put("result","2");
            return resultJSON.toString();
        }

        UserInfo userInfoTemp = new UserInfo(phone,password);
        UserInfo userInfo = userService.loginByPassword(userInfoTemp);
        if(userInfo!=null){
            //创建Session
            HttpSession session = request.getSession();
            session.setAttribute("user_id",userInfo.getUser_id());
            //session.setAttribute("login_Time",new Date().getTime());
            resultJSON.put("result","1");
            return resultJSON.toString();
        }
        else{
            resultJSON.put("result","0");
            return resultJSON.toString();
        }
    }

    @RequestMapping("logout.do")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user_id")!=null){
            session.removeAttribute("user_id");
        }
        return "redirect:/user/loginpage.do";
    }

    /**
     * 跳转至个人信息页面
     */
    @RequestMapping("personal.do")
    public ModelAndView goPersonal(HttpServletRequest request){
        HttpSession session = request.getSession();
        ModelAndView mv= new ModelAndView();
        if(session.getAttribute("user_id")!=null){
            UserInfo userInfo = userService.getUserInfoById((int)session.getAttribute("user_id"));
//            mv.addObject("userinfo",userInfo);
            request.setAttribute("userinfo",userInfo);
            mv.setViewName("personal");
            return mv;
        }
        else{
            mv.setViewName("login");
            return mv;
        }
    }

    /**
     * 跳转至编辑页面
     */
    @RequestMapping("infoEdit.do")
    public String goInfoEdit(HttpServletRequest request){
        HttpSession session = request.getSession();

        if(session.getAttribute("user_id")!=null){
            UserInfo userInfo = userService.getUserInfoById((int)session.getAttribute("user_id"));
            request.setAttribute("userinfo",userInfo);
            return "personalEdit";
        }
        return "login";
    }

    /**
     * 保存用户修改的个人资料
     * @param request
     * @param truename 真实姓名
     * @param nickname 昵称
     * @param gender 性别
     * @param city 城市
     * @return
     */
    @RequestMapping("saveEdit.do")
    @ResponseBody
    public String saveEdit(HttpServletRequest request, String truename, String nickname,int gender,String city){
        System.out.println(truename+nickname+gender+city);
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();
        HttpSession session = request.getSession();
        if(session.getAttribute("user_id")!=null){
            UserInfo userInfo = new UserInfo((int)session.getAttribute("user_id"),nickname,truename,gender,city,new Date().getTime());
            System.out.println(userInfo);
            userService.updateUserInfo(userInfo);
                resultJSON.put("result","1");
                return resultJSON.toString();
        }
        else{
            resultJSON.put("result","2");
            return resultJSON.toString();
        }

    }

    /**
     * 跳转至用户实名认证页面
     * @param request
     * @return 页面跳转，带参数
     */
    @RequestMapping("verify.do")
    public ModelAndView goVerify(HttpServletRequest request){
        HttpSession session=request.getSession();
        ModelAndView mv= new ModelAndView();
        if(session.getAttribute("user_id")!=null){
            System.out.println(session.getAttribute("user_id"));
            int user_id=(int)session.getAttribute("user_id");
            UserAuth userAuth = userService.getUserAuthById(user_id);
            System.out.println(userAuth);
            request.setAttribute("userAuth",userAuth);
            mv.setViewName("verify");
            return mv;
        }
        else{
            mv.setViewName("login");
            return mv;
        }
    }

    @RequestMapping("verifyApply.do")
    public String verifyApply(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user_id")!=null){
            UserAuth userAuth=userService.getUserAuthById((int)session.getAttribute("user_id"));
            System.out.println(userAuth);
            if(userAuth!=null && userAuth.getAuth_status()==1){
                return "verify";
            }
            request.setAttribute("userAuth",userAuth);
            return "verifyApply";
        }
        else
            return "login";
    }

    @RequestMapping("saveAuth.do")
    @ResponseBody
    public String saveAuth(HttpServletRequest request,String truename,int gender,String card,String cardaddress,String liveaddress){
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();
        HttpSession session=request.getSession();
        if(session.getAttribute("user_id")!=null){
            UserAuth userAuth = new UserAuth((int)session.getAttribute("user_id"),truename,gender,card,cardaddress,liveaddress,new Date().getTime(),new Date().getTime());
            System.out.println(userAuth);
            userService.postUserAuth(userAuth);
            resultJSON.put("result","1");
            return resultJSON.toString();
        }
        else{
            resultJSON.put("result","2");
            return resultJSON.toString();
        }
    }

    @RequestMapping("psdSet.do")
    public String goPsdSetting(){
        return "psdsetting";
    }


    @RequestMapping("psdchange.do")
    @ResponseBody
    public String doPsdChange(HttpServletRequest request, String oldpassword, String password,String password2){
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();

        if(!password.equals(password2)){
            resultJSON.put("result","2");
            return resultJSON.toString();
        }

        HttpSession session=request.getSession();
        UserInfo userInfo=new UserInfo((int)session.getAttribute("user_id"),oldpassword);
        if(userService.loginByIdPasswoed(userInfo)==null){
            resultJSON.put("result","0");
            return resultJSON.toString();
        }
        else{
            userInfo.setPassword(password);
            userService.updateUserPsd(userInfo);

            resultJSON.put("result","1");
            return resultJSON.toString();
        }
    }

    @RequestMapping("favorite.do")
    public String goFavorite(HttpServletRequest request, Model model){
        HttpSession session=request.getSession();
        if(session.getAttribute("user_id")!=null){
            List<CollectView> collects=userService.getCollectByUserId((int)session.getAttribute("user_id"));
            model.addAttribute("collcets",collects);
            return "favorite";
        }
        return "redirect:/user/loginpage.do";
    }

    @RequestMapping("follow.do")
    @ResponseBody
    public String follow(HttpServletRequest request,int house_id){
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();

        HttpSession session=request.getSession();
//        未登录
        if(session.getAttribute("user_id")==null){
            resultJSON.put("result","2");
            return resultJSON.toString();
        }
//        已收藏
        Collect collect=new Collect((int)session.getAttribute("user_id"),house_id);
        Collect collect1=userService.getCollectByUserAndHouse(collect);
        System.out.println(collect1);
        if(collect1 != null){
            if(collect1.getIs_delete()==0){
                resultJSON.put("result","0");
                System.out.println("222用户已收藏");
            }
            else{
                System.out.println("333用户已删除，重新收藏");
                userService.updateCollectAddColl(collect1.getColl_id());
                resultJSON.put("result","1");
            }
        }
        else{
            System.out.println("444用户从未收藏，立即收藏");
            Collect collect2=new Collect((int)session.getAttribute("user_id"),house_id,new Date().getTime(),new Date().getTime());
            userService.postCollect(collect2);
            resultJSON.put("result","1");
        }
        return resultJSON.toString();
    }

    @RequestMapping("removeColl.do")
    public String removeColl(int coll_id){
        userService.deleteCollect(coll_id);
        return "redirect:/user/favorite.do";
    }

    @RequestMapping("postNeed.do")
    @ResponseBody
    public String postNeed(HttpServletRequest request,String title,String details){
        System.out.println(title+details);
        //返回结果JSON集
        JSONObject resultJSON = new JSONObject();

        HttpSession session=request.getSession();
//        未登录
        if(session.getAttribute("user_id")==null){
            resultJSON.put("result","2");
            return resultJSON.toString();
        }else{
            Need need = new Need((int)session.getAttribute("user_id"),title,details,new Date().getTime());
            userService.postNeed(need);
            resultJSON.put("result","1");
            return resultJSON.toString();
        }
    }




}
