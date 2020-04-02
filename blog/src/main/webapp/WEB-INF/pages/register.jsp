<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/re.css">
    <style>
        .login-msg {
            font-size: 16px;
            color: red;
            float: right;
            margin-right: 100px;
        }

        .user-msg, .email-msg {
            float: right;
            margin-right: 150px;
            font-size: 13px;
        }
    </style>
</head>
<body>
<div class="register">
    <div class="register-text">注册</div>
    <form method="post" action="${pageContext.request.contextPath}/r/register">
        <span class="text">账号
         <div class="user-msg"></div>
        </span>
        <input type="text" class="input" placeholder="请输入你的账号" name="username" id="username">
        <span class="text">邮箱
           <div class="email-msg"></div>
        </span>
        </span>
        <input type="email" class="input" placeholder="请输入你的邮箱" name="useremail" id="useremail">
        <span class="text">密码</span>
        <input type="password" class="input" placeholder="请输入你的注册密码" name="userpassword" id="userpassword">
        <span class="text">验证码</span>
        <div class="text">
            <input type="text" class="yzm-input" placeholder="请输入验证码" name="code" id="code">
            <a href="javascript:refreshCode();">
                <img src="${pageContext.request.contextPath}/code" alt="" class="yzm-img" id="vcode">
            </a>
        </div>
        <a href="${pageContext.request.contextPath}/b/login" class="zc-a" onclick="code()" id="zc-a">点我可以快速登录哦!</a><br>
        <div class="login-msg">
            <%=request.getSession().getAttribute("login-msg") == null ? "" : request.getSession().getAttribute("login-msg")%>
        </div>
        <input type="submit" class="zc-dl" value="注册">
    </form>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.2.js"></script>
<script>


    $(".zc-dl").click(function () {
        var username = $("#username").val();
        var useremail = $("#useremail").val();
        var userpassword = $("#userpassword").val();
        var code = $("#code").val();
        if (username == "") {
            alert("账号不能为空");
            return false;
        }

        if (useremail == "") {
            alert("邮箱不能为空");
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

    //切换验证码
    function refreshCode() {
        var vcode = document.getElementById("vcode");
        vcode.src = "${pageContext.request.contextPath}/code?time=" + new Date().getTime();
    }

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
                    $(".login-msg").html(data);
                    if (data == "验证码输入正确") {
                        $(".login-msg").css("color", "green");
                    } else {
                        $(".login-msg").css("color", "red");
                    }
                }
            });
        } else {
            alert("验证码不能为空");
        }
    });
    //ajax验证用户名操作

    $("#username").blur(function () {
        var val = $(this).val();
        if (val != "") {
            $.ajax({
                url: "uname",
                type: "POST",
                dataType: 'text',
                data: {"name": val},
                success: function (data) {
                    $(".user-msg").html(data);
                    if (data == "用户名可用") {
                        $(".user-msg").css("color", "green");
                    } else {
                        $(".user-msg").css("color", "red");
                    }
                }
            })
        } else {
            alert("用户名不能为空");
        }
    });
    //ajax邮箱
    $("#useremail").blur(function () {
        var val = $(this).val();
        if (val != "") {
            $.ajax({
                url: "${pageContext.request.contextPath}/b/email",
                type: "POST",
                dataType: 'text',
                data: {"useremail": val},
                success: function (data) {
                    $(".email-msg").html(data);
                    if (data == "邮箱可用") {
                        $(".email-msg").css("color", "green");
                    } else {
                        $(".email-msg").css("color", "red");
                    }
                }
            })
        } else {
            alert("邮箱不能为空");
        }
    });
</script>
</body>
</html>
