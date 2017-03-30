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
            @RequestParam(value = "supplierID") String supplierID,
            @RequestParam(value = "categoryID") String categoryID,
            @RequestParam(value = "quantityPerUnit") String quantityPerUnit,
            @RequestParam(value = "unitPrice") String unitPrice,
            @RequestParam(value = "unitsInStock") String unitsInStock,
            @RequestParam(value = "unitsOnOrder") String unitsOnOrder,
            @RequestParam(value = "image") String image) {
        try {
            ProductBussiness pb = new ProductBussiness();
        return    pb.UpdateProduct(productID, productName, supplierID, categoryID, quantityPerUnit, unitPrice, unitsInStock, unitsOnOrder, image);
        } 
        catch (Exception ex) {
            
        }
        return true;
    }
}
