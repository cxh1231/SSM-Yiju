<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告中心</title>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <link type="text/css" href="../css/noticestyle.css" rel="stylesheet" />
    <%--导航栏的JS--%>
    <script type="text/javascript" src="../js/js.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <%--搜索框的css--%>
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet" />
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery2.min.js"></script>

    <script>
        //定位到导航栏的某个标签eq(*) 其中*为第几个标签
        $(function(){
            //导航定位
            $(".nav li:eq(6)").addClass("navCur");
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
            <li><a href="../pages/about.jsp">关于我们</a></li>
            <div class="clears"></div>
        </ul><!--nav-->
        <div class="clears"></div>
    </div><!--width1190-->
</div><!--list-nav-->
<!--导航栏End-->

<%--公告页面--%>
<div class="container">
    <div class="main">
        <div class="title1">
            <h4>重要公告</h4>
            <p>Announce</p>
        </div>
        <ul>
            <li class="one">
                <a href="#">
                    <img src="../images/new-cont.jpg" />
                    <div class="news-title">
                        <h5>重要公告</h5>
                        <p>News information</p>
                        <i class="icon-news"></i>
                    </div>
                </a>
            </li>
            <li class="two">
                <a href="#">
                    <div class="top">

                        <h5>2019.7月8日易居住房交易平台开发进展</h5>
                        <div class="p">
                            <p>易居购房平台经过系统测试以后投入使用。</p>
                        </div>
                        <img src="../images/new-jiantou.jpg">
                    </div>
                    <div class="bottom">
                        <h3>1</h3>
                        <span>2019.07</span>

                    </div>
                </a>
                <a href="#">
                    <div class="top">

                        <h5>2019年7月7日易居住房交易平台开发进展</h5>
                        <div class="p">
                            <p>2019年7月7日，易居购房平台前端设计基本完成，后台功能还有部分待完善实现，预计7月8日可以开始测试。</p>
                        </div>
                        <img src="../images/new-jiantou.jpg">
                    </div>
                    <div class="bottom">
                        <h3>5</h3>
                        <span>2019.07</span>

                    </div>
                </a>
            </li>
            <li class="three">
                <a href="#">
                    <div class="left">
                        <h3>6</h3>
                        <span>2019.07</span>
                    </div>
                    <div class="right">
                        <h5>2019年7月6日易居住房交易平台开发进展</h5>
                        <img src="../images/new-jiantou.jpg" />
                    </div>
                </a>
                <a href="#">
                    <div class="left">
                        <h3>2</h3>
                        <span>2019.07</span>
                    </div>
                    <div class="right">
                        <h5>2019年7月2日易居住房交易平台开发进展</h5>
                        <img src="../images/new-jiantou.jpg" />
                    </div>
                </a>
                <a href="#">
                    <div class="left">
                        <h3>1</h3>
                        <span>2019.07</span>
                    </div>
                    <div class="right">
                        <h5>2019年7月1日易居住房交易平台开发进展</h5>
                        <img src="../images/new-jiantou.jpg" />
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>

<%--<jsp:include page="basefoot.jsp"></jsp:include>--%>
<iframe src="../pages/basefoot.jsp"frameborder="0" scrolling="no" height="263px" width="100%"></iframe>

</body>
</html>
