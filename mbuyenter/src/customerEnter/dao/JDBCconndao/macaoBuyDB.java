package customerEnter.dao.JDBCconndao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class macaoBuyDB {

	
    
    private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static String url = "jdbc:sqlserver://rds6505mi5724vg5j955public.sqlserver.rds.aliyuncs.com:3433";
    private static String username="testmbuydate";
    private static String password="mbuytest147";
    private static Connection conn = null;
    
    public static  Connection getConnection(){
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url,username,password);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(macaoBuyDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(macaoBuyDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return conn;
    }
    
    public static void main(String[] args) {
		System.out.println(macaoBuyDB.getConnection());
	}
}
