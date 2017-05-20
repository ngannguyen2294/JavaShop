/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.hibernate.annotations.common.util.impl.LoggerFactory.logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.portlet.ModelAndView;
import utils.CommonUtil;

/**
 *
 * @author NGANNV
 */
@Controller
public class ImageUploadController {

    @RequestMapping(value = "image/upload.htm", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler(HttpServletRequest request, @RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String name = file.getOriginalFilename();
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                Path from = serverFile.toPath(); //convert from File to Path
                long millis = System.currentTimeMillis();
                Path to = Paths.get(request.getSession().getServletContext().getRealPath("/img") + "/" + millis + name); //convert from String to Path
                Files.move(from, to, StandardCopyOption.ATOMIC_MOVE);
                return "/img/" + millis + name;
            } catch (Exception e) {
                return "You failed to upload " + e.getMessage();
            }
        } else {
            return "You failed to upload because the file was empty.";
        }
    }
     @RequestMapping(value = "image/uploadToBase64.htm", method = RequestMethod.POST)
    public @ResponseBody
    String uploadToBase64(HttpServletRequest request, @RequestParam("file") MultipartFile file) {

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String name = file.getOriginalFilename();
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                Path from = serverFile.toPath(); //convert from File to Path
                long millis = System.currentTimeMillis();
                Path to = Paths.get(request.getSession().getServletContext().getRealPath("/img") + "/" + millis + name); //convert from String to Path
                Files.move(from, to, StandardCopyOption.ATOMIC_MOVE);
                return Base64.getEncoder().encodeToString(bytes);
            } catch (Exception e) {
                return "You failed to upload " + e.getMessage();
            }
        } else {
            return "You failed to upload because the file was empty.";
        }
    }
}
