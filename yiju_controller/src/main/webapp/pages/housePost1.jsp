<%--
  Created by IntelliJ IDEA.
  User: 36353
  Date: 2019-07-06
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>发布房源信息</title>
    <!--    下面是几个导入的包-->
    <link type="text/css" href="../css/css.css" rel="stylesheet"/>
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet"/>
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/houseSend.css"/>
    <script type="text/javascript" src="../js/js.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script>
        <%--搜索栏的JavaScript--%>
        $(function () {
            $(".select_box").click(function (event) {
                event.stopPropagation();
                $(this).find(".option").toggle();
                $(this).parent().siblings().find(".option").hide();
            });
            $(document).click(function (event) {
                var eo = $(event.target);
                if ($(".select_box").is(":visible") && eo.attr("class") != "option" && !eo.parent(".option").length)
                    $('.option').hide();
            });
            $(".option li").click(function () {
                var check_value = $(this).text();
                var zlValue = $('.option li:eq(1)').html();
                var bqValue = $('.option li:eq(2)').html();
                $(this).parent().siblings(".select_txt").text(check_value);
                $("#select_value").val(check_value);
                if (check_value == zlValue) {
                    $('#searchPlaceholder').prop('placeholder', '请输入旧房搜索信息');
                } else if (check_value == bqValue) {
                    $('#searchPlaceholder').prop('placeholder', '请输入租房搜索信息');
                } else {
                    $('#searchPlaceholder').prop('placeholder', '请输入新房搜索信息');
                }
            });
        })
        //定位到导航栏的某个标签eq(*) 其中*为第几个标签
        $(function () {
            //导航定位
            $(".nav li:eq(5)").addClass("navCur");
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
                    <h1 class="logo"><a href="../index.jsp"><img src="../images/logo.png" width="163" height="59"/></a>
                    </h1>
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

<%--信息填写栏--%>
<div class="width1190">

    <br/>
    <h4 style="font-size:16px; text-align:center; font-weight:bold;">房源基本信息填写</h4>
    <br/>
    <!--中心-->
    <div class="content">
        <div class="register-box">
            <div class="wrap">
                <div class="register-box-con2">
                    <form action="<%=request.getContextPath()%>/house/toHousePost2.do" method="post" enctype="multipart/form-data">
                        <!--房源标题-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left"><em class="bitian">* </em>房源标题</label>
                            <div class="register-box-con2-box-right">
                                <input type="text" name="house_title" class="login-box-cen-form-input w358"
                                       placeholder="请输入您的房源帖子标题" id="reg_info_company"/>
                                <!--                        	<label id="reg_info_company_text"  class="err err-top40">请输入与工商营业执照一致的公司名称，不超过20个字</label>-->
                            </div>
                        </div>

                        <!--房源地址-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left"><em class="bitian">* </em>房源地址</label>
                            <div class="register-box-con2-box-right">
                                <input type="text" name="house_address" class="login-box-cen-form-input w358"
                                       placeholder="请输入您的房源详细地址" id="reg_info_www"/>
                                <!--                        	<label class="err err-top40" id="reg_info_www_text">请输入正确的网址</label>-->
                            </div>
                        </div>

                        <!--预期售价-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left"><em class="bitian">* </em>期望售价</label>
                            <div class="register-box-con2-box-right">
                                <input type="text" name="house_price" class="login-box-cen-form-input w180"
                                       placeholder="请输入期望售价" id="reg_info_address"/>
                                <!--                        	<label class="err err-top40" id="reg_info_address_text">公司所在地址，不超过40个字</label>-->
                                <div id="parent">
                                    <select name="price_unit">
                                        <option>元/套</option>
                                        <option>元/月</option>
                                        <option>元/年</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!--FIXME  房源头像图-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left"><em class="bitian"></em>房源头像图</label>
                            <div class="register-box-con2-box-right">
                                <label class="register-box-con2-box-upload">
                                    <input type="file" name="house_headimg" id="headimg"/>
                                    <div class="register-box-con2-box-upload-ti">
                                        <em id="headimg_w">点击上传</em>
                                        <img id="headimg_base64" style="display:none;"/>
                                    </div>
                                </label>
                                <label class="err err-top160" id="headimg_text">支持图片格式JPG/PNG，图片大小不超过2M</label>
                            </div>
                        </div>

                        <!--FIXME 房源平面图-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left">
                                <em class="bitian">
                                </em>房源平面图</label>
                            <div class="register-box-con2-box-right">
                                <!--第一张图片-->
                                <label class="register-box-con2-box-upload1">
                                    <input type="file" name="house_planimg1" id="planimg1"/>
                                    <div class="register-box-con2-box-upload-ti1">
                                        <em id="planimg1_w">上传</em>
                                        <img id="planimg1_base64" style="display:none;"/></div>
                                </label>
                                <!--第二张图片-->
                                <label class="register-box-con2-box-upload1" style=" margin-left: 10px;">
                                    <input type="file" name="house_planimg2" id="planimg2"/>
                                    <div class="register-box-con2-box-upload-ti1">
                                        <em id="planimg2_w">上传</em>
                                        <img id="planimg2_base64" style="display:none;"/></div>
                                </label>
                                <label class="err err-top160" id="planimg1_text">支持图片格式JPG/PNG，图片大小不超过2M</label>
                            </div>
                        </div>

                        <!--FIXME 房源室内图-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left">
                                <em class="bitian"></em>房源室内图
                            </label>
                            <div class="register-box-con2-box-right">
                                <!--第一张图片-->
                                <label class="register-box-con2-box-upload2">
                                    <input type="file" name="house_img1" id="inter1"/>
                                    <div class="register-box-con2-box-upload-ti2"><em id="inter1_w">上传</em><img
                                            id="inter1_base64" style="display:none;"/></div>
                                </label>
                                <!--第二章图片-->
                                <label class="register-box-con2-box-upload2" style=" margin-left: 10px;">
                                    <input type="file" name="house_img2" id="inter2"/>
                                    <div class="register-box-con2-box-upload-ti2"><em id="inter2_w">上传</em><img
                                            id="inter2_base64" style="display:none;"/></div>
                                </label>
                                <!--第三张图片-->
                                <label class="register-box-con2-box-upload2" style=" margin-left: 10px;">
                                    <input type="file" name="house_img3" id="inter3"/>
                                    <div class="register-box-con2-box-upload-ti2"><em id="inter3_w">上传</em><img
                                            id="inter3_base64" style="display:none;"/></div>
                                </label>
                                <label class="err err-top160" id="inter2_text">支持图片格式JPG/PNG，图片大小不超过2M</label>
                            </div>
                        </div>
                        <!--第二行图片-->
                        <div class="register-box-con2-box clearfix mar-bottom20">
                            <label class="register-box-con2-box-left"><em class="bitian"></em></label>
                            <div class="register-box-con2-box-right">
                                <!--第四张图片-->
                                <label class="register-box-con2-box-upload2">
                                    <input type="file" name="house_img4" id="inter4"/>
                                    <div class="register-box-con2-box-upload-ti2"><em id="inter4_w">上传</em><img
                                            id="inter4_base64" style="display:none;"/></div>
                                </label>
                                <!--第五张图片-->
                                <label class="register-box-con2-box-upload2" style=" margin-left: 10px;">
                                    <input type="file" name="house_img5" id="inter5"/>
                                    <div class="register-box-con2-box-upload-ti2">
                                        <em id="inter5_w">上传</em>
                                        <img id="inter5_base64" style="display:none;"/>
                                    </div>
                                </label>
                                <!--第六章图片-->
                                <label class="register-box-con2-box-upload2" style=" margin-left: 10px;">
                                    <input type="file" name="house_img6" id="inter6"/>
                                    <div class="register-box-con2-box-upload-ti2">
                                        <em id="inter6_w">上传</em>
                                        <img id="inter6_base64" style="display:none;"/></div>
                                </label>
                                <label class="err err-top160" id="inter3_text">支持图片格式JPG/PNG，图片大小不超过2M</label>
                            </div>
                        </div>
                        <!--End 房源室内图-->
                        <div class="register-box-con2-box clearfix mar-bottom20 mar-top50">
                            <label class="register-box-con2-box-left"></label>
                            <div class="register-box-con2-box-right">
                                <input type="submit" value="下一步" class="login-box-cen-form-button" style="width: 360px"
                                       id="reg_info_submit"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br/><br/>
</div>

<script type="text/javascript" src="../js/jqueryhouse.min.js"></script>
<script type="text/javascript" src="../js/tbdValidate.js"></script>
<script type="text/javascript" src="../js/upload.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
    function getBasePath() {
        return '<%=basePath%>';
    }

    //图片预览路径
    function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

    $(function () {
        // //点击下一步
        // $(".login-box-cen-form-button").on("click", function () {
        //     //获取几个基本信息
        //     var house_title = $("input[name=house_title]").val();
        //     var house_address = $("input[name=house_address]").val();
        //     var house_price = $("input[name=house_price]").val();
        //     var house_headimg = $("input[name=house_headimg]").val();
        //     var house_planimg1 = $("input[name=house_planimg1]").val();
        //     var house_planimg2 = $("input[name=house_planimg2]").val();
        //     var house_img1 = $("input[name=house_img1]").val();
        //     var house_img2 = $("input[name=house_img2]").val();
        //     var house_img3 = $("input[name=house_img3]").val();
        //     var house_img4 = $("input[name=house_img4]").val();
        //     var house_img5 = $("input[name=house_img5]").val();
        //     var house_img6 = $("input[name=house_img6]").val();
        //     //校验信息
        //     if (house_title == "") {
        //         alert("请输入房源帖子标题！");
        //         return;
        //     }
        //     else if (house_address == "") {
        //         alert("请输入房源地址！");
        //         return;
        //     }
        //     else if (house_price == "") {
        //         alert("请输入预售价格！");
        //         return;
        //     }
        //     else {
        //         $.ajax({
        //             url: getBasePath() + "/house/toHousePost2.do",
        //             async: true,
        //             type: "post",
        //             dataType: "json",
        //             data: {
        //                 house_title: house_title,
        //                 house_address: house_address,
        //                 house_price: house_price,
        //                 house_headimg: house_headimg,
        //                 house_planimg1: house_planimg1,
        //                 house_planimg2: house_planimg2,
        //                 house_img1: house_img1,
        //                 house_img2: house_img2,
        //                 house_img3: house_img3,
        //                 house_img4: house_img4,
        //                 house_img5: house_img5,
        //                 house_img6: house_img6,
        //             },
        //             success: function (data) {
        //             }
        //         });
        //     }
        // })
    });
</script>

<!--这是页脚-->
<jsp:include page="../pages/basefoot.jsp"></jsp:include>


<br>
</body>
</html>
