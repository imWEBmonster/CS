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

@WebServlet("/loginCheck")

public class LoginCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        try {
            Connection conn = Util.getConnection();
            String sql = "select * from userTable where name=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                try{
                    Util.close(conn, ps, rs);
                }catch(Exception e){
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
                request.getRequestDispatcher("/loginSuccess.jsp").forward(request, response);
            }
            else {
                try {
                    Util.close(conn, ps, rs);
                }catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }
                request.getRequestDispatcher("/loginError.jsp").forward(request, response);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

}
