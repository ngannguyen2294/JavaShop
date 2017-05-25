<%-- 
    Document   : cart
    Created on : May 24, 2017, 5:22:22 PM
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
                                <li><a href="cart.htm">Cart</a></li>
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
                                                <th class="product-subtotal">Price Sale</th>
                                                <th class="product-quantity">Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (Map.Entry<Integer, CartItem> list : cart.getCartItems().entrySet()) {
                                            %>
                                            <tr class="cart_item">
                                                <td class="product-remove">
                                                    <a title="Remove this item" class="remove" href="removeCart.htm?productid=<%=list.getValue().getProduct().getProductId()%>">×</a>
                                                </td>
                                                <td class="product-thumbnail">
                                                    <a href="product.htm?category=<%=list.getValue().getProduct().getCategories().getCategoryId()%>&product=<%=list.getValue().getProduct().getProductId()%>"><img width="145" height="160" alt="poster_1_up" class="shop_thumbnail" src="<%=list.getValue().getProduct().getImage()%>"></a>
                                                </td>
                                                <td class="product-name">
                                                    <a href="product.htm?category=<%=list.getValue().getProduct().getCategories().getCategoryId()%>&product=<%=list.getValue().getProduct().getProductId()%>"><%=list.getValue().getProduct().getProductName()%></a>
                                                </td>
                                                <td class="product-price">
                                                    <span class="amount">
                                                        <del>
                                                            <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=list.getValue().getProduct().getUnitPrice()%>" /><u>đ</u>
                                                        </del>
                                                    </span>
                                                </td>
                                                <td class="product-subtotal">
                                                    <span class="amount">
                                                        <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=list.getValue().getProduct().getUnitPriceSale()%>" /><u>đ</u>
                                                    </span>
                                                </td>
                                                <td class="product-quantity">
                                                    <form id="editCart" action="editCart.htm" method="post" class="">
                                                        <div class="quantity buttons_added">
                                                            <button type="button" class="minus" name="minus">-</button>
                                                            <input type="text" size="1" class="input-text qty text" title="Qty" name = "value" value="<%=list.getValue().getQuantity()%>" min="0" step="1" readonly>
                                                            <button type="button" class="plus" name="plus">+</button>
                                                            <input class="productid" type="hidden" id="<%=list.getValue().getProduct().getProductId()%>" value="<%=list.getValue().getProduct().getProductId()%>" name="productid" >
                                                        </div>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
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
                                    <div class="cart_totals ">
                                        <h2>Cart Totals</h2>
                                        <table cellspacing="0">
                                            <tbody>
                                                <tr class="cart-subtotal">
                                                    <th>Cart Subtotal</th>
                                                    <td>
                                                        <span id="total" class="total amount">
                                                            <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=cart.total()%>" /><u>đ</u>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr class="shipping">
                                                    <th>Shipping and Handling</th>
                                                    <td>Free Shipping</td>
                                                </tr>
                                                <tr class="order-total">
                                                    <th>Order Total</th>
                                                    <td><strong>
                                                            <span id="total" class="total amount">
                                                                <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=cart.total()%>" /><u>đ</u>
                                                            </span>
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.minus').click(function () {
                    var getqty = $(this).closest('.quantity').find('.qty');
                    var getid  = $(this).closest('.quantity').find('.productid');
                    var minusqty = parseInt(getqty.val()) - 1;
                    if (minusqty <= 0) {
                        minusqty = 1
                        getqty.val(1);
                    }
                    getqty.val(minusqty);
                    var productid = getid.val();
                    $.post("editCart.htm", {productid: productid, value: minusqty}, function (data) {
                        $('.total').html(data + "<u>đ</u>");
                    });
                });
                $('.plus').click(function () {
                    var getqty = $(this).closest('.quantity').find('.qty');
                    var getid  = $(this).closest('.quantity').find('.productid');
                    var plusqty = parseInt(getqty.val()) + 1;
                    getqty.val(plusqty);

                    var productid = getid.val();
                    $.post("editCart.htm", {productid: productid, value: plusqty}, function (data) {
                        $('.total').html(data + "<u>đ</u>");
                    });
                });
            });
        </script>
    </body>
</html>
