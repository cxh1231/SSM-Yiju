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
%>

<html>
<head>
    <title>欢迎注册 — 易居住房交易平台</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <link type="text/css" href="../css/buttonStyle.css" rel="stylesheet" />

    <%--导入JS文件--%>
    <script src="../js/jquery-2.1.1.min.js"></script>
    <%--<script src="js/signup.js"></script>--%>
</head>

<%--JS代码，按理说最好放在最后--%>
<script type="text/javascript">

    function getBasePath(){
        return '<%=basePath%>';
    }
    var wait = 60;
    //点击按钮实现倒计时
    /*
    document.getElementById("btn").onclick = function() {
        time(this);
    }*/
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.innerHTML = "免费获取验证码";
            wait = 60;
        } else {
            o.setAttribute("disabled", true);
            o.innerHTML = wait + "秒后可以重新发送";
            wait--;
            setTimeout(function() {
                time(o)
            }, 1000)
        }
    }

    $(function(){
        //点击发送验证码按钮
        $(".sendVerifyCode").on("click", function(){

            //获取输入框的手机号码
            var phone = $("input[name=phone]").val();
            //手机号的正则表达式
            var phoneReg=/^[1][3,4,5,7,8,9][0-9]{9}$/;
            //手机号为空
            if(phone == ""){
                alert("请输入手机号！");
                return;
            }
            //手机号不符合规则
            else if(!phoneReg.test(phone)){
                alert(("输入手机号有误，请核实并重新填写！"));
                return;
            }
            //手机号正确，发送验证码
            else{
                $.ajax({
                    url: getBasePath()+"/user/sendVCode.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    data: {phone:phone},

                    success:function(data) {
                        //alert(data.result)
                        //return;

                        if(data.result == "1"){
                            alert("发送验证码成功！");
                            time(document.getElementById("btn"));
                            return;
                        }else if(data.result == "0"){
                            alert("发送验证码失败！");
                            return;
                        }
                        else if(data.result == "2"){
                            alert("该手机号已注册，请进行登录！")
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

        //点击提交注册按钮
        $(".submit").on("click", function(){
            //获取几个基本信息
            var phone = $("input[name=phone]").val();
            var password=$("input[name=password]").val();
            var password2=$("input[name=password2]").val();
            var verifyCode=$("input[name=verifyCode]").val();
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
            else if(password != password2){
                alert("两次密码输入不一致！"+password+password2);
                return;
            }
            else if(verifyCode == ""){
                alert("请输入验证码！");
                return;
            }
            else{
                //alert("提交手机号："+phone+"提交密码"+password+"验证码："+verifyCode)
                //var data = {};
                //data.phone = $.trim(phone);
                //data.password = $.trim(password);
                //data.verifyCode = $.trim(verifyCode);
                $.ajax({
                    url: getBasePath()+"/user/signup.do",
                    async : true,
                    type: "post",
                    dataType: "json",
                    //contentType: "application/json; charset=utf-8",
                    //data:JSON.stringify(data),
                    data:{phone:phone,password:password,verifyCode:verifyCode},
                    //data:{"phone":phone},
                    //data:JSON.stringify(data),
                    //data:"phone"+password+"&password"+password+"&verifyCode"+verifyCode,
                    success: function (data) {
                        if(data.result == "0"){
                            alert("验证码错误！");
                            return ;
                        }
                        else if(data.result == "2"){
                            alert("验证码已过期，请重新获取！");
                            return;
                        }
                        else if(data.result == "3"){
                            alert("该手机号已注册，请进行登录！")
                            return;
                        }
                        else if(data.result == "1"){
                            alert("注册成功");
                            location.href="loginpage.do";
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
                            <input id="phone" name="phone" type="text" class="required" value placeholder="该手机号将用来登录和找回密码" />
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td>
                            <label class="one"  for="password">登录密码：</label>
                        </td>
                        <td colspan="2">
                            <input id="password" name="password" type="password" class="{required:true,rangelength:[8,20],}" value placeholder="请输入密码" />
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td>
                            <label class="one" for="password2">确认密码：</label>
                        </td>
                        <td colspan="2">
                            <input id="password2" name="password2" type="password" class="{required:true,equalTo:'#password'}" value placeholder="请再次输入密码" />
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
                            <a>　</a><button type="button" class="sendVerifyCode" id="btn" name="btn" style="width: 180px;height: 45px">点击获取验证码</button><a>　</a>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td colspan="3" align="center">
                            注册即同意<a  href="#">《用户使用协议》</a>&amp;<a href="#">《隐私权条款》</a>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td colspan="3">
                            <input class="submit" type="button" value="立即注册"/>
                            <%--<input class="sub-btn" type="button" value="立即注册"/>--%>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="reg-logo-right">
                <h3>如果您已有账号，请</h3>
                <%--FIXME 这里修改为【登录页面】--%>
                <a href="/user/loginpage.do" class="logo-a" target="_self">立即登录</a>
            </div><!--reg-logo-right/-->
            <div class="clears"></div>
        </div><!--reg-logo/-->
    </div><!--width1190/-->
</div><!--content/-->

<jsp:include page="basefoot.jsp"></jsp:include>
</body>
</html>
