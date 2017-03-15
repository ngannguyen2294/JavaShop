/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

/**
 *
 * @author NGANNV
 */
import java.sql.*;

public class DAL {
    // JDBC driver name and database URL

    static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    static final String DB_URL = "jdbc:sqlserver://localhost\\NGANNV;databaseName=JavaShop";

    //  Database credentials
    static final String USER = "sa";
    static final String PASS = "abc@123abc";
    Connection conn = null;
    Statement stmt = null;
    private static DAL instance = null;

    public static DAL getInstance() {
        if (instance == null) {
            instance = new DAL();
        }
        return instance;
    }

    private DAL() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }

    public Boolean excute(String sql) {
        try {
            stmt.executeQuery(sql);
            return true;
        } catch (SQLException se) {
            System.out.print(se.toString());
            return false;
        } catch (Exception e) {
            System.out.print(e.toString());
            return false;
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                System.out.print(se.toString());
                return false;
            }// do nothing
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                System.out.print(se.toString());
                return false;
            }//end finally try
        }//end try
    }
}
