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

@WebServlet("/Register")

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        if (name == null || name.isEmpty() || password == null || password.isEmpty() ||
                age == null || age.isEmpty() || sex == null || sex.isEmpty()) {
            try {
                // 直接返回原注册界面（register.jsp），无需进行数据库操作
                request.getRequestDispatcher("/Register.jsp").forward(request, response);
                return;
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e.getMessage());
            }
        }
        try {
            Connection conn = Util.getConnection();
            String sql = "insert into userTable(name,password,age,sex) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, age);
            ps.setString(4,sex);
            int affectedRows = ps.executeUpdate();
            if (affectedRows>0) {
                try{
                    Util.close(conn, ps, null);
                }catch(Exception e){
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            else {
                try {
                    Util.close(conn, ps, null);
                }catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
                request.getRequestDispatcher("/Register.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

}
