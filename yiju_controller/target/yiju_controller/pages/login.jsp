<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-03
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

    if(session.getAttribute("user_id")!=null){
        response.sendRedirect("index.do");
    }
%>

<html>
<head>
    <title>欢迎登录 — 易居住房交易平台</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <%--<link type="text/css" href="css/buttonStyle.css" rel="stylesheet" />--%>

    <%--导入JS文件--%>
    <script src="../js/jquery-2.1.1.min.js"></script>
    <script src="../js/wer.js"></script>
    <%--<script src="js/signup.js"></script>--%>
</head>


<body>

<%--加入头部--%>
<jsp:include page="basehead.jsp"></jsp:include>

<!--Logo栏和手机号栏-->
<div class="logo-phone">
    <div class="width1190">

        <table align="center" width="100%">
            <tr>
                <td>
                    <h1 class="logo"><a href="../index.jsp"><img src="../images/logo.png" width="163" height="59" /></a></h1>
                </td>

                <td align="center">
                    <div class="phones"><strong>000-0000000</strong></div>
                    <div class="clears"></div>
                </td>

            </tr>
        </table>
    </div><!--width1190/-->
</div><!--logo-phone/-->
<!--Logo栏和手机号栏-->

<hr width="1280px">

<!--注册-->
<div class="content">
    <div class="width1190">
        <div class="reg-logo">

            <form  method="post" action="" class="zcform">
                <table align="center" cellpadding="100px" cellspacing="10px">
                    <tr>
                        <td align="right">
                            <label class="one" for="phone">手机号码：</label>
                        </td>
                        <td colspan="2">
                            <input id="phone" name="phone" type="text" class="required" value placeholder="请输入您的手机号" />
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td>
                            <label class="one"  for="password">登录密码：</label>
                        </td>
                        <td colspan="2">
                            <input id="password" name="password" type="password" class="{required:true,rangelength:[8,20],}" value placeholder="请输入登录密码" />
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td>
                            <label class="one"  for="verifyCode">验证码：</label>
                        </td>
                        <td>
                            <input id="verifyCode" name="verifyCode" type="text" class="required" value placeholder="请输入验证码" />
                        </td>
                        <td>
                            <div id="v_container" style="width: 180px;height: 45px;"></div>
                            <%--<a>　</a><button type="button" class="sendVerifyCode" id="btn" name="btn" style="width: 180px;height: 45px">点击获取验证码</button><a>　</a>--%>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td colspan="3">
                            <input class="submit" type="button" value="立即登录"/>
                            <%--<input class="sub-btn" type="button" value="立即注册"/>--%>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="reg-logo-right">
                <h3>如果您没有账号，请</h3>
                <%--FIXME 这里跳转至【注册页面】--%>
                <a href="/user/signpage.do" class="logo-a" target="_self">立即注册</a>

                <br>

                <h3>忘记密码？ 请</h3>
                <%--FIXME 这里跳转至【找回密码页面】--%>
                <a href="#" class="logo-a" target="_self">找回密码</a>

            </div><!--reg-logo-right/-->
            <div class="clears"></div>
        </div><!--reg-logo/-->
    </div><!--width1190/-->
</div><!--content/-->

<%--加入页脚--%>
<jsp:include page="basefoot.jsp"></jsp:include>

</body>

<script type="text/javascript">
    function getBasePath(){
        return '<%=basePath%>';
    }
    var verifyCode = new GVerify("v_container");
    //
    // document.getElementById("verifyCode").onclick = function(){
    //     var res = verifyCode.validate(document.getElementById("verifyCode").value);
    //     if(res){
    //         alert("验证正确");
    //     }else{
    //         alert("验证码错误");
    //     }
    // }

    $(function(){
         //点击登录按钮
        $(".submit").on("click", function(){
            //获取几个基本信息
            var phone = $("input[name=phone]").val();
            var password=$("input[name=password]").val();
            //var password2=$("input[name=password2]").val();
            var vCode=$("input[name=verifyCode]").val();
            //校验信息
            if(phone==""){
                alert("请输入手机号！");
                return;
            }
            else if(password==""){
                alert("请输入登录密码！");
                return;
            }
            //………………
            // else if(password != password2){
            //     alert("两次密码输入不一致！"+password+password2);
            //     return;
            // }
            else if(vCode == ""){
                alert("请输入验证码！");
                return;
            }
            else if(!verifyCode.validate(document.getElementById("verifyCode").value)){
                alert("验证码错误")
                return;
            }
            else{
                $.ajax({
                    url: getBasePath()+"/user/login.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    //contentType: "application/json; charset=utf-8",
                    //data:JSON.stringify(data),
                    data:{phone:phone,password:password},
                    //data:{"phone":phone},
                    //data:JSON.stringify(data),
                    //data:"phone"+password+"&password"+password+"&verifyCode"+verifyCode,
                    success: function (data) {
                        if(data.result == "0"){
                            alert("登录密码错误！");
                            return ;
                        }
                        else if(data.result == "2"){
                            alert("该手机号未注册账号，请前往注册！");
                            return;
                        }
                        else if(data.result == "1"){
                            alert("登录成功");
                            location.href="../index.jsp";
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

</html>
