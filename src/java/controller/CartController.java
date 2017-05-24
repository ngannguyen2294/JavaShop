/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bussiness.ProductBussiness;
import models.Cart;
import models.CartItem;
import static models.HibernateUtil.getSessionFactory;
import models.Logins;
import models.Products;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.CommonUtil;
import utils.shaSecure;

/**
 *
 * @author luan.nt
 */
@Controller
public class CartController {

    private final ProductBussiness productDAO = new ProductBussiness();

    @RequestMapping(value = "addCart.htm", method = RequestMethod.GET)
    public String addCart(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productid = request.getParameter("productid");
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            List<Products> list = productDAO.GetProductByID(productid);
            int idproduct = Integer.parseInt(productid);
            Products products = list.get(0);
            switch (command) {
                case "plus":
                    if (cart.getCartItems().containsKey(idproduct)) {
                        cart.insertToCart(idproduct, new CartItem(products,
                                cart.getCartItems().get(idproduct).getQuantity()));
                    } else {
                        cart.insertToCart(idproduct, new CartItem(products, 1));
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/home.htm";
        }
        session.setAttribute("cart", cart);
        return "redirect:/home.htm";
    }

    @RequestMapping(value = "addCart.htm", method = RequestMethod.POST)
    public String addCartPost(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "productid") String productid, @RequestParam(value = "quantity") String quantity) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            List<Products> list = productDAO.GetProductByID(productid);
            int idproduct = Integer.parseInt(productid);
            int quantityparse = Integer.parseInt(quantity);
            Products products = list.get(0);
            if (cart.getCartItems().containsKey(idproduct)) {
                cart.insertToCart(idproduct, new CartItem(products,
                        quantityparse));
            } else {
                cart.insertToCart(idproduct, new CartItem(products, quantityparse));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/home.htm";
        }
        session.setAttribute("cart", cart);
        return "redirect:/home.htm";
    }
}
