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
    <title>盗版信息门户</title>
    <link rel="stylesheet" href="./css/index.css">
</head>
<body>
<div class="title">
    <div class="left">
        <img src="./img/logo.png" alt="">
        <span>盗版信息门户</span>
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
                账号登陆
            </div>
            <div>您将要登录的系统： 一网通办个性化服务平台(盗版)</div>
            <form action="loginCheck" method="POST">
                <div class="input">
                    <input name="name" placeholder="请输入用户名"><br>
                    <input type="password" name="password" placeholder="请输入密码"><br>
                    <div class="ask">
                        <input type="checkbox"> <span class="noLogin">7天免登录</span>
                        <span class="ask2">开启后7天内无需再次登录，主动退出登录或使用浏览器无痕模式访问后，此功能失效</span>
                    </div>
                    <input type="submit" value="登录" class="submit">
                </div>
                <div class="recommend">
                    建议浏览器： IE10+ 360极速 谷歌
                </div>
            </form>
            <a href="./Register.jsp">点击注册账号</a>
            <div class="warning">登录后即可使用完整盗版功能！或点击<a href="./touristLogin.jsp">游客登录</a>仅可使用部分功能</div>
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
<div class="writer">
    <a href="writer.jsp">来自作者寄语</a>
</div>
</body>
</html>
