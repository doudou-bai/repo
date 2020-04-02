<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>博客index</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
<!--网站的头部-->
<div class="container-fluid index-top-dv">
    <h2 class="text-center index-top-c">个人博客index页面</h2>
</div>
<div class="container-fluid index-nav-dv">
    <ul>
        <li>主页</li>
        <li>生活笔记</li>
        <li>关于博主</li>
        <li>留言</li>
        <li onclick="xm()">项目合作</li>
        <li><a href="${pageContext.request.contextPath}/b/wblog" class="index-a">写博客</a></li>
        <%--<li><a href="${pageContext.request.contextPath}/b/register" class="index-a">注册</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/b/login" class="index-a">登录</a></li>
    </ul>
</div>
<div class="container index-b">
    <div class="index-b-left">
        <div class="index-b-left-lb"></div>
    </div>
    <div class="index-b-right">
        <div class="index-b-right-lb">
            <h4>新增文章</h4>
            <ul>
                <li>1</li>
                <li>1</li>
                <li>1</li>
                <li>1</li>
                <li>1</li>
                <li>1</li>
                <li>1</li>
                <li>1</li>
                <li>1</li>
            </ul>
        </div>
    </div>
</div>
<div class="container bod">
  <%--  <div class="index-b-dv">
        <a href="${pageContext.request.contextPath}/exhibition" class="index-b-dv-a">标题</a>
        <small style="float: right;margin-right: 50px;color: black">浏览量：152452454</small>
        <small style="float: right;margin-right: 55px;color: black">时间：2020-02-02</small>
        <span>简介</span>
        <span>12454241521412124212421524215211215241152<p>:12445215152451242124521124121</span>
    </div>--%>

</div>
<div class="container-fluid bottom">
    <span class="b-s">版权归属为个人 请勿商用 如有问题请联系博主</span>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/b/blogtxt",
            type: "POST",
            dataType: 'json',
            success: function (data) {
                $.each(data, function (index, item) {
                    $(".bod").append(" <div class=\"index-b-dv\">\n" +
                        "        <a href=\"${pageContext.request.contextPath}/exhibition?buuid="+item.bUid+"\" class=\"index-b-dv-a\">"+item.bTitle+"</a>\n" +
                        "        <small style=\"float: right;margin-right: 50px;color: black\">浏览量："+item.bReading+"</small>\n" +
                        "        <small style=\"float: right;margin-right: 55px;color: black\">时间："+date(item.bTime)+"</small>\n" +
                        "        <span >内容简介</span>\n" +
                        "        <span style=\"display:block;margin-top: 10px;text-indent:2em;\">"+item.bIntroduce+"</span>\n" +
                        "    </div>");
                });

            }
        });
    });
    function date(time) {
        var da = time;
        da = new Date(da);
        var year = da.getFullYear();
        var month = da.getMonth() + 1;
        var date = da.getDate();
        var t = [year, month, date].join('-');
        return t;
    }
    function xm() {
        alert("请加微信:wqq2727")
    }
</script>
</body>
</html>
