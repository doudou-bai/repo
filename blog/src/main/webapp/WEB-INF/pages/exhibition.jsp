<%--
  Created by IntelliJ IDEA.
  User: Mi
  Date: 2020/3/22
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>博客index</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #EEEEEE;
        }

        .nav {
            height: 70px;
            background-color: #4bc0c8;
        }

        .bod {
            background-color: whitesmoke;
        }

        .bod-s {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .bod-hr {
            border: 2px solid #5e6f65;
        }

        .bod-input {
            margin-bottom: 20px;
            width: 500px;
            height: 200px;
            text-align: left;
        }

        .input-s {
            display: block;
            margin-top: 50px;
        }

        ul {
            list-style: none;
        }

        li {
            height: 50px;
            line-height: 50px;
            margin-bottom: 20px;
            border-radius: 10px;
            text-indent: 1em;
            background-color: white;
            word-wrap: break-word;
        }

        .bod-hr2 {
            border: 1px solid #cbcbcb;
        }

        .sub {
            width: 100px;
            height: 30px;
        }

        .body-dv {
            text-indent: 2em;
            width: 100%;
            word-wrap: break-word;
            white-space: pre-line;
            word-break: break-all;

        }
    </style>
</head>
<body>
<div class="nav"></div>
<div class="container bod">
    <h2 class="text-center">${blog.bTitle}</h2>
    <small class="bod-s">${blog.bTime}</small>
    <hr class="bod-hr">


    <div class="body-dv">
        ${blog.bTxt}
    </div>


    <small class="input-s">评论一下他的文章</small>
    <form>
        <input type="text" class="bod-input" placeholder="期待你的评论">
        <input type="submit" value="发布评论" class="sub">
        <small style="float: right;margin-top: 190px;margin-right: 90px" >阅读量:${blog.bReading}</small>
    </form>

    <ul>
        <li>
            1楼
            <small>评论一下他的文章</small>
            <small style="float: right;margin-right: 100px;color: gainsboro">时间：</small>
            <hr>
        </li>
    </ul>
</div>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
