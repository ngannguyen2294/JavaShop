/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
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
    @ResponseBody
    public String addCart(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        String productid = request.getParameter("productid");
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            List<Products> list = productDAO.GetProductByID(productid);
            int idproduct = Integer.parseInt(productid);
            Products products = list.get(0);
            if (cart.getCartItems().containsKey(idproduct)) {
                cart.insertToCart(idproduct, new CartItem(products,
                        cart.getCartItems().get(idproduct).getQuantity()));
            } else {
                cart.insertToCart(idproduct, new CartItem(products, 1));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        session.setAttribute("cart", cart);
        return "success";
    }

    @RequestMapping(value = "addCart.htm", method = RequestMethod.POST)
    @ResponseBody
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
            return "fail";
        }
        String value = String.valueOf(cart.total());

        session.setAttribute("cart", cart);
        if (value.length() > 6) {
            value = value.replaceFirst("(\\d{1,3})(\\d{3})(\\d{3})", "$1,$2,$3");
        } else if (value.length() >= 5 && value.length() <= 6) {
            value = value.replaceFirst("(\\d{2,3})(\\d{3})", "$1,$2");
        } else {
            value = value.replaceFirst("(\\d{1})(\\d+)", "$1,$2");
        }
        String json = "{\"price\":\"" + value + "\",\"total\":\"" + cart.countItem() + "\",\"mes\":\"Add to card success. Please check your Cart\"}";
        return json;
    }

    @RequestMapping(value = "removeCart.htm", method = RequestMethod.GET)
    public String removeCart(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        String productid = request.getParameter("productid");
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            List<Products> list = productDAO.GetProductByID(productid);
            int idproduct = Integer.parseInt(productid);
            cart.removeToCart(idproduct);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/cart.htm";
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart.htm";
    }

    @RequestMapping(value = "editCart.htm", method = RequestMethod.POST)
    @ResponseBody
    public String editCart(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "productid") String productid, @RequestParam(value = "value") String quantity) {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        try {
            List<Products> list = productDAO.GetProductByID(productid);
            int idproduct = Integer.parseInt(productid);
            int quantityparse = Integer.parseInt(quantity);
            Products products = list.get(0);
            cart.editToCart(idproduct, new CartItem(products, quantityparse));

        } catch (Exception e) {
            e.printStackTrace();
            return String.valueOf(cart.total());
        }
        String value = String.valueOf(cart.total());

        session.setAttribute("cart", cart);
        if (value.length() > 6) {
            value = value.replaceFirst("(\\d{1,3})(\\d{3})(\\d{3})", "$1,$2,$3");
        } else if (value.length() >= 5 && value.length() <= 6) {
            value = value.replaceFirst("(\\d{2,3})(\\d{3})", "$1,$2");
        } else {
            value = value.replaceFirst("(\\d{1})(\\d+)", "$1,$2");
        }
        String json = "{\"price\":\"" + value + "\",\"total\":\"" + cart.countItem() + "\"}";
        return json;
    }
}
