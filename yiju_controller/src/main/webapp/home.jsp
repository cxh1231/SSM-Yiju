<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-03
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>易居住房信息平台</title>

    <!--    下面是几个导入的包-->
    <link type="text/css" href="css/css.css" rel="stylesheet" />
    <link type="text/css" href="css/searchInputStyle.css" rel="stylesheet" />
    <link type="text/css" href="css/searchReset.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery2.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <!--    上面是几个导入的包-->

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
            $(".nav li:eq(0)").addClass("navCur");
        })

        //轮播图的JavaScript
        window.onload = function () {
            var next = document.getElementById("next")
            var liList = document.getElementById("adv").getElementsByTagName("li")
            var n = 0;//当前在第几张

            //初始化工作
            for(var i = 0;i<liList.length;i++){
                liList[i].style.opacity = 0;
            }
            liList[0].style.opacity = 1;

            function img(n){
                liList[n].style.display = "block"
                var t = setInterval(function () {
                    var o =Number(liList[n].style.opacity);
                    liList[n].style.opacity =o + 0.1;
                    if(o >= 1){
                        liList[n].style.opacity = 1;
                        clearInterval(t);
                    }
                },50)

            }
            next.onclick = function () {
                //将所有的图片都隐藏
                for(var i = 0; i<liList.length;i++){
                    liList[n].style.display = "none";
                    liList[n].style.opacity = 0
                }
                //将对应的图片显示出来
                if(n == liList.length - 1) {
                    n=0;
                }
                else{
                    n++;
                }
                img(n);
            }
            prev.onclick = function () {
                //将所有的图片都隐藏
                for(var i = 0; i<liList.length;i++){
                    liList[n].style.display = "none"
                    liList[n].style.opacity = 0
                }
                //将对应的图片显示出来
                if(n == 0)
                {
                    n=liList.length - 1;
                }
                else{
                    n--;
                }
                img(n);
            }
            setInterval(function () {
                next.onclick()  //触发next的单击事件
            },3000)
        }

    </script>

    <%--轮播图的CSS--%>
    <style>
        *{margin:0;padding:0;}
        li{list-style: none;}
        #adv{
            /*margin:110px auto;*/
            width:1190px;
            position: relative;
        }
        #adv li{
            display: none;
        }
        #adv .show{display:block;}
        #next,#prev{
            position: absolute;
            top:45%;
            cursor:pointer;
            transition:all .5s;
            opacity:.7;
        }
        #next:hover,#prev:hover{
            transform:scale(1.1);
            opacity:1;
        }
        #prev{
            left:10px;
            height:15%;
        }
        #next{
            right:10px;
            height:15%;
        }
    </style>

</head>
<body>
<jsp:include page="/pages/basehead.jsp"></jsp:include>
<!--头部最上方的框-->

<!--Logo栏和手机号栏-->
<div class="logo-phone">
    <div class="width1190">
        <table align="center" width="100%">
            <tr>
                <td>
                    <%-- FIXME 这里替换成自己的LOPGO图片--%>
                    <h1 class="logo"><a href="index.jsp"><img src="images/logo.png" width="163" height="59"/></a></h1>
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
                        <form action="/house/getAllHouseByFuzzySearch.do" >
                            <input type="text" name="house_title" id="searchPlaceholder" class="import" placeholder="请输入搜索信息">
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
            <li><a href="index.jsp">首页</a></li>
            <li><a href="/house/searchHouseViewByType.do?house_type=0&page=1&size=6">新房</a></li>
            <li><a href="/house/searchHouseViewByType.do?house_type=1&page=1&size=6">二手房</a></li>
            <li><a href="/house/searchHouseViewByType.do?house_type=2&page=1&size=6">租房</a></li>
            <li class="zhiding"><a href="/house/toRequestHouse.do?page=1&size=6">指定购房</a></li>
            <li><a href="/house/toPostHouseInfo.do">发布房源</a></li>
            <li><a href="/house/toNoticePage.do">公告中心</a></li>
            <li><a href="/pages/about.jsp">关于我们</a></li>
            <div class="clears"></div>
        </ul><!--nav-->
        <div class="clears"></div>
    </div><!--width1190-->
</div><!--list-nav-->
<!--导航栏End-->

<br>

<!--广告轮播栏-->
<div class="width1190">
    <ul id="adv">
        <li style="display: block;"><img src="images/lunbotu/fang1.jpg" alt=""></li>
        <li><img src="images/lunbotu/fang2.jpg" alt=""></li>
        <li><img src="images/lunbotu/fang3.jpg" alt=""></li>
        <img src="images/lunbotu/l.png" id="prev" alt="">
        <img src="images/lunbotu/r.png" id="next" alt="">
    </ul>
</div>
<%--广告轮播栏End --%>

<%--展示主页推荐栏--%>
<div class="content">
    <div class="width1190">
        <%--【新房推荐】--%>
        <%--FIXME 这里添加跳转事件--%>
        <h2 class="title"><a style="color:#F1323B">❤</a>新房推荐<a href="/house/searchHouseViewByType.do?house_type=0&page=1&size=6">更多&gt;&gt;</a></h2>
        <div class="index-fang-list">
            <%--FIXME 这里使用Foreach循环，从数据库读取房屋信息 --%>
            <c:forEach var="newhouse" items="${newhouses}">
                <dl>
                    <dt><a href="/house/todetails.do?house_id=${newhouse.house_id}"><img src="http://image.cxhit.com/${newhouse.house_headimg}" width="286" height="188" /></a></dt>
                    <dd>
                        <h3><a href="/house/todetails.do?house_id=${newhouse.house_id}">${newhouse.house_title}</a></h3>
                        <div class="hui">${newhouse.house_layout} | ${newhouse.house_area}m² | ${newhouse.house_decorate}</div>
                    </dd>
                </dl>
            </c:forEach>
            <div class="clears"></div>
        </div><!--index-fang-list/-->
        <%----%>

        <%--旧房推荐--%>
        <h2 class="title"><a style="color:#F1323B">❤</a>二手房推荐 <a href="/house/searchHouseViewByType.do?house_type=1&page=1&size=6">更多&gt;&gt;</a></h2>
        <div class="index-fang-list">
            <c:forEach items="${oldhouses}" var="oldhouse">
                <dl>
                    <dt><a href="/house/todetails.do?house_id=${oldhouse.house_id}"><img src="http://image.cxhit.com/${oldhouse.house_headimg}" width="286" height="188" /></a></dt>
                    <dd>
                        <h3><a href="/house/todetails.do?house_id=${oldhouse.house_id}">${oldhouse.house_title}</a></h3>
                        <div class="hui">${oldhouse.house_layout} | ${oldhouse.house_area}m² | ${oldhouse.house_decorate}</div>
                    </dd>
                </dl>
            </c:forEach>
            <div class="clears"></div>
        </div><!--index-fang-list/-->

        <%--【二手房推荐】--%>
        <h2 class="title"><a style="color:#F1323B">❤</a>租房推荐 <a href="/house/searchHouseViewByType.do?house_type=2&page=1&size=6">更多&gt;&gt;</a></h2>
        <div class="index-ershou">

            <%--左侧栏--%>
            <div class="in-er-left">
                <a href="#"><img src="images/fangt1.jpg" width="380" height="285" /></a>
                <div class="in-er-left-text"><strong class="fl">闵行南方发的撒的发的司法</strong><strong class="fr alignRight">¥2841</strong></div>
            </div><!--in-er-left/-->

            <%--右侧栏--%>
            <div class="in-er-right">
                <c:forEach var="renthouse" items="${renthouses}">
                    <dl>
                        <dt><a href="/house/todetails.do?house_id=${renthouse.house_id}"><img src="http://image.cxhit.com/${renthouse.house_headimg}" style="width: 150px; height: 115px;" width="150" height="115" /></a></dt>
                        <dd>
                            <h3><a href="/house/todetails.do?house_id=${renthouse.house_id}">${renthouse.house_title}</a></h3>
                            <br>
                            <div class="in-er-right-text">
                                    ${renthouse.house_address}
                            </div>
                            <div class="price">¥<strong>${renthouse.house_price}${renthouse.price_unit}</strong></div>
                        </dd>
                        <div class="clears"></div>

                    </dl>
                </c:forEach>
                <div class="clears"></div>

            </div><!--in-er-right/-->
            <div class="clears"></div>
        </div><!--index-ershou/-->
        <%--【二手房推荐END】--%>

    </div><!--width1190/-->
</div><!--content/-->

<!--这是页脚-->
<jsp:include page="pages/basefoot.jsp"></jsp:include>

</body>
</html>
