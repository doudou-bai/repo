<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/re.css">
    <style>
        .user-msg,.code-msg{
            float: right;
            margin-right: 150px;
            font-size: 13px;
        }
        .code-msg{
        margin-top: 10px;
            margin-bottom: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="register">
    <div class="register-text">登录</div>
    <form method="post" action="${pageContext.request.contextPath}/l/login">
        <span class="text">账号
        </span>
        <input type="text" class="input" placeholder="请输入你的账号" name="username" id="username">
        <span class="text">密码</span>
        <input type="text" class="input" placeholder="请输入你的登录密码" name="userpassword">
        <span class="text">验证码</span>
        <div class="text">
            <input type="text" class="yzm-input" placeholder="请输入验证码" name="code" id="code">
            <img src="${pageContext.request.contextPath}/code" alt="验证码显失败" class="yzm-img">
        </div>
        <div class="code-msg"></div>
        <div class="login-msg">
            <%=request.getSession().getAttribute("login-msg") == null ? "" : request.getSession().getAttribute("login-msg")%>
        </div>
        <input type="submit" class="zc-dl" value="登录" onclick="yz()" id="zc-dl">
    </form>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.2.js"></script>
<script>

    $(".zc-dl").click(function () {
        var username = $("#username").val();
        var userpassword = $("#userpassword").val();
        var code = $("#code").val();
        if (username == "") {
            alert("账号不能为空");
            return false;
        }

        if (userpassword == "") {
            alert("密码不能为空");
            return false;
        }

        if (code == "") {
            alert("验证码不能为空");
            return false;
        }
        return true;
    });

    //ajax验证码操作
    $("#code").blur(function () {
        var c = $(this).val();
        if (c != "") {
            $.ajax({
                url: "${pageContext.request.contextPath}/b/code",
                type: "POST",
                dataType: 'text',
                data: {"code": c},
                success: function (data) {
                    $(".code-msg").html(data);
                    if (data == "验证码输入正确") {
                        $(".code-msg").css("color", "green");
                    } else {
                        $(".code-msg").css("color", "red");
                    }
                }
            });
        } else {
            alert("验证码不能为空");
        }
    });
</script>
</body>
</html>
