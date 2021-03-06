<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-01
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="js/jquery-2.1.1.min.js"></script>
    <%--<script src="js/register.js?v=1.0.0"></script>--%>
    <script>
        function getBasePath(){
            return '<%=basePath%>';
        }
    </script>
    <title>新用户注册</title>
</head>

<script type="text/javascript">

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
        $(".sub-btn").on("click", function(){
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

<form action="" method="post" name="form1">
    <table align="center">
        <tr>
            <td>手机号码：</td>
            <td><input type="text" id="phone" name="phone" placeholder="可用于登录和找回密码"></td>
        </tr>

        <tr>
            <td>登录密码：</td>
            <td><input type="password" name="password" id="password" placeholder="请设置登录密码！"></td>
        </tr>

        <tr>
            <td>确认密码：</td>
            <td><input type="password" name="password2" id="password2" placeholder="请再次输入确认密码！"></td>
        </tr>

        <tr>
            <td>手机验证：</td>
            <td><input type="text" name="verifyCode" id="verifyCode" placeholder="请输入手机验证码">
                <button type="button" class="sendVerifyCode" id="btn" name="btn" >获取短信验证码</button>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2" align="center"><button type="button" class="sub-btn">立即注册</button></td>
        </tr>
    </table>
</form>

<!--以下是模板
<form>
    <div>
        手机号: <input name="number">
    </div>
    <div>
        密码: <input name="password">
    </div>
    <div>
        验证码: <input name="verifyCode"><button type="button" class="sendVerifyCode">获取短信验证码</button>
    </div>
    <div><button type="button" class="sub-btn">提交</button></div>
</form>
-->

</body>
</html>
