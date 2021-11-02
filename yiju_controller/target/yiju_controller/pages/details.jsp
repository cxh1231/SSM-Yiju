<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

%>

<html>
<head>
   <title>房源详情页</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Author" contect="http://www.webqin.net">
    <link rel="shortcut icon" href="../images/favicon.ico" />
    <scrip src="../js/jquery-2.1.1.min.js"></scrip>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/js.js"></script>
</head>



<body>
<!--头部最上方的框-->
<jsp:include page="../pages/basehead.jsp"></jsp:include>
<!--头部最上方的框-->

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

<!--导航栏-->
<div class="list-nav">
    <div class="width1190">
        <ul class="nav">
            <li><a href="../index.jsp">首页</a></li>
            <li><a href="/house/searchHouseViewByType.do?house_type=0&page=1&size=6">新房</a></li>
            <li><a href="/house/searchHouseViewByType.do?house_type=1&page=1&size=6">二手房</a></li>
            <li><a href="/house/searchHouseViewByType.do?house_type=2&page=1&size=6">租房</a></li>
            <li class="zhiding"><a href="/house/toRequestHouse.do?page=1&size=6">指定购房</a></li>
            <li><a href="/house/toPostHouseInfo.do">发布房源</a></li>
            <li><a href="/house/toNoticePage.do">公告中心</a></li>
            <li><a href="#">关于我们</a></li>
            <div class="clears"></div>
        </ul><!--nav-->
        <div class="clears"></div>
    </div><!--width1190-->
</div><!--list-nav-->
<!--导航栏End-->

<div class="content">
    <div class="width1190">
        <p style="font-size: 16px">当前位置：<a href="../index.jsp">首页</a> ＞＞ <a href="/house/todetails.do?house_id=${houseInfo.house_id}">房源详情</a></p>
    </div>
</div>

<%--显示房屋详情--%>
<div class="content">
    <div class="width1190" style="width:1000px;">
        <div class="proImg fl">
            <img src="http://image.cxhit.com/${houseInfo.house_headimg}" />
        </div><!--proImg/-->
        <div style="width:535px;margin:30px 0;float: right;">
            <h3 class="proTitle">${houseInfo.house_title} </h3>

            <div class="proText1">

                <table width="90%" align="left" cellspacing="5" cellpadding="5" style="font-size: 130%">
                    <tr>
                        <td>房屋编号：<a name="house_id">${houseInfo.house_id}</a></td>
                        <td>房屋性质：${houseInfo.house_nature}</td>
                    </tr>
                    <tr>
                        <td>装　　修：${houseInfo.house_decorate}</td>
                        <td>售　　价：${houseInfo.house_price}${houseInfo.price_unit}</td>
                    </tr>
                    <tr>
                        <td>面　　积：${houseInfo.house_area}㎡</td>
                        <td>户　　型：${houseInfo.house_layout}</td>
                    </tr>
                    <tr>
                        <td>朝　　向：${houseInfo.house_turn}</td>
                        <td>配套电梯：
                           <c:choose>
                               <c:when test="${houseInfo.house_lift == 1}" >有</c:when>
                               <c:when test="${houseInfo.house_lift == 0}" >无</c:when>
                               <c:otherwise>未知</c:otherwise>
                           </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>房屋类型：${houseInfo.house_model}</td>
                        <td>楼　　层：${houseInfo.house_floor}层/${houseInfo.floor_all}层</td>
                    </tr>
                    <tr>
                        <td>建造年份：${houseInfo.house_year}</td>
                        <td>居住期限：${houseInfo.house_valid} </td>
                    </tr>
                    <tr>
                        <td colspan="2">所在小区：${houseInfo.house_address}</td>
                    </tr>
                    <%--<tr><td colspan="2">&nbsp;</td></tr>--%>
                </table>
            </div>
            <div class="xun-car">
                <input class="pricebutton" type="button" value="￥${houseInfo.house_price}${houseInfo.price_unit}">
                <input class="collectbutton" type="button" value="关注房源">
                <%--<a href="javascript:;" class="xwjg">¥<strong>${houseInfo.house_price}</strong>${houseInfo.price_unit}</a>--%>
                <%--<a href="/user/follow.do?house_id=${houseInfo.house_id}" class="projrgwc">关注房源</a>--%>
            </div>

        </div><!--proText/-->
        <div class="clears"></div>
    </div><!--width1190/-->

    <%--下面是房源详情页--%>
    <div class="proBox" style="width:1000px;margin:10px auto;">
        <div class="proEq">
            <ul class="fl">
                <li class="proEqCur">房源图片</li>
                <li>小区介绍</li>
                <li>用户评价</li>
            </ul>
            <div class="clears"></div>
        </div><!--proEq/-->

        <div class="proList">
            <h2 class="title"><a style="color:#F1323B"> </a>房源平面图</h2>
            <br>
            <c:if test="${!empty houseInfo.house_planimg1}">
                <img src="http://image.cxhit.com/${houseInfo.house_planimg1}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseInfo.house_planimg2}">
                <img src="http://image.cxhit.com/${houseInfo.house_planimg2}" style="width: 286px;height: 188px"/>
            </c:if>
            <h2 class="title"><a style="color:#F1323B"> </a>房源内饰图</h2>
            <br>
            <c:if test="${!empty houseInfo.house_img1}">
                <img src="http://image.cxhit.com/${houseInfo.house_img1}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseInfo.house_img2}">
                <img src="http://image.cxhit.com/${houseInfo.house_img2}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseInfo.house_img3}">
                <img src="http://image.cxhit.com/${houseInfo.house_img3}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseInfo.house_img4}">
                <img src="http://image.cxhit.com/${houseInfo.house_img4}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseInfo.house_img5}">
                <img src="http://image.cxhit.com/${houseInfo.house_img5}" style="width: 286px;height: 188px"/>
            </c:if>
            <c:if test="${!empty houseInfo.house_img6}">
                <img src="http://image.cxhit.com/${houseInfo.house_img6}" style="width: 286px;height: 188px"/>
            </c:if>

        </div><!--proList/-->
        <div class="proList">
            暂无信息...
        </div>
        <div class="proList">
            暂无评论……
        </div>
        <!--proList/-->
    </div><!--proBox/-->
</div><!--content/-->


<script type="text/javascript">
    function getBasePath(){
        return '<%=basePath%>';
    }

    $(function(){
        //点击关注房源按钮
        $(".collectbutton").on("click", function(){
            //获取几个基本信息
            var house_id = $("a[name=house_id]").text();
            // alert(house_id);
            var user_id='<%=session.getAttribute("user_id")%>';
            // alert(user_id);
            if(user_id=="null"){
                alert("请登录后再添加收藏！")
                location.href="/user/loginpage.do";
                return;
            }
            // else if(user_id.length==0){
            //     alert("请登录后再添加收藏！")
            //     location.href="redirect:/user/loginpage.do";
            //     return;
            // }
            else{
                $.ajax({
                    url: getBasePath()+"/user/follow.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    data:{house_id:house_id},
                    success: function (data) {
                        // alert(data.result);
                        if(data.result=="0"){
                            alert("您已收藏，请前往个人中心收藏夹查看！");
                            return;
                        }
                        else if(data.result == "2"){
                            alert("请先登录！");
                            location.href="/user/loginpage.do";
                            return;
                        }
                        else if(data.result == "1"){
                            alert("收藏成功，请前往个人中心收藏夹查看！");
                            // location.href="../index.jsp";
                            window.location.reload();
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

<%--引入页脚--%>
<iframe src="../pages/basefoot.jsp"frameborder="0" scrolling="no" height="263px" width="100%"></iframe>

</body>
</html>
