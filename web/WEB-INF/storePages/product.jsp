<%-- 
    Document   : product
    Created on : Apr 27, 2017, 11:45:34 AM
    Author     : luan.nt
--%>

<%@page import="models.Products"%>
<%@page import="models.Categories"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<jsp:useBean id = "ProductDAO" class = "model.bussiness.ProductBussiness" 
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
            </div> <!-- End mainmenu area -->
            <!--banner-->
            <div class="product-big-title-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-bit-title text-center">
                                <%
                                    String cateid = "";
                                    String productid = "";
                                    if (request.getParameter("category") != null) {
                                        cateid = request.getParameter("category");
                                    }
                                    if (request.getParameter("product") != null) {
                                        productid = request.getParameter("product");
                                    }
                                    List<Products> product = ProductDAO.GetProductByID(productid);
                                    Products currentProduct = product.get(0);
                                    Categories category = new Categories();
                                    for (Categories c : cate) {
                                        if (c.getCategoryId() == Integer.parseInt(cateid)) {
                                            category = c;
                                        }
                                    }
                                %>
                                <h2><%=category.getCategoryName()%></h2>
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
                                <div class="product-breadcroumb">
                                    <a href="home.htm">Home</a>
                                    <a href="shop.htm?category=<%=category.getCategoryId()%>"><%=category.getCategoryName()%></a>
                                    <a href="product.htm?category=<%=currentProduct.getCategories().getCategoryId()%>&product=<%=currentProduct.getProductId()%>"><%=currentProduct.getProductName()%></a>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="product-images">
                                            <div class="product-main-img">
                                                <img src="<%=currentProduct.getImage()%>" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="product-inner">
                                            <h2 class="product-name"><%=currentProduct.getProductName()%></h2>
                                            <div class="product-inner-price">
                                                <ins>
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=currentProduct.getUnitPriceSale()%>" /><u>đ</u>
                                                </ins>
                                                <del>
                                                    <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "<%=currentProduct.getUnitPrice()%>" /><u>đ</u>
                                                </del>
                                            </div>
                                            <form action="addCart.htm" method="post" class="cart">
                                                <div class="quantity">
                                                    <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
                                                </div>
                                                <input class="productid" type="hidden" value="<%=currentProduct.getProductId()%>" name="productid" >
                                                <button class="add_to_cart_button" type="button">Add to cart</button>
                                            </form>
                                            <div class="product-inner-category">
                                                <p>Category: <a href=""><%=currentProduct.getCategories().getCategoryName()%></a></p>
                                            </div>
                                            <div role="tabpanel">
                                                <ul class="product-tab" role="tablist">
                                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                        <h2>Product Description</h2>
                                                        <p><%=currentProduct.getDescription()%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="related-products-wrapper">
                                    <h2 class="related-products-title">Related Products</h2>
                                    <div class="related-products-carousel">

                                        <%
                                            for (Products itemProductNew : productNew) {
                                        %>
                                        <div class="single-product">
                                            <div class="product-f-image">
                                                <img src="<%=itemProductNew.getImage()%>" alt="">
                                                <div class="product-hover">
                                                    <a href="" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                                    <a href="product.htm?category=<%=itemProductNew.getCategories().getCategoryId()%>&product=<%=itemProductNew.getProductId()%>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                                </div>
                                            </div>
                                            <h2><a href="product.htm?category=<%=itemProductNew.getCategories().getCategoryId()%>&product=<%=itemProductNew.getProductId()%>"><%=itemProductNew.getProductName()%></a></h2>
                                            <div class="product-carousel-price">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('.add_to_cart_button').click(function () {
                        var getqty = $(this).closest('.cart').find('.qty');
                        var getid = $(this).closest('.cart').find('.productid');
                        var qty = getqty.val();
                        var productid = getid.val();
                        $.post("addCart.htm", {productid: productid, quantity: qty}, function (data) {
                            var obj = jQuery.parseJSON(data);
                            $('.total').html(obj.price + "<u>đ</u>");
                            $('.product-count').html(obj.total);
                            alert(obj.mes);
                        });
                    });
                });
            </script>
    </body>
</html>
