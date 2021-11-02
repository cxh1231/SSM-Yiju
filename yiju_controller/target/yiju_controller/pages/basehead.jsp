<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-06
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>页头</title>
    <!--    下面是几个导入的包-->
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/js.js"></script>
</head>
<body>

<!--头部最上方的框-->
<div class="header">
    <div class="width1190">
        <div class="fl" style="font-size: 14px">您好，欢迎来到<a href="../index.jsp">易居住房信息平台！</a></div>
        <div class="fr">
            <% if(session.getAttribute("user_id")==null) {%>
            <a href="/user/loginpage.do" style="font-size: 14px" target="_blank"><strong>登录</strong></a> |
            <a href="/user/signpage.do" style="font-size: 14px" target="_blank"><strong>注册</strong></a>
            <% }else{%>
            <a  style="font-size: 14px">欢迎使用</a>　|
            <a href="/user/personal.do" style="font-size: 14px" target="_blank"><strong>个人中心</strong></a> |
            <a href="/user/logout.do" style="font-size: 14px"><strong>退出</strong></a> |
            <%
                }
            %>
            <a href="javascript:;" onclick="AddFavorite(window.location,document.title)" style="font-size: 14px">加入收藏</a> |
            <a href="javascript:;" onclick="SetHome(this,window.location)" style="font-size: 14px">设为首页</a>
        </div>
        <div class="clears"></div>
    </div><!--width1190/-->
</div>
<!--头部最上方的框-->

</body>
</html>
