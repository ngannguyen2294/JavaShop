<%-- 
    Document   : home
    Created on : Mar 14, 2017, 8:44:49 AM
    Author     : luan.nt
--%>
<%@page import="models.Cart"%>
<%@page import="models.Products"%>
<%@page import="models.Categories"%>
<%@page import="java.util.List"%>
<%@page import="model.bussiness.ProductBussiness"%>
<%@page import="model.bussiness.CategoryBussiness"%>
<!DOCTYPE html>
<jsp:useBean id = "Products" class = "model.bussiness.ProductBussiness" 
             scope = "page"/>
<jsp:useBean id = "Categories" class = "model.bussiness.CategoryBussiness" 
             scope = "page"/>
<html>
    <head>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
                 pageEncoding="UTF-8"%>
        <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
        <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                                    <li class="active"><a href="home.htm">Home</a></li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="shop.htm">Category
                                            <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                        <%
                                            Cart cart = (Cart) session.getAttribute("cart");
                                            if (cart == null) {
                                                cart = new Cart();
                                                session.setAttribute("cart", cart);
                                            }
                                            List<Categories> cate = Categories.getAllCategories();
                                            for (Categories c : cate) {
                                        %>
                                        <li>
                                            <a href="shop.htm?category=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a>
                                        </li>
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

        <!-- Slider -->
        <jsp:include page="slide.jsp"></jsp:include>
            <!-- ./Slider -->

            <div class="promo-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo1">
                                <i class="fa fa-refresh"></i>
                                <p>30 Days return</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo2">
                                <i class="fa fa-truck"></i>
                                <p>Free shipping</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo3">
                                <i class="fa fa-lock"></i>
                                <p>Secure payments</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="single-promo promo4">
                                <i class="fa fa-gift"></i>
                                <p>New products</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- End promo area -->

            <div class="maincontent-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="latest-product">
                                <h2 class="section-title">Latest Products</h2>
                                <div class="product-carousel">
                                <%
                                    List<Products> productlist = Products.GetAllProduct();
                                    for (Products product : productlist) {
                                %>
                                <div class="single-product">
                                    <div class="product-f-image">
                                        <img src="<%=product.getImage()%>" alt="">
                                        <div class="product-hover">
                                            <a href="addCart.htm?command=plus&productid=<%=product.getProductId()%>" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                            <a href="product.htm?category=<%=product.getCategories().getCategoryId()%>&product=<%=product.getProductId()%>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                        </div>
                                    </div>
                                    <h2><a href="product.htm?category=<%=product.getCategories().getCategoryId()%>&product=<%=product.getProductId()%>"><%=product.getProductName()%></a></h2>
                                    <div class="product-carousel-price">
                                        <ins>
                                            <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=product.getUnitPriceSale()%>" /><u>đ</u>
                                        </ins>
                                        <del>
                                            <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=product.getUnitPrice()%>" /><u>đ</u>
                                        </del>
                                    </div> 
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End main content area -->

        <div class="brands-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="brand-wrapper">
                            <div class="brand-list">
                                <img src="img/brand1.png" alt="">
                                <img src="img/brand2.png" alt="">
                                <img src="img/brand3.png" alt="">
                                <img src="img/brand4.png" alt="">
                                <img src="img/brand5.png" alt="">
                                <img src="img/brand6.png" alt="">
                                <img src="img/brand1.png" alt="">
                                <img src="img/brand2.png" alt="">                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End brands area -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
