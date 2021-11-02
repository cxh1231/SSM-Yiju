<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-05
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>指定购房页面</title>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <link type="text/css" href="../css/needstyle.css" rel="stylesheet" />
    <%--导入JS文件--%>
    <script src="../js/jquery-2.1.1.min.js"></script>

    <script>
        //定位到导航栏的某个标签eq(*) 其中*为第几个标签
        $(function(){
            //导航定位
            $(".nav li:eq(4)").addClass("navCur");
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

<div class="content">
    <div class="width1190">
        <p style="font-size: 16px">当前位置：<a href="../index.jsp">首页</a> ＞＞ <a href="/house/toRequestHouse.do?page=1&size=6">指定购房</a></p>
    </div>
</div>


<div class="bg-white">
    <div class="developer-toolbag-block">
        <div class="titleBar">
            <%--<h3 class="caption">购房需求页面</h3>--%>
            <p class="descript">这里可以看到其他用户发布的购房需求，点击我有房源可以联系用户。</p>
        </div>
        <div class="AGrid-row  tool-package">

            <c:forEach items="${needs.list}" var="need">
            <div class="col-sm-6 ">
                <div class="tile center-layer">
                    <div class="layer-figure">
                        <img src="../images/needhouse.png">
                    </div>
                    <h2 class="dev-list">${need.need_title}</h2>

                    <div class="layer-text">
                        <p class="dev-text">
                            ${need.need_details}
                        </p>
                        <div class="layer-btn">
                            <%-- FIXME 为实现功能 --%>
                            <a href="#">
                                <p>我有房源</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>

        </div>
        <%--分页按钮--%>
        <div class="titleBar">
            <ul class="pagination">
                <li ><a href="${pageContext.request.contextPath}/house/toRequestHouse.do?page=${needs.firstPage}&size=${needs.pageSize}" aria-label="Previous">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/house/toRequestHouse.do?page=${needs.pageNum - 1}&size=${needs.pageSize}">上一页</a></li>
                <c:forEach begin="1" end ="${needs.pages}" var="pageNum">
                    <li><a href="${pageContext.request.contextPath}/house/toRequestHouse.do?page=${pageNum}&size=${needs.pageSize}">${pageNum}</a></li>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/house/toRequestHouse.do?page=${needs.pageNum + 1}&size=${needs.pageSize}">下一页</a></li>
                <li><a href="${pageContext.request.contextPath}/house/toRequestHouse.do?page=${needs.lastPage}&size=${needs.pageSize}" aria-label="Next">尾页</a></li>
            </ul>
        </div><!--底部分页栏-->

        <%--分页按钮--%>
        <%--<div class="titleBar">--%>
            <%--<ul class="pagination">--%>
                <%--<li ><a href="#" aria-label="Previous">首页</a></li>--%>
                <%--<li><a href="#">上一页</a></li>--%>
                <%--&lt;%&ndash;<c:forEach begin="1" end ="${pageInfo.pages}" var="pageNum">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li><a href="${pageContext.request.contextPath}/house/searchHouseViewByType.do?house_type=1&page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                <%--<li><a href="">1</a></li>--%>
                <%--<li><a href="">2</a></li>--%>
                <%--<li><a href="#">下一页</a></li>--%>
                <%--<li><a href="#" aria-label="Next">尾页</a></li>--%>
            <%--</ul>--%>
        <%--</div><!--底部分页栏-->--%>

        <div align="center">
            <h3 style="font-size: 24px;">发布我的需求</h3>
            <br>
            <table align="center">
                <tr>
                    <td>
                        请输入需求标题：
                    </td>
                    <td>
                        <input type="text" id="title" name="title" style="font-size: 16px">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        请输入需求详情：
                    </td>
                    <td>
                        <textarea type="text" cols="5" id="details" name="details"></textarea>
                    </td>
                </tr>
            </table>

        </div>
        <button class="buy-now" href="#">发布需求</button>
    </div>
</div>

<%--JS代码，按理说最好放在最后--%>
<script type="text/javascript">

    function getBasePath(){
        return '<%=basePath%>';
    }


    $(function(){
        //点击发送验证码按钮
        $(".buy-now").on("click", function(){

            var title = $("input[name=title]").val();
            var details = $("textarea[name=details]").val();

            if(title == ""){
                alert("请输入需求标题！");
                return;
            }
            else if(details == ""){
                alert(("请输入需求详情信息！"));
                return;
            }
            else{
                $.ajax({
                    url: getBasePath()+"/user/postNeed.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    data: {title:title,details:details},
                    success:function(data) {
                        if(data.result == "1"){
                            alert("发布成功！");
                            window.location.reload();
                            return;
                        }else if(data.result == "0"){
                            alert("发布失败！");
                            return;
                        }
                        else if(data.result == "2"){
                            alert("请登录后再发布需求！")
                            return;
                        }
                        else{
                            alert("未知错误！")
                            return;
                        }
                    }
                });
            }
        })


    });

</script>



<iframe src="../pages/basefoot.jsp"frameborder="0" scrolling="no" height="263px" width="100%"></iframe>

</body>
</html>
