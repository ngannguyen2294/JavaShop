<%-- 
    Document   : banner
    Created on : Mar 14, 2017, 11:27:53 AM
    Author     : luan.nt
--%>

<%@page import="models.Cart"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
                 pageEncoding="UTF-8"%>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    </head>
    <body>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><a href="home.htm"><img style="width:130px;height: 100px" src="img/logo.png"></a></h1>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="shopping-item">
                            <a href="cart.htm">Cart - <span class="cart-amunt">
                                    <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=cart.total()%>" /><u>đ</u></span>
                                <i class="fa fa-shopping-cart"></i>
                                <span class="product-count"><%=cart.countItem()%></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End site branding area -->
    </body>
</html>
