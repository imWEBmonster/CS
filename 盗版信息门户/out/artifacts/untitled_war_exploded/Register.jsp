<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2024/11/16
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language = "java" import="java.util.*,java.sql.*" pageEncoding = "UTF-8"%>
<%@ page import="java.util.Date" %>
<meta name="viewport" content="width=device-width, initial-scale=1.2">
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="./css/register.css">
</head>
<body>
<div class="title">
    <div class="left">
        <img src="./img/logo.png" alt="">
        <span>校长投票系统</span>
    </div>
    <div class="right">
        <%
            // 获取当前时间
            Calendar calendar = Calendar.getInstance();
            int hour = calendar.get(Calendar.HOUR_OF_DAY); // 24小时制的小时

            // 根据当前小时输出问候语
            String greeting;
            if (hour >= 5 && hour < 12) {
                greeting = "Good Morning";  // 5:00 - 11:59
            } else if (hour >= 12 && hour < 18) {
                greeting = "Good Afternoon";  // 12:00 - 17:59
            } else if (hour >= 18 && hour < 21) {
                greeting = "Good Afternoon";  // 18:00 - 20:59
            } else {
                greeting = "Good Evening";  // 21:00 - 4:59
            }
        %>
        <div class="h"><%= greeting %></div>  <!-- 输出问候语 -->
        <div>Time: <%= new Date() %></div>  <!-- 输出当前时间 -->
    </div>
</div>

<div class="body">
    <div class="login">
        <div class="pic">
            <img src="./img/logo.png" alt="">
        </div>
        <div class="text">
            <div class="top">
                账号注册
            </div>
            <div>您将要注册的系统： 一网通办个性化服务平台之校长投票</div>
            <form action="Register" method="POST">
                <div class="input">
                    <input name="name" placeholder="请输入用户名"><br>
                    <input type="password" name="password" placeholder="请输入密码"><br>
                    <input type="password" name="sex" placeholder="请输入性别"><br>
                    <input type="password" name="age" placeholder="请输入年龄"><br>
                    <input type="submit" value="注册" class="submit">
                </div>
                <div class="recommend">
                    建议浏览器： IE10+ 360极速 谷歌
                </div>
            </form>
            <a href="./index.jsp">点击返回主页面</a>
            <div class="warning">注册成功将直接返回主页面，失败则会重新加载该页面</div>
        </div>
    </div>
</div>

<div class="banner">
    <div class="txt">
        <p>师生服务大厅</p>
    </div>
    <div class="pic">
        <div class="text">
            <div>
                <p>地址</p>
                <p>北校区师生服务大厅</p>
            </div>
            <div>
                <p>人工服务</p>
                <p>工作日早上8:30-12:00，下午14:00-17:30</p>
            </div>
            <div>
                <p>自助服务</p>
                <p>工作日早上8:30-12:00，下午14:00-17:30</p>
            </div>
        </div>
        <div class="QR">
            <div class="left">
                <img src="./img/left.png" alt="">
                <p>信网处微信服务号</p>
            </div>
            <div class="right">
                <img src="./img/right.png" alt="">
                <p>移动APP下载</p>
            </div>
        </div>
    </div>
    <div class="bottom">
        <p>版权信息：© 长安大学</p>
    </div>
</div>
</body>
</html>
