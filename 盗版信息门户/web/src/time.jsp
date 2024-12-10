<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>时间</title>
    </head>
    <body>
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

        <div><%= greeting %> Visitor</div>  <!-- 输出问候语 -->
        <div>Time: <%= new Date() %></div>  <!-- 输出当前时间 -->
    </body>
</html>