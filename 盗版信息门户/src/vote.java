import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vote")

public class vote extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null || id.isEmpty() ) {
            try {
                // 直接返回原注册界面（index.jsp），无需进行数据库操作
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e.getMessage());
            }
        }
        try {
            Connection conn = Util.getConnection();
            String sql = "update voteTable set data = data+1 where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int affectedRows = ps.executeUpdate();
            if (affectedRows>0) {
                try{
                    Util.close(conn, ps, null);
                }catch(Exception e){
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
                request.getRequestDispatcher("/loginSuccess.jsp").forward(request, response);
            }
            else {
                try {
                    Util.close(conn, ps, null);
                }catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

}
