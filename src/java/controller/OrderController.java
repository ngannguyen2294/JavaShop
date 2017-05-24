/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bussiness.OrderBussiness;
import models.Orderdetails;
import models.Orders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class OrderController {

    @RequestMapping(value = "admin/orderdetails.htm", method = RequestMethod.GET)
    public String GetOrderdetails(Model model,HttpServletRequest request, HttpServletResponse response,
            @RequestParam(value = "OrderID") String OrderID) {
        OrderBussiness orderBus = new OrderBussiness();
        Orders order = orderBus.GetOrderbyID(OrderID);
        model.addAttribute("order", order);                 
        return "adminPages/pages/order/details";    
    }
}
