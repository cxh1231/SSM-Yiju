<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.yiju.bean.House" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-04
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>新房房源列表</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <%--导航栏的JS--%>
    <script type="text/javascript" src="../js/js.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <%--搜索框的css--%>
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet" />
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery2.min.js"></script>

    <script>

        <%--搜索栏的JavaScript--%>
        $(function(){
            $(".select_box").click(function(event){
                event.stopPropagation();
                $(this).find(".option").toggle();
                $(this).parent().siblings().find(".option").hide();
            });
            $(document).click(function(event){
                var eo=$(event.target);
                if($(".select_box").is(":visible") && eo.attr("class")!="option" && !eo.parent(".option").length)
                    $('.option').hide();
            });
            $(".option li").click(function(){
                var check_value=$(this).text();
                var zlValue = $('.option li:eq(1)').html();
                var bqValue = $('.option li:eq(2)').html();
                $(this).parent().siblings(".select_txt").text(check_value);
                $("#select_value").val(check_value);
                if(check_value == zlValue) {
                    $('#searchPlaceholder').prop('placeholder','请输入旧房搜索信息');
                }else if(check_value == bqValue) {
                    $('#searchPlaceholder').prop('placeholder','请输入租房搜索信息');
                }else {
                    $('#searchPlaceholder').prop('placeholder','请输入新房搜索信息');
                }
            });
        })


        //定位到导航栏的某个标签eq(*) 其中*为第几个标签
        $(function(){
            //导航定位
            $(".nav li:eq(1)").addClass("navCur");
        })
    </script>

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
                    <%-- FIXME 这里替换成自己的LOPGO图片--%>
                    <h1 class="logo"><a href="../index.jsp"><img src="../images/logo.png" width="163" height="59"/></a></h1>
                </td>
                <td>
                    <div class="searchbox">
                        <div class="mod_select">
                            <div class="select_box">
                                <span class="select_txt">新房</span>
                                <span class="select-icon"></span>
                                <ul class="option">
                                    <li>新房</li>
                                    <li>旧房</li>
                                    <li>租房</li>
                                </ul>
                            </div>
                        </div>
                        <%--FIXME 这里是搜索栏，需要实现相应的模糊搜索功能 --%>
                        <form action="/house/getHouseByFuzzySearch.do?house_type=0" method="post">
                            <input type="text" name="house_title" id="searchPlaceholder" class="import" placeholder="请输入新房搜索信息">
                            <input type="submit" value="搜   索" class="btn-search">
                        </form>
                    </div>
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
            <li><a href="../pages/about.jsp">关于我们</a></li>
            <div class="clears"></div>
        </ul><!--nav-->
        <div class="clears"></div>
    </div><!--width1190-->
</div><!--list-nav-->
<!--导航栏End-->

<br>
<%--<div class="content">--%>
    <div class="width1190">
        <p style="font-size: 16px">当前位置：<a href="../index.jsp">首页</a> ＞＞ <a href="/house/searchHouseViewByType.do?house_type=0&page=1&size=6">新房房源</a></p>
    </div>

<%--</div>--%>

<%--房源列表--%>

<div class="content">
    <div class="width1190">
        <form action="" method="get" class="pro-search">
            <div class="paixu">
                <strong>排序：</strong>
                <a href="javascript:;" class="pai-cur">默认</a>
                <a href="javascript:;">价格 &or;</a>
                <a href="javascript:;">最新 &or;</a>
            </div>
        </form><!--pro-search/-->
    </div><!--width1190/-->
    <div class="width1190">
        <div class="pro-left">
            <%--房屋信息分页显示--%>
           <c:forEach var="house" items="${pageInfo.list}">
               <dl>
                   <dt><a href="/house/todetails.do?house_id=${house.house_id}"><img src="http://image.cxhit.com/${house.house_headimg}" style="width:286px;height:188px" width="286" height="188" /></a></dt>
                   <dd>
                       <h3><a href="/house/todetails.do?house_id=${house.house_id}">${house.house_title}</a></h3>
                       <div class="pro-wei">
                           <img src="../images/weizhi.png" width="12" height="16" style="width:12px;height:16px"/> <strong class="red">${house.house_address}</strong>
                       </div>
                       <div class="pro-fang">${house.house_layout} ${house.house_area}平 ${house.house_turn} ${house.house_floor}层/${house.floor_all}层</div>
                       <div class="pra-fa">发布人:${house.truename}先生  发布时间:${house.date}</div>
                   </dd>
                   <div class="price">¥ <strong>${house.house_price}</strong><span class="font12">${house.price_unit}</span></div>
                   <div class="clears"></div>
               </dl>
           </c:forEach>

            <%--分页按钮--%>
            <div class="pull-right">
                <ul class="pagination">
                    <li ><a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?house_type=0&page=${pageInfo.firstPage}&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?house_type=0&page=${pageInfo.pageNum - 1}&size=${pageInfo.pageSize}">上一页</a></li>
                    <c:forEach begin="1" end ="${pageInfo.pages}" var="pageNum">
                        <li><a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?house_type=0&page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                    </c:forEach>
                    <li><a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?house_type=0&page=${pageInfo.pageNum + 1}&size=${pageInfo.pageSize}">下一页</a></li>
                    <li><a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?house_type=0&page=${pageInfo.lastPage}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                </ul>
            </div><!--底部分页栏-->
        </div><!--pro-left/-->

        <div class="pro-right">
            <h2 class="right-title">推荐房源</h2>
            <div class="right-pro">
                <c:forEach var="random_house" items="${random_houses}">
                    <dl>
                        <dt><a href="/house/todetails.do?house_id=${random_house.house_id}"><img src="http://image.cxhit.com/${random_house.house_headimg}" style="width: 135px; height: 88px"/></a></dt>
                        <dd>
                            <h3><a href="/house/todetails.do?house_id=${random_house.house_id}">${random_house.house_title}</a></h3>
                            <div class="pro-fang">${random_house.house_layout} ${random_house.house_area}平 朝${random_house.house_turn}</div>
                            <div class="right-price">${random_house.house_price}${random_house.price_unit}</div>
                        </dd>
                    </dl>
                </c:forEach>
            </div><!--right-pro/-->
        </div><!--pro-right/-->
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--content/-->

<%--显示页脚--%>
<jsp:include page="../pages/basefoot.jsp"></jsp:include>


</body>
</html>
