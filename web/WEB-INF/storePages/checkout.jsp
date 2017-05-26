<%-- 
    Document   : checkout
    Created on : May 26, 2017, 10:12:51 AM
    Author     : luan.nt
--%>

<%@page import="models.CartItem"%>
<%@page import="java.util.Map"%>
<%@page import="models.Cart"%>
<%@page import="models.Products"%>
<%@page import="models.Categories"%>
<%@page import="java.util.List"%>
<jsp:useBean id = "ProductDAO" class = "model.bussiness.ProductBussiness" 
             scope = "page"/>
<jsp:useBean id = "Categories" class = "model.bussiness.CategoryBussiness" 
             scope = "page"/>
<!DOCTYPE html>
<html>
    <head>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
        <title>Shop Page</title>
    </head>
    <body>
        <!--header-->
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="banner.jsp"></jsp:include>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>
        <div id="undefined-sticky-wrapper" class="sticky-wrapper" style="height: 60px;">
            <div class="mainmenu-area">
                <div class="container">
                    <div class="row">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div> 
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="home.htm">Home</a></li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="shop.htm">Category
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <%
                                            List<Categories> cate = Categories.getAllCategories();
                                            for (Categories c : cate) {
                                        %>
                                        <li><a href="shop.htm?category=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></li>
                                            <%
                                                }
                                            %>
                                    </ul>
                                </li>
                                <li><a href="cart.htm">Cart</a></li>
                                <li class="active"><a href="checkout.htm">Checkout</a></li>
                            </ul>         
                        </div>  
                    </div>
                </div>
            </div>
        </div> <!-- End mainmenu area -->
        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Check out</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Products</h2>
                            <div class="thubmnail-recent">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                                <h2><a href="single-product.htm">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins>$700.00</ins> <del>$100.00</del>
                                </div>
                            </div>
                            <div class="thubmnail-recent">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                                <h2><a href="single-product.htm">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins>$700.00</ins> <del>$100.00</del>
                                </div>
                            </div>
                            <div class="thubmnail-recent">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                                <h2><a href="single-product.htm">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins>$700.00</ins> <del>$100.00</del>
                                </div>
                            </div>
                            <div class="thubmnail-recent">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                                <h2><a href="single-product.htm">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins>$700.00</ins> <del>$100.00</del>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">
                                    <div id="customer_details" class="">
                                        <div class="col-3">
                                            <div class="woocommerce-billing-fields">
                                                <h3>Billing Details</h3>
                                                <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                    <label class="" for="billing_first_name">First Name <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
                                                </p>
                                                <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                                                    <label class="" for="billing_last_name">Last Name <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_last_name" name="billing_last_name" class="input-text ">
                                                </p>
                                                <div class="clear"></div>
                                                <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                    <label class="" for="billing_address_1">Address <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="Street address" id="billing_address_1" name="billing_address_1" class="input-text ">
                                                </p>
                                                <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                                                    <label class="" for="billing_city">Town / City <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="Town / City" id="billing_city" name="billing_city" class="input-text ">
                                                </p>
                                                <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                    <label class="" for="billing_state">County</label>
                                                    <input type="text" id="billing_state" name="billing_state" placeholder="State / County" value="" class="input-text ">
                                                </p>
                                                <div class="clear"></div>
                                                <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                    <label class="" for="billing_email">Email Address <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_email" name="billing_email" class="input-text ">
                                                </p>
                                                <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                    <label class="" for="billing_phone">Phone <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_phone" name="billing_phone" class="input-text ">
                                                </p>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <h3 id="order_review_heading">Your order</h3>
                                    <div id="order_review" style="position: relative;">
                                        <table class="shop_table">
                                            <thead>
                                                <tr>
                                                    <th class="product-name">Product</th>
                                                    <th class="product-total">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="cart_item">
                                                    <td class="product-name">
                                                        Ship Your Idea <strong class="product-quantity">× 1</strong> </td>
                                                    <td class="product-total">
                                                        <span class="amount">£15.00</span> </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr class="shipping">
                                                    <th>Shipping and Handling</th>
                                                    <td>
                                                        Free Shipping
                                                        <input type="hidden" class="shipping_method" value="free_shipping" id="shipping_method_0" data-index="0" name="shipping_method[0]">
                                                    </td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>Order Total</th>
                                                    <td><strong><span class="amount">£15.00</span></strong> </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                        <div id="payment">
                                            <div class="form-row place-order">
                                                <input type="submit" data-value="Place order" value="Place order" id="place_order" name="woocommerce_checkout_place_order" class="button alt">
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
