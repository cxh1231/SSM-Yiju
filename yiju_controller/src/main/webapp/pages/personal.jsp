<%@ page import="com.yiju.bean.UserInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-04
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <%--<link rel="stylesheet" type="text/css" href="../css/city-select.css">--%>

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
<!--Logo栏和手机号栏 END-->

<hr width="1190px">
<br>

<%--个人信息--%>

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

        <%--右侧详情栏--%>
        <div class="vip-right">
            <h3 class="vipright-title">我的资料</h3>
            <table class="grinfo">
                <tbody>

                <% UserInfo userInfos= (UserInfo) request.getAttribute("userinfo");    %>

                <tr>
                    <th ><span class="red">*</span>手机号码：</th>
                    <td width="600px">
                        <input class="inp inw" type="text" id="phone" value="<%=userInfos.getPhone()%>" maxlength="14" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th><span class="red">*</span>姓　　名：</th>
                    <td>
                        <input class="inp inw" type="text" id="name" value="<% if(userInfos.getTruename()!=null) out.print(userInfos.getTruename()); %>" maxlength="14" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th><span class="red">*</span>昵　　称：</th>
                    <td>
                        <input class="inp inw" type="text" id="title" value="<% if(userInfos.getNickname()!=null) out.print(userInfos.getNickname());%>" maxlength="14" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <th height="40px"><span class="red">*</span>性　　别：</th>
                    <td height="40px">
                        <input type="radio" value="0" id="rbSex1" name="sex" <%if(userInfos.getGender()==0) out.print("checked");%> onClick='javascript:return false'>
                        <label for="rbSex1">男　　　　　　　　</label>
                        <input type="radio" value="1" id="rbSex2" name="sex" <%if(userInfos.getGender()==1) out.print("checked");%> onClick='javascript:return false'>
                        <label for="rbSex2">女</label>
                        <span id="Sex_Tip"></span>
                    </td>
                </tr>
                <tr>
                    <th><span class="red">*</span>城　　市：</th>
                    <td>
                        <input class="inp inw" type="text" id="city" value="<% if(userInfos.getCity()!=null) out.print(userInfos.getCity());%>" maxlength="14" disabled="disabled">
                    </td>
                </tr>

                <tr>
                    <th>&nbsp;</th>
                    <td colspan="2">
                        <label class="butt" id="butt">
                            <input type="submit" class="member_mod_buttom" onclick="window.location.href='/user/infoEdit.do'" value="编辑资料" />
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
        </div><!--vip-right/-->
        <div class="clearfix"></div>
    </div><!--width1190/-->
</div><!--content/-->
<!--End  个人信息填写栏-->

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
    <%--$(function() {--%>
        <%--// 单选--%>
        <%--var singleSelect1 = $('#single-select-1').citySelect({--%>
            <%--dataJson: cityData,--%>
            <%--multiSelect: false,--%>
            <%--whole: true,--%>
            <%--shorthand: true,--%>
            <%--search: true,--%>
            <%--onInit: function () {--%>
                <%--console.log(this)--%>
            <%--},--%>
            <%--onTabsAfter: function (target) {--%>
                <%--console.log(target)--%>
            <%--},--%>
            <%--onCallerAfter: function (target, values) {--%>
                <%--console.log(JSON.stringify(values))--%>
            <%--}--%>
        <%--});--%>

        <%--// 单选设置城市--%>
        <%--singleSelect1.setCityVal('<% if(userInfos.getCity()!=null) out.print(userInfos.getCity());%>');--%>

        <%--singleSelect1.status('readonly')--%>

        <%--// 单选--%>
        <%--var singleSelect2 = $('#single-select-2').citySelect({--%>
            <%--dataJson: cityData--%>
        <%--});--%>

        <%--// 单选设置城市--%>
        <%--singleSelect2.setCityVal('北京市');--%>

        <%--// 禁止点击显示的接口--%>
        <%--//singleSelect1.status('readonly');--%>

        <%--//单选--%>
        <%--var singleSelect3 = $('#single-select-3').citySelect({--%>
            <%--dataJson: cityData--%>
        <%--});--%>

        <%--// 单选设置城市--%>
        <%--singleSelect3.setCityVal('广州市');--%>

        <%--// 禁止点击显示的接口--%>
        <%--singleSelect3.status('disabled');--%>

    <%--});--%>
</script>


<!--这是页脚-->
<jsp:include page="../pages/basefoot.jsp"></jsp:include>

</body>
</html>
