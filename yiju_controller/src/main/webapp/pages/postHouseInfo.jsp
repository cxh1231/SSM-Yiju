<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>易居房源信息发布</title>

    <%--导入CSS文件--%>
    <link type="text/css" href="../css/css.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel='stylesheet prefetch' href='../css/reset.css'>
    <link rel="stylesheet" type="text/css" href="../css/default.css">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <%--导航栏的JS--%>
    <script type="text/javascript" src="../js/js.js"></script>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <%--搜索框的css--%>
    <link type="text/css" href="../css/searchInputStyle.css" rel="stylesheet"/>
    <link type="text/css" href="../css/searchReset.css" rel="stylesheet"/>
    <script type="text/javascript" src="../js/jquery2.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="../js/jquery-2.1.1.min.js"></script>
    <%--<script src="../js/bootstrap.min.js"></script>--%>
    <script src="../js/popper1.12.5.min.js"></script>
    <link rel="stylesheet" href="../css/fileinput.css">
    <script src="../js/fileinput.min.js"></script>

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
            $(".nav li:eq(1)").addClass("navCur");
        })
    </script>

</head>


<body>

<!--头部最上方的框-->
<jsp:include page="basehead.jsp"></jsp:include>
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
                        <form action="">
                            <input type="hidden" name="" value="服装" id="select_value">
                            <input type="text" name="" id="searchPlaceholder" class="import" placeholder="请输入新房搜索信息">
                            <input type="submit" value="搜   索" class="btn-search">
                        </form>
                    </div>
                </td>
                <td align="center">
                    <div class="phones"><strong>027-123456789</strong></div>
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
            <li class="zhiding"><a href="javascript:;">指定购房</a></li>
            <li><a href="#">发布房源</a></li>
            <li><a href="#">公告中心</a></li>
            <li><a href="#">关于我们</a></li>
            <div class="clears"></div>
        </ul><!--nav-->
        <div class="clears"></div>
    </div><!--width1190-->
</div><!--list-nav-->
<!--导航栏End-->

<div style=" background: url(../images/gs.png) repeat;height: 200px">
    <header class="htmleaf-header">
        <h1>易居房源信息发布
            <span>请填写您要发布的房源信息</span>
        </h1>
    </header>

    <article class="htmleaf-content">
        <!-- multistep form -->
        <form id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">
                    <div style="color: white"> 房源基本信息</div>
                </li>
                <li>
                    <div style="color: white">房源详细信息</div>
                </li>
                <li>
                    <div style="color: white">房源内饰信息</div>
                </li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">填写房源基本信息</h2>
                <h3 class="fs-subtitle">房源基本信息</h3>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="text" name="house_title" id="house_title" placeholder="房源描述(名称)">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">
                            <input type="text" name="house_type" id="house_type" placeholder="房源类型"/>
                        </div>
                        <div class="col-md-3">
                            <select name="price_unit">
                                <option>新房</option>
                                <option>旧房</option>
                                <option>租房</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <input type="text" name="house_address" placeholder="房源地址">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">
                            <input type="text" name="house_price" id="house_price" placeholder="房源预计售价"/>
                        </div>
                        <div class="col-md-3">
                            <select name="price_unit">
                                <option id="yuanPerMonth">元/每月</option>
                                <option id="yuanPerSet">元/每套</option>
                                <option id="yuanPerYear">元/每年</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            <span class="label label-default">请上传房源内视图:</span>
                        </div>
                        <div class="col-md-12">
                            <br>
                            <!--<input id="debugId" name="debugId" hidden="true" /> &lt;!&ndash; 文件上传额外参数 &ndash;&gt;-->
                            <input id="fileInput" name="files" multiple type="file" class="file" value=""/>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <input type="button" name="next" class="next action-button" value="下一步"/>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">填写房源详细信息</h2>
                <h3 class="fs-subtitle">房源详细信息</h3>
                <!--房源性质:商品房 住宅房-->
                <span class="label label-default">房源性质</span>
                <select>
                    <option>商品房</option>
                    <option>住宅房</option>
                </select>
                <!--普通式住宅 公寓式住宅 别墅 独栋-->
                <span class="label label-default">房源类型</span>
                <select>
                    <option>公寓式住宅</option>
                    <option>别墅</option>
                    <option>独栋</option>
                </select>
                <!--房源建造时间-->
                <span class="label label-default">房屋建造时间:</span>
                <input type="text" name="" placeholder="房屋建造时间">
                <span class="label label-default">房屋有效期:</span>
                <select>
                    <option>70年</option>
                    <option>100年</option>
                    <option>永久</option>
                </select>
                <span class="label label-default">房源户型(几室几厅几卫):</span>
                <input type="text" name="" placeholder="房屋户型">
                <span class="label label-default">房源面积:</span>
                <input type="text" name="" placeholder="房屋面积">
                <span class="label label-default">朝向:</span>
                <input type="text" name="" placeholder="朝向">
                <span class="label label-default">楼层:</span>
                <input type="text" name="" placeholder="楼层">
                <span class="label label-default">总楼层:</span>
                <input type="text" name="" placeholder="总楼层">
                <span class="label label-default">装饰类型:</span>
                <select>
                    <option>简装</option>
                    <option>精装</option>
                </select>
                <span class="label label-default">电梯:</span>
                <select>
                    <option>有</option>
                    <option>无</option>
                </select>
                <input type="button" name="previous" class="previous action-button" value="返回上一步"/>
                <input type="button" name="next" class="next action-button" value="下一步"/>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">填写房源内饰信息</h2>
                <h3 class="fs-subtitle">房源内饰信息</h3>
                <div class="row">
                    <div class="col-md-3">
                        <h5>床</h5><img style="width: 100px;" src="../images/bed.png"><input type="checkbox"
                                                                                            name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>洗衣机</h5><img style="width: 100px;" src="../images/washer.png"><input type="checkbox"
                                                                                                 name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>空调</h5><img style="width: 100px;" src="../images/ac.png"><input type="checkbox"
                                                                                            name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>阳台</h5><img style="width: 100px;" src="../images/sunplat.png"><input type="checkbox"
                                                                                                 name="interCheck">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <h5>冰箱</h5><img style="width: 100px;" src="../images/refrigerator.png"><input type="checkbox"
                                                                                                      name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>卫生间</h5><img style="width: 100px;" src="../images/wc.png"><input type="checkbox"
                                                                                             name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>厨房</h5><img style="width: 100px;" src="../images/kitchen.png"><input type="checkbox"
                                                                                                 name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>电视</h5><img style="width: 100px;" src="../images/tv.png"><input type="checkbox"
                                                                                            name="interCheck">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <h5>热水器</h5><img style="width: 100px;" src="../images/water.png"><input type="checkbox"
                                                                                                name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>衣柜</h5><img style="width: 100px;" src="../images/wardrobe.png"><input type="checkbox"
                                                                                                  name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>暖气</h5><img style="width: 100px;" src="../images/warm.png"><input type="checkbox"
                                                                                              name="interCheck">
                    </div>
                    <div class="col-md-3">
                        <h5>宽带</h5><img style="width: 100px;" src="../images/wifi.png"><input type="checkbox"
                                                                                              name="interCheck">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h5>沙发</h5><img style="width: 100px;" src="../images/sofa.png"><input type="checkbox"
                                                                                              name="interCheck">
                    </div>
                </div>
                <input type="button" name="previous" class="previous action-button" value="返回上一步"/>
                <input type="submit" name="submit" class="submit action-button" value="提交"/>
            </fieldset>
        </form>
    </article>

    <script src="../js/jquery.easing.min.js" type="text/javascript"></script>
    <script>
        var current_fs, next_fs, previous_fs;
        var left, opacity, scale;
        var animating;
        $('.next').click(function () {
            if (animating)
                return false;
            animating = true;
            current_fs = $(this).parent();
            next_fs = $(this).parent().next();
            $('#progressbar li').eq($('fieldset').index(next_fs)).addClass('active');
            next_fs.show();
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    scale = 1 - (1 - now) * 0.2;
                    left = now * 50 + '%';
                    opacity = 1 - now;
                    current_fs.css({'transform': 'scale(' + scale + ')'});
                    next_fs.css({
                        'left': left,
                        'opacity': opacity
                    });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                easing: 'easeInOutBack'
            });
        });
        $('.previous').click(function () {
            if (animating)
                return false;
            animating = true;
            current_fs = $(this).parent();
            previous_fs = $(this).parent().prev();
            $('#progressbar li').eq($('fieldset').index(current_fs)).removeClass('active');
            previous_fs.show();
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    scale = 0.8 + (1 - now) * 0.2;
                    left = (1 - now) * 50 + '%';
                    opacity = 1 - now;
                    current_fs.css({'left': left});
                    previous_fs.css({
                        'transform': 'scale(' + scale + ')',
                        'opacity': opacity
                    });
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                easing: 'easeInOutBack'
            });
        });
        $('.submit').click(function () {
            return false;
        });
        $('#testfile').fileinput({
            language: 'zh',
            uploadUrl: location.pathname + 'upload/',
            showCaption: true,
            showUpload: true,
            showRemove: true,
            showClose: true,
            layoutTemplates: {
                actionDelete: ''
            },
            browseClass: 'btn btn-primary'
        });
    </script>
</div>
</body>
</html>