<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2024/11/17
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,java.sql.*" language="java" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="./css/loginSuccess.css">
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
        <div class="h"><%= greeting %> User</div>  <!-- 输出问候语 -->
        <div>Time: <%= new Date() %></div>  <!-- 输出当前时间 -->
    </div>
</div>
<div class="body">
    <div class="txt">当前为：用户登录。点击下方按钮进行投票</div>
    <%
        String url = "jdbc:sqlserver://localhost:1433;databaseName=VoteDB;encrypt=true;trustServerCertificate=true";
        String user = "sa";
        String password = "123456";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            out.println("<center>");
            // 加载 JDBC 驱动程序
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // 创建连接
            conn = DriverManager.getConnection(url, user, password);

            //查找所有学生
            String sql = "select * from voteTable";
            pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs = pstmt.executeQuery();
            rs.last();

            out.println("你要查询的投票结果中共有");
            out.println("<font size = \"5\" color = \"red\">");
            out.println("" + rs.getRow());
            out.println("</font>");
            out.println("列");
            out.println("<table border=\"2\" bgcolor=\"ccceee\" width=\"650\">");
            out.println("<tr bgcolor=\"CCCCCC\" align=\"center\">");
            out.println("<td>记录条数</td>");
            out.println("<td>编号</td>");
            out.println("<td>姓名</td>");
            out.println("<td>性别</td>");
            out.println("<td>年龄</td>");
            out.println("<td>植物</td>");
            out.println("<td>票数</td>");
            out.println("</tr>");

            rs.beforeFirst();
            while (rs.next()) {
                out.println("<tr align=\"center\">");
                out.println("<td>" + rs.getRow() + "</td>");
                out.println("<td>" + rs.getString("id") + "</td>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("sex") + "</td>");
                out.println("<td>" + rs.getString("age") + "</td>");
                out.println("<td>" + rs.getString("job") + "</td>");
                out.println("<td>" + rs.getString("data") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</center>");
            if(rs!=null){rs.close();}
            if(pstmt!=null){pstmt.close();}
            if(conn!=null){conn.close();}
        } catch (SQLException e) {
            out.println("数据库错误: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("JDBC 驱动程序未找到: " + e.getMessage());
        } finally {
            // 关闭资源
            try {
                if (rs!= null) {
                    rs.close();
                }
                if (pstmt!= null) {
                    pstmt.close();
                }
                if (conn!= null) {
                    conn.close();
                }
            } catch (SQLException e) {
                out.println("关闭资源时出错: " + e.getMessage());
            }
        }
    %>

    <div class="vote">
        <form action="vote" method="POST">
            <div>
                <span class="cin">请输入序号查询</span>
                <input name="id" placeholder="请输入序号">
                <input type="submit" placeholder="投票">
            </div>
        </form>
        <div class="warning">
            每人可多次投票，投票失败需重新登录！
        </div>
    </div>
</div>
<center>
    <a href="./index.jsp">点击此处返回</a>
</center>
</body>
</html>
