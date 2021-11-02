<%@ page import="com.yiju.bean.UserInfo" %><%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-04
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

    if(session.getAttribute("user_id")==null){
        response.sendRedirect("index.do");
    }
%>



<html>
<head>
    <title>个人中心</title>
    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <%--<link rel="stylesheet" type="text/css" href="../css/city-select.css">--%>

    <script src="../js/jquery-2.1.1.min.js"></script>

    <script type="text/javascript">

    </script>

</head>
<body>
<%--加入头部--%>
<jsp:include page="../pages/basehead.jsp"></jsp:include>

<!--Logo栏和手机号栏-->
<div class="logo-phone">
    <div class="width1190">

        <table align="center" width="100%">
            <tr>
                <td>
                    <h1 class="logo"><a href="../index.jsp"><img src="../images/logo.png" width="163" height="59" /></a></h1>
                </td>
                <td align="center">
                    <div class="phones"><strong>000-00000000</strong></div>
                    <div class="clears"></div>
                </td>

            </tr>
        </table>
    </div><!--width1190/-->
</div><!--logo-phone/-->
<!--Logo栏和手机号栏-->

<hr width="1190px">
<br>

<%--个人信息--%>

<!--个人信息-->


<div class="content">
    <div class="width1080">
        <%--左侧导航栏--%>
        <div class="vip-left">
            <div class="vipNav">
                <h3 class="vipTitle">账户中心</h3>
                <dl>
                    <dt class="vipIcon3">账户设置</dt>
                    <dd>
                        <a href="/user/personal.do" class="vipNavCur">我的资料</a>
                        <a href="/user/verify.do">实名认证</a>
                        <a href="/user/psdSet.do">账户密码设置</a>
                    </dd>
                    <dt class="vipIcon1">我的易居</dt>
                    <dd>
                        <a href="/user/favorite.do">我的收藏房源</a>
                    </dd>
                </dl>
            </div><!--vipNav/-->
        </div><!--vip-left/-->



        <div class="vip-right">
            <h3 class="vipright-title">编辑资料</h3>
            <table class="grinfo">
                <tbody>
                <% UserInfo userInfos= (UserInfo) request.getAttribute("userinfo");%>
                <tr>
                    <th ><span class="red">*</span>手机号码：</th>
                    <td width="600px">
                        <input class="inp inw" type="text" id="phone" value="<%=userInfos.getPhone()%>" maxlength="14" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th><span class="red">*</span>真实姓名：</th>
                    <td>
                        <input class="inp inw" type="text" id="name" name="truename" value="<% if(userInfos.getTruename()!=null) out.print(userInfos.getTruename()); %>" maxlength="14">
                    </td>
                </tr>
                <tr>
                    <th><span class="red">*</span>昵　　称：</th>
                    <td>
                        <input class="inp inw" type="text" id="title" name="nickname" value="<% if(userInfos.getNickname()!=null) out.print(userInfos.getNickname());%>" maxlength="14">
                    </td>
                </tr>
                <tr>
                    <th height="40px"><span class="red">*</span>性　　别：</th>
                    <td height="40px">
                        <input type="radio" value="0" id="rbSex1" name="sex" <%if(userInfos.getGender()==0) out.print("checked");%>>
                        <label for="rbSex1">男　　　　　　　　</label>
                        <input type="radio" value="1" id="rbSex2" name="sex" <%if(userInfos.getGender()==1) out.print("checked");%>>
                        <label for="rbSex2">女</label>
                        <span id="Sex_Tip"></span>
                    </td>
                </tr>
                <tr>
                    <th><span class="red">*</span>城　　市：</th>
                    <td>
                        <input class="inp inw" type="text" name="city" id="city" value="<% if(userInfos.getCity()!=null) out.print(userInfos.getCity());%>">
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;</th>
                    <td colspan="2">
                        <label class="butt" id="butt">
                            <input type="button" class="member_mod_buttom" id="member_mod_buttom" name="member_mod_buttom" value="保存修改" />
                            <a>　　</a>
                            <input type="button" class="member_mod_buttom2" onclick="window.location.href='/user/personal.do'" name="" value="取消修改" />
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
        </div><!--vip-right/-->
        <div class="clearfix"></div>
    </div><!--width1190/-->
</div><!--content/-->
<!--End  个人信息填写栏>-->

<div>
    <br>
    <br>
    <br>
    <br>
</div>

<script src="../js/city/jquery1.8.1.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="../js/city/citydata.min.js"></script>--%>
<%--<script type="text/javascript" src="../js/city/citySelect-1.0.3.js"></script>--%>
<script type="text/javascript">
    function getBasePath(){
        return '<%=basePath%>';
    }

    $(function() {
        //点击提交修改按钮
        $(".member_mod_buttom").on("click", function(){
            //获取几个基本信息
            var truename = $("input[name=truename]").val();
            var nickname=$("input[name=nickname]").val();
            var gender;
            if($('#rbSex1').is(':checked')){
                gender=0;
            }
            if($('#rbSex2').is(':checked')){
                gender=1;
            }

            var city=$("input[name=city]").val();
            //校验信息
            if(truename==""){
                alert("请输入姓名！");
                return;
            }
            else if(nickname==""){
                alert("请输入昵称！");
                return;
            }
            else if(city == ""){
                alert("请选择城市！");
                return;
            }
            else{
                $.ajax({
                    url: getBasePath()+"/user/saveEdit.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    //contentType: "application/json; charset=utf-8",
                    //data:JSON.stringify(data),
                    data:{truename:truename,nickname:nickname,gender:gender,city:city},
                    //data:{"phone":phone},
                    //data:JSON.stringify(data),
                    //data:"phone"+password+"&password"+password+"&verifyCode"+verifyCode,
                    success: function (data) {
                        if(data.result == "0"){
                            alert("保存失败！");
                            return;
                        }
                        else if(data.result == "2"){
                            alert("用户未登录，非法访问！");
                            location.href="loginpage.do";
                            return;
                        }
                        else if(data.result == "3"){
                            alert("该手机号已注册，请进行登录！")
                            return;
                        }
                        else if(data.result == "1"){
                            alert("修改成功！");
                            location.href="personal.do";
                            return;
                        }
                        else {
                            alert("未知错误！");
                            return;
                        }
                    }
                });
            }
        })


    });
</script>


<!--这是页脚-->
<jsp:include page="../pages/basefoot.jsp"></jsp:include>


</body>
</html>
