<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-05
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

//    if(session.getAttribute("user_id")!=null){
//        response.sendRedirect("index.do");
//    }
%>

<html>
<head>
    <title>账号密码设置中心</title>
    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />

    <%--导入JS文件--%>
    <script src="../js/jquery-2.1.1.min.js"></script>
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

<div class="content">
    <div class="width1080">
        <%--左侧导航栏--%>
        <div class="vip-left">
            <div class="vipNav">
                <h3 class="vipTitle">账户中心</h3>
                <dl>
                    <dt class="vipIcon3">账户设置</dt>
                    <dd>
                        <a href="/user/personal.do">我的资料</a>
                        <a href="/user/verify.do">实名认证</a>
                        <a href="/user/psdSet.do" class="vipNavCur">账户密码设置</a>
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
            <h3 class="vipright-title">我的认证</h3>
            <br>
            <table class="grinfo">
                <tbody>
                <tr>
                    <th ><span class="red">*</span>原　密　码：</th>
                    <td width="600px">
                        <input class="inp inw" type="password" name="oldpassword" id="oldpassword" value="" placeholder="请输入原密码！">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <th><span class="red">*</span>新　密　码：</th>
                    <td>
                        <input class="inp inw" type="password" name="password" id="password" value="" placeholder="请输入新密码！">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <th><span class="red">*</span>确认新密码：</th>
                    <td>
                        <input class="inp inw" type="password" name="password2" id="password2" value="" placeholder="请再次输入新密码！">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <th>&nbsp;</th>
                    <td colspan="2">
                        <label class="butt" id="butt">
                            <input type="submit" class="member_mod_buttom" onclick="" value="确认修改" />
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
</div>

<script type="text/javascript">
    function getBasePath(){
        return '<%=basePath%>';
    }

    $(function(){
        //点击登录按钮
        $(".member_mod_buttom").on("click", function(){
            //获取几个基本信息
            var oldpassword = $("input[name=oldpassword]").val();
            var password=$("input[name=password]").val();
            //var password2=$("input[name=password2]").val();
            var password2=$("input[name=password2]").val();
            //校验信息
            if(oldpassword==""){
                alert("请输入原密码！");
                return;
            }
            else if(password==""){
                alert("请输入新密码！");
                return;
            }
            else if(password2 == ""){
                alert("请输入确认密码！");
                return;
            }
            else{
                $.ajax({
                    url: getBasePath()+"/user/psdchange.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    data:{oldpassword:oldpassword,password:password,password2:password2},
                    success: function (data) {
                        if(data.result == "0"){
                            alert("原密码错误！");
                            return ;
                        }
                        else if(data.result == "2"){
                            alert("新密码不一致！");
                            return;
                        }
                        else if(data.result == "1"){
                            alert("修改成功！");
                            location.href="/user/personal.do";
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
