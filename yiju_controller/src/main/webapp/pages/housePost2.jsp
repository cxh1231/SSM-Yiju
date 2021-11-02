<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>发布房源信息</title>
    <!--    下面是几个导入的包-->
    <link type="text/css" href="../css/css.css" rel="stylesheet" />
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet" />
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/houseSend.css" />
    <script type="text/javascript" src="../js/js.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
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
                    <h1 class="logo"><a href="../index.jsp"><img src="../images/logo.png" width="163" height="59"/></a></h1>
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
    <h4 style="font-size:16px; text-align:center; font-weight:bold;">房源详细信息填写</h4>
    <br/>

    <!--中心-->
    <div class="content">
        <div class="register-box">
            <div class="wrap">
                <div class="register-box-con2">

                    <!--房源性质-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源性质</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_nature" placeholder="如：商品房、住宅房等" id="house_natuer"/>
                        </div>
                    </div>

                    <!--房源类型-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源类型</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_model" placeholder="如：普通住宅、公寓式住宅、别墅等" id="house_model"/>
                        </div>
                    </div>

                    <!--房源建造年-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源建造年</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_year" placeholder="如：2008、2019等" id="house_year"/>
                        </div>
                    </div>

                    <!--房源期限-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源期限</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_valid" placeholder="如：70年、80年、永久等" id="house_valid"/>
                        </div>
                    </div>

                    <!--房源户型-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源户型</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_layout" placeholder="如：2厅4室2卫等" id="house_layout"/>
                        </div>
                    </div>

                    <!--房源面积-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源面积</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_area" placeholder="如：100、85等。单位：m²" id="house_narea"/>
                        </div>
                    </div>

                    <!--房源朝向-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源朝向</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_turn" placeholder="如：南北、西南等" id="house_turn"/>
                        </div>
                    </div>

                    <!--房源楼层-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>房源楼层</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_floor" placeholder="如：6、8、9等" id="house_floor"/>
                        </div>
                    </div>

                    <!--总楼层-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>总楼层</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="floor_all" placeholder="如：7、13、16等" id="floor_all"/>
                        </div>
                    </div>

                    <!--装修类型-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>装修类型</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_decorate" placeholder="如：精装修、简装修等" id="house_decorate"/>
                        </div>
                    </div>

                    <!--是否有电梯-->
                    <div class="register-box-con2-box clearfix mar-bottom20">
                        <label class="register-box-con2-box-left"><em class="bitian">* </em>是否有电梯</label>
                        <div class="register-box-con2-box-right">
                            <input type="text" class="login-box-cen-form-input w358" name="house_lift" placeholder="如：是、否等" id="house_lift"/>
                        </div>
                    </div>
                    <%--下一步按钮--%>
                    <div class="register-box-con2-box clearfix mar-bottom20 mar-top50" align="center">
                        <label class="register-box-con2-box-left"></label>
                        <div class="register-box-con2-box-right" align="center">
                            <input type="button" value="下一步" class="login-box-cen-form-button w180" id="next_submit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../js/jqueryhouse.min.js"></script>
<script type="text/javascript" src="../js/tbdValidate.js"></script>
<script type="text/javascript" src="../js/upload.js"></script>
<script src="../js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
    function getBasePath() {
        return '<%=basePath%>';
    }

    $(function () {
        //点击下一步
        $("#next_submit").on("click", function () {
            //获取几个基本信息
            var house_nature = $("input[name=house_nature]").val();
            var house_model = $("input[name=house_model]").val();
            var house_year = $("input[name=house_year]").val();
            var house_valid = $("input[name=house_valid]").val();
            var house_layout = $("input[name=house_layout]").val();
            var house_area = $("input[name=house_area]").val();
            var house_turn = $("input[name=house_turn]").val();
            var house_floor = $("input[name=house_floor]").val();
            var floor_all = $("input[name=floor_all]").val();
            var house_decorate = $("input[name=house_decorate]").val();
            var house_lift;
            if($("input[name=house_lift]").val()=="是") {
                house_lift = 1;
            } else {
                house_lift = 0;
            }
            //校验信息
            if (house_nature == "") {
                alert("请输入房源性质！");
                return;
            }
            else if (house_model == "") {
                alert("请输入房源类型！");
                return;
            }
            else if (house_year == "") {
                alert("请输入建造时间！");
                return;
            }
            else if (house_valid == "") {
                alert("请输入房源期限！");
                return;
            }
            else if (house_layout == "") {
                alert("请输入房源户型！");
                return;
            }
            else if (house_area == "") {
                alert("请输入房源面积！");
                return;
            }
            else if (house_turn == "") {
                alert("请输入朝向！");
                return;
            }
            else if (house_floor == "") {
                alert("请输入楼层！");
                return;
            }
            else if (floor_all == "") {
                alert("请输入预售价格!");
                return;
            }
            else if (house_decorate == "") {
                alert("请输入装饰类型!");
                return;
            }
            else if (house_lift == "") {
                alert("请说明有无电梯!");
                return;
            }
            else {
                $.ajax({
                    url: getBasePath() + "/house/responsePost2.do",
                    async: true,
                    type: "post",
                    dataType: "json",
                    data: {
                        house_nature:house_nature,
                        house_model:house_model,
                        house_year :house_year,
                        house_valid :house_valid,
                        house_layout :house_layout,
                        house_area:house_area,
                        house_turn :house_turn,
                        house_floor :house_floor,
                        floor_all :floor_all,
                        house_decorate :house_decorate,
                        house_lift:house_lift
                    },
                    success: function (data) {
                        // alert(1);
                        window.location.href="/house/toHousePost3.do"; //需要跳转的地址
                    }
                });
            }
        })
    });
    $("#back_submit").on("click", function () {
        $.ajax({
            url: getBasePath() + "/house/backToHousePost1",
            async: true,
            type: "post",
            dataType: "json",
            success: function (data) {
                alert(1);
                window.location.href="/house/toHousePost3.do"; //需要跳转的地址
            }
        });
    })

</script>
<!--这是页脚-->
<jsp:include page="../pages/basefoot.jsp"></jsp:include>
</body>
</html>
