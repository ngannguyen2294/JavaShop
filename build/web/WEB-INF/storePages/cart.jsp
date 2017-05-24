<%-- 
    Document   : cart
    Created on : May 24, 2017, 5:22:22 PM
    Author     : luan.nt
--%>

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
                                    <li class="dropdown active">
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
                                <li><a href="#">Cart</a></li>
                                <li><a href="#">Checkout</a></li>
                            </ul>         
                        </div>  
                    </div>
                </div>
            </div>
        </div> <!-- End mainmenu area -->
        <!--banner-->
        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Shopping Cart</h2>
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
                            <h2 class="sidebar-title">Recent Posts</h2>
                            <%
                                List<Products> productNew = ProductDAO.GetProductNew();
                                for (Products itemProductNew : productNew) {
                            %>
                            <div class="thubmnail-recent">
                                <img src="<%=itemProductNew.getImage()%>" class="recent-thumb" alt="">
                                <h2><a href="product.htm?category=<%=itemProductNew.getCategories().getCategoryId()%>&product=<%=itemProductNew.getProductId()%>"><%=itemProductNew.getProductName()%></a></h2>
                                <div class="product-sidebar-price">
                                    <ins>
                                        <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=itemProductNew.getUnitPriceSale()%>" /><u>đ</u>
                                    </ins>
                                    <del>
                                        <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=itemProductNew.getUnitPrice()%>" /><u>đ</u>
                                    </del>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <form method="post" action="#">
                                    <table cellspacing="0" class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-remove">&nbsp;</th>
                                                <th class="product-thumbnail">&nbsp;</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="cart_item">
                                                <td class="product-remove">
                                                    <a title="Remove this item" class="remove" href="#">×</a>
                                                </td>
                                                <td class="product-thumbnail">
                                                    <a href="single-product.htm"><img width="145" height="160" alt="poster_1_up" class="shop_thumbnail" src="img/product-thumb-2.jpg"></a>
                                                </td>
                                                <td class="product-name">
                                                    <a href="single-product.htm">Ship Your Idea</a>
                                                </td>
                                                <td class="product-price">
                                                    <span class="amount">£15.00</span>
                                                </td>
                                                <td class="product-quantity">
                                                    <div class="quantity buttons_added">
                                                        <input type="button" class="minus" value="-">
                                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1" min="0" step="1">
                                                        <input type="button" class="plus" value="+">
                                                    </div>
                                                </td>
                                                <td class="product-subtotal">
                                                    <span class="amount">£15.00</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="actions" colspan="6">
                                                    <input type="submit" value="Update Cart" name="update_cart" class="button">
                                                    <input type="submit" value="Checkout" name="proceed" class="checkout-button button alt wc-forward">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                                <div class="cart-collaterals">
                                    <div class="cross-sells">
                                        <h2>You may be interested in...</h2>
                                        <ul class="products">
                                            <li class="product">
                                                <a href="single-product.htm">
                                                    <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/product-2.jpg">
                                                    <h3>Ship Your Idea</h3>
                                                    <span class="price"><span class="amount">£20.00</span></span>
                                                </a>
                                                <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.htm">Select options</a>
                                            </li>
                                            <li class="product">
                                                <a href="single-product.htm">
                                                    <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/product-4.jpg">
                                                    <h3>Ship Your Idea</h3>
                                                    <span class="price"><span class="amount">£20.00</span></span>
                                                </a>
                                                <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="single-product.htm">Select options</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="cart_totals ">
                                        <h2>Cart Totals</h2>
                                        <table cellspacing="0">
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>Cart Subtotal</th>
                                                    <td><span class="amount">£15.00</span></td>
                                                </tr>
                                                <tr class="shipping">
                                                    <th>Shipping and Handling</th>
                                                    <td>Free Shipping</td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>Order Total</th>
                                                    <td><strong><span class="amount">£15.00</span></strong> </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <form method="post" action="#" class="shipping_calculator">
                                        <h2><a class="shipping-calculator-button" data-toggle="collapse" href="#calcalute-shipping-wrap" aria-expanded="false" aria-controls="calcalute-shipping-wrap">Calculate Shipping</a></h2>
                                        <section id="calcalute-shipping-wrap" class="shipping-calculator-form collapse">
                                            <p class="form-row form-row-wide">
                                                <select rel="calc_shipping_state" class="country_to_state" id="calc_shipping_country" name="calc_shipping_country">
                                                    <option value="">Select a country…</option>
                                                    <option value="AX">Islands</option>
                                                    <option value="AF">Afghanistan</option>
                                                    <option value="AL">Albania</option>
                                                    <option value="DZ">Algeria</option>
                                                    <option value="AD">Andorra</option>
                                                    <option value="AO">Angola</option>
                                                </select>
                                            </p>
                                            <p class="form-row form-row-wide"><input type="text" id="calc_shipping_state" name="calc_shipping_state" placeholder="State / county" value="" class="input-text"> </p>
                                            <p class="form-row form-row-wide"><input type="text" id="calc_shipping_postcode" name="calc_shipping_postcode" placeholder="Postcode / Zip" value="" class="input-text"></p>
                                            <p><button class="button" value="1" name="calc_shipping" type="submit">Update Totals</button></p>
                                        </section>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
