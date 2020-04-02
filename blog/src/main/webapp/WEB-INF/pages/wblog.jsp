<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>博客管理</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/wangEditor/dist/css/wangEditor.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/wangEditor/static/highlightjs/dark.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .top-div {
            width: 100%;
            height: 80px;
            background-color: #4bc0c8;
        }

        h2 {
            line-height: 80px;
            margin: 0;
            color: #e0e2e5;
        }

        h2:hover {
            color: white;
        }

        .left-div {
            width: 152px;
            background-color: dimgrey;
            float: left;
            position: absolute;
            height: 100%;
        }

        .left-div ul {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        .left-div li {
            height: 50px;
            margin-top: 20px;
            line-height: 50px;
            text-indent: 1em;
            ursor: default
        }

        .left-div li:hover {
            background: #1f051a;
            color: white;
        }

        .right-div {
            position: absolute;
            width: 90%;
            right: 0px;
        }

        .form-div {
            margin-top: 20px;
        }

        .form-div span {
            font-size: 18px;
            font-family: "Arial Black", arial-black;
            float: left;
            display: block;
            margin-left: 30px;
            margin-bottom: 10px;
            margin-right: 20px;
            margin-top: 5px;
        }

        .form-div input {
            width: 80%;
            height: 30px;
        }


        .form-div-s {
            line-height: 400px;
        }

        .form-div-sub {
            width: 100px;
            margin-top: 20px;
            margin-left: 120px;
        }

        .user {
            font-size: 20px;
            text-align: center;
            color: #b8b9b2;
            list-style: none;
        }

        .dv {
            margin-left: 120px;
            width: 80%;
            height: 500px;
        }
    </style>
</head>
<body>
<div class="top-div">
    <h2 class="text-center">博客管理页面</h2>
</div>

<div class="left-div" id="left-div">
    <div class="user">欢迎回来:${username}</div>
    <ul>
        <li>写博客</li>
        <li>博客文章</li>
        <li>用户管理</li>
        <li>评论管理</li>
        <li>安全退出</li>
    </ul>

</div>

<div class="right-div">
    <!--写博客-->
    <div class="xbk">
        <form>
            <div class="form-div">
                <span class="">文章标题</span>
                <input type="text" class="form-control" placeholder="最多支持10个汉字" id="bTiele">
            </div>
            <div class="form-div">
                <span class="">文章介绍</span>
                <input type="text" class="form-control" placeholder="最多支持10个汉字" id="bIntroduce">
            </div>
            <div class="form-div">
                <span class="">文章</span>
                <div class="dv">
                    <div id="div1" style="height: 500px;">
                        <p>请输入内容...</p>
                    </div>
                </div>
            </div>
            <div class="form-div">
                <input type="button" value="提交" class="form-div-sub">
            </div>
        </form>
    </div>
    <!--文章管理-->
    <div class="wzgl">
        <table class="table table-bordered">
            <tr>
                <td>文章管理</td>
                <td>文章管理</td>
                <td>文章管理</td>
                <td>文章管理</td>
            </tr>
            <tr>
                <td>测试1</td>
                <td>测试2</td>
                <td>测试3</td>
                <td>测试4</td>
            </tr>
        </table>
    </div>
    <!--用户管理-->
    <div class="yhgl">
        <table class="table table-bordered yhgl-tr">
            <tr>
                <td>用户id</td>
                <td>用户名</td>
                <td>用户邮箱</td>
                <td>用户密码</td>
            </tr>
        </table>
    </div>
    <!--评论管理-->
    <div class="plgl">
        <table class="table table-bordered">
            <tr>
                <td>评论管理</td>
                <td>评论管理</td>
                <td>评论管理</td>
                <td>评论管理</td>
            </tr>
            <tr>
                <td>测试1</td>
                <td>测试2</td>
                <td>测试3</td>
                <td>测试4</td>
            </tr>
        </table>
    </div>
    <!--退出-->
    <div>

    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/dist/js/lib/jquery-2.2.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/dist/js/wangEditor.js"></script>
<script type="text/javascript">

    /*写博客*/
    $(".form-div-sub").click(function () {
        //获取标题
        var bTiele = $("#bTiele").val();
        //获取介绍
        var bIntroduce = $("#bIntroduce").val();
        //获取文本的内容加代码
        var bTxt = editor.$txt.html();
        //进行判断用户的输入是否大于10个字
        if (bTiele.length > 10 || bIntroduce.length > 10) {
            alert("标题||介绍不能大于10个字哦");
            return false;
        }
        $.ajax({
             url: "${pageContext.request.contextPath}/w/insertb",
            type: "POST",
            data: {"bIntroduce": bIntroduce,"bTitle": bTiele, "bTxt": bTxt},
            success: function (data) {
                alert(data);
            }

        });
    });

    /*用户管理*/
    $(".left-div li").eq(2).click(function () {
        $(".left-div-tr").remove();
        $.ajax({
            url: "${pageContext.request.contextPath}/login/find",
            type: "GET",
            dataType: "json",
            success: function (data) {
                $.each(data, function (name, value) {
                    $(".yhgl-tr").append("<tr class='left-div-tr'>" + "<td>" + value.id + "</td>" + "<td>" + value.username + "</td>" + "<td>" + value.useremail + "</td>" + "<td>" + value.userpassword + "</td>" + "</tr>");
                });
            }
        });

    });

    $(".xbk").show(1000);
    $(".wzgl").hide();
    $(".plgl").hide();
    $(".yhgl").hide();
    /*写博客*/
    $(".left-div li").eq(0).click(function () {
        $(".xbk").show(1000);
        $(".wzgl").hide();
        $(".plgl").hide();
        $(".yhgl").hide();
    });
    $(".left-div li").eq(1).click(function () {
        $(".wzgl").show(1000);
        $(".xbk").hide();
        $(".plgl").hide();
        $(".yhgl").hide();
        /*写博客*/
    });
    $(".left-div li").eq(3).click(function () {
        $(".plgl").show(1000);
        $(".wzgl").hide(1000);
        $(".xbk").hide();
        $(".yhgl").hide();
    });
    $(".left-div li").eq(2).click(function () {
        $(".yhgl").show(1000);
        $(".wzgl").hide(1000);
        $(".xbk").hide();
        $(".plgl").hide();
    });

</script>
<!--这里引用jquery和wangEditor.js-->
<script type="text/javascript">
    var editor = new wangEditor('div1');

    //菜单
    editor.config.menus = [
        'source',
        '|',
        'bold',
        'underline',
        'italic',
        'strikethrough',
        'eraser',
        'forecolor',
        //'bgcolor',
        '|',
        'quote',
        'fontfamily',
        'fontsize',
        'head',
        'unorderlist',
        'orderlist',
        'alignleft',
        'aligncenter',
        'alignright',
        '|',
        'link',
        'unlink',
        // 'table',
        // 'emotion',
        '|',
        'img',
        //'video',
        // 'location',
        'insertcode',
        '|',
        'undo',
        //'redo',
        'fullscreen'//全屏
    ];
    // 颜色
    editor.config.colors = {
        '#FFFFCC': '黄色',
        '#CCFFFF': '浅蓝色',
        '#FFCCCC': '浅粉色',
        '#ff0045': '绿色',
        '#ffffff': '黑色'
    };
    // 上传图片（举例）
    editor.config.uploadImgUrl = '/upload';
    editor.config.hideLinkImg = true;
    editor.create();
</script>
<script>
    function cli() {
        var html = editor.$txt.html();
        alert(html)
    }
</script>

</body>
</html>
