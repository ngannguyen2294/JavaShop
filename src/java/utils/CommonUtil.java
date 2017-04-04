/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author NGANNV
 */
public class CommonUtil {
    public static String JsonResponseOK(String data)
    {
        return "{\"status\": \"ok\","
                    + "  \"data\": \""+data
                    + "\"}";
    }
      public static String JsonResponseFail(String data)
    {
        return "{\"status\": fail,"
                    + "  \"data\": "+data
                    + "}";
    }
}
