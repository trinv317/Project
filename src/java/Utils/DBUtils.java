package Utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lienm
 */
public class DBUtils {
        public static final Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection conn= null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url= "jdbc:sqlserver://LAPTOP-0S88TDT8\\NVANTRI;databaseName=GlassesDB;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
        conn= DriverManager.getConnection(url, "sa", "123");
        return conn;
    }
}
