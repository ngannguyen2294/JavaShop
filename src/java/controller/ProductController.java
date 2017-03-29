/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bussiness.ProductBussiness;
import models.Products;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author NGANNV
 */
@Controller
public class ProductController {

    @RequestMapping(value = "admin/productBussiness.htm", method = RequestMethod.POST)
    public Boolean UpdateProduct(HttpServletRequest request, HttpServletResponse response, 
            @RequestParam(value = "productName") String productName,
            @RequestParam(value = "productID") String productID,
             @RequestParam(value = "supplierID") int supplierID,
             @RequestParam(value = "categoryID") int categoryID) {
        try {
            ProductBussiness pb = new ProductBussiness();
       pb.UpdateProduct(supplierID, productName, categoryID, Integer.BYTES, productID, productID, productID, productID);
        } catch (Exception ex) {
            return false;
        }
        return false;
    }
}
