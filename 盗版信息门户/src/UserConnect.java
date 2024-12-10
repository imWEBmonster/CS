import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserConnect {
    //添加，注册
    public void add(Users user) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = Util.getConnection();
        String sql = "insert into userTable values(?,?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1,user.getName());
        ps.setString(2,user.getPassWord());
        ps.executeUpdate();
        Util.close(conn,ps,null);
    }
    //查询所有投票
    public List<Voter> QueryAll() throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Voter> list = new ArrayList<Voter>();
        conn = Util.getConnection();
        String sql = "select * from voterTable";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            String id = rs.getString("id");
            String name = rs.getString("name");
            String sex = rs.getString("sex");
            String age = rs.getString("age");
            String job = rs.getString("job");
            String data = rs.getString("data");
            Voter voter = new Voter(id,name,sex,age,job,data);
            list.add(voter);
        }
        Util.close(conn,ps,rs);
        return list;
    }
}
