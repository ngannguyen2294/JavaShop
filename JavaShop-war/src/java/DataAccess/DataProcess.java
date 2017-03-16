/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataAccess;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;

/**
 *
 * @author NGANNV
 */
public class DataProcess {

    public ResultSet getTable(String query, ArrayList<String> params) {
        try {
            ResultSet rs;
            DAL.getInstance().stmt = preStatement(query, params);
            rs = DAL.getInstance().stmt.executeQuery(query);
            return rs;
        } catch (Exception ex) {
            return null;
        }
    }

    private PreparedStatement preStatement(String query, ArrayList<String> params) {
        try {
            PreparedStatement state;
            state = DAL.getInstance().conn.prepareStatement(query);
            int i = 0;
            for (String value : params) {
                state.setString(i, value);
                i++;
            }
            return state;
        } catch (Exception ex) {
            return null;
        }
    }
}
