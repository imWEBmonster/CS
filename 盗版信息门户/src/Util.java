import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public final class Util {
    private static String driver;
    private static String url;
    private static String user;
    private static String password;
    private static Properties pr=new Properties();
    private Util() {}
    static {
        try {
            pr.load(Util.class.getClassLoader().getResourceAsStream("db.properties"));
            driver = pr.getProperty("driver");
            url = pr.getProperty("url");
            user = pr.getProperty("username");
            password = pr.getProperty("password");
            Class.forName(driver);
        }catch(Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }
    public static void close(Connection conn, Statement st, ResultSet rs) throws Exception {
        if(rs != null){
            rs.close();
        }
        if(st != null){
            st.close();
        }
        if(conn != null){
            conn.close();
        }
    }
}