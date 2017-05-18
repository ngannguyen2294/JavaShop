/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bussiness.ProductBussiness;
import models.Products;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import utils.CommonUtil;

/**
 *
 * @author NGANNV
 */
@Controller
public class ProductController {

    @RequestMapping(value = "admin/updateProduct.htm", method = RequestMethod.POST)
    @ResponseBody
    public String UpdateProduct(HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value = "productName") String productName,
            @RequestParam(value = "productID") String productID,
            @RequestParam(value = "supplierID") String supplierID,
            @RequestParam(value = "categoryID") String categoryID,
            @RequestParam(value = "quantityPerUnit") String quantityPerUnit,
            @RequestParam(value = "unitPrice") String unitPrice,
            @RequestParam(value = "unitsInStock") String unitsInStock,
            @RequestParam(value = "unitsOnOrder") String unitsOnOrder,
            @RequestParam(value = "image") String image) {
        try {
            ProductBussiness pb = new ProductBussiness();
            if (pb.UpdateProduct(productID, productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, image)) {
                return CommonUtil.JsonResponseOK("true");
            } else {
                return CommonUtil.JsonResponseFail("false");
            }
        } catch (Exception ex) {

        }
        return "";
    }

    @RequestMapping(value = "admin/deleteProduct.htm", method = RequestMethod.POST)
    @ResponseBody
    public String UpdateProduct(HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value = "productID") String productID) {
        ProductBussiness pb = new ProductBussiness();
        if (pb.DeleteProduct(productID)) {
            return CommonUtil.JsonResponseOK("true");
        } else {
            return CommonUtil.JsonResponseFail("false");
        }
    }

    @RequestMapping(value = "admin/addProductAction.htm", method = RequestMethod.POST)
    public String AddProduct(HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value = "productName") String productName,
            @RequestParam(value = "productID") String productID,
            @RequestParam(value = "supplierID") String supplierID,
            @RequestParam(value = "categoryID") String categoryID,
            @RequestParam(value = "quantityPerUnit") String quantityPerUnit,
            @RequestParam(value = "unitPrice") String unitPrice,
            @RequestParam(value = "unitsInStock") String unitsInStock,
            @RequestParam(value = "unitsOnOrder") String unitsOnOrder,
            @RequestParam(value = "file") MultipartFile file) {
        String imagePath = "";
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
                imagePath = "/img/" + millis + name;

            } catch (Exception ex) {

            }
        }
        ProductBussiness pb = new ProductBussiness();
        if (pb.AddProduct(productID, productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder,imagePath)) {
              return "redirect:../admin/productlist.htm";
        } else {
            return "redirect:../admin/addProduct.htm";
        }
    }
}
