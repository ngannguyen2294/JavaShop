/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.util.Base64;
import javax.imageio.ImageIO;

/**
 *
 * @author NGANNV
 */
public class CommonUtil {

    public static String JsonResponseOK(String data) {
        return "{\"status\": \"ok\","
                + "  \"data\": \"" + data
                + "\"}";
    }

    public static String JsonResponseFail(String data) {
        return "{\"status\": fail,"
                + "  \"data\": " + data
                + "}";
    }

    public static String getBase64Image(String ImageName) throws IOException {
        File imgPath = new File(ImageName);
        BufferedImage bufferedImage = ImageIO.read(imgPath);

        // get DataBufferBytes from Raster
        WritableRaster raster = bufferedImage.getRaster();
        DataBufferByte data = (DataBufferByte) raster.getDataBuffer();

        return Base64.getEncoder().encodeToString(data.getData());
    }
}
