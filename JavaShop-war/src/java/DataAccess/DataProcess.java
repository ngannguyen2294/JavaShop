/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import java.sql.*;
/**
 *
 * @author NGANNV
 */
public class DataProcess {

    public ResultSet getTable(String query) throws SQLException {
        ResultSet rs;
        rs= DAL.getInstance().stmt.executeQuery(query);
        return rs;
    }
}
