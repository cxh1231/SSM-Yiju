<%--
  Created by IntelliJ IDEA.
  User: 李峰
  Date: 2019/7/6
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>联系我们</title>

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
            $(".nav li:eq(7)").addClass("navCur");
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
    <p style="font-size: 16px">当前位置：<a href="../index.jsp">首页</a> ＞＞ <a href="../pages/contact.jsp">联系我们</a></p>
</div>

<%--这里是展示内容--%>
<div class="content">
    <div class="width1190">
        <div class="contleft">
            <ul class="leftNav">
                <li><a href="../pages/about.jsp">关于我们</a></li>
                <li class="leftNavCur"><a href="../pages/contact.jsp">联系我们</a></li>
            </ul><!--leftNav/-->
        </div><!--contleft/-->
        <div class="contright">
            <h2 class="rightat">欢迎联系我们！</h2>
            <div class="about">
                <img src="../images/contact.jpg" /><br />
            </div>
        </div><!--contright/-->
        <div class="clears"></div>
    </div><!--width1190/-->
</div><!--content/-->

<%--显示页脚--%>
<jsp:include page="../pages/basefoot.jsp"></jsp:include>

</body>
</html>
