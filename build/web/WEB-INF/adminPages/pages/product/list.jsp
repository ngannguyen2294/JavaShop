<%-- 
    Document   : list
    Created on : Mar 17, 2017, 11:27:54 PM
    Author     : NGANNV
--%>

<%@page import="model.utils.Categories"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.utils.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id = "Products" class = "model.utils.Products" 
             scope = "page"/>
<html>
    <head>
        <title>Product List</title>
    </head>
    <body class="no-skin">
        <%@ include file="../header.jsp" %>

        <jsp:include page="../navbar.jsp"/>



        <div class="main-container ace-save-state" id="main-container">

            <jsp:include page="../sidebar.jsp"/>

            <div class="main-content">


                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-home home-icon"></i>
                                <a href="#">Home</a>
                            </li>

                            <li>
                                <a href="#">Tables</a>
                            </li>
                            <li class="active">Simple &amp; Dynamic</li>
                        </ul><!-- /.breadcrumb -->

                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="input-icon">
                                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                    <i class="ace-icon fa fa-search nav-search-icon"></i>
                                </span>
                            </form>
                        </div><!-- /.nav-search -->
                    </div>
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="header smaller lighter blue">All Products</h3>

                                <div class="clearfix">
                                    <div class="pull-right tableTools-container"></div>
                                </div>
                                <div class="table-header">
                                   Product List
                                </div>

                                <!-- div.table-responsive -->

                                <!-- div.dataTables_borderWrap -->
                                <div>



                                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th>STT</th>
                                                <th>Product Name</th>
                                                <th class="hidden-480">Supplier</th>

                                                <th>
                                                    <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                                                    Category
                                                </th>
                                                <th class="hidden-480">Quantity per Unit</th>

                                                <th> Unit Price</th>
                                                <th> Units In Stock</th>
                                                <th> Units On Order</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%                                                try {
                                                    List<Products> productlist = Products.getAllProductListInfor();
                                                    for (Products product : productlist) {
                                                        out.print("<tr>"
                                                                + "<td></td>"
                                                                + "<td>" + product.getProductNo() + "</td>"
                                                                + "<td>" + product.getProductName() + "</td>"
                                                                + "<td>" + product.getSuppliers().getCompanyName() + "</td>"
                                                                + "<td>" + product.getCategories().getCategoryName() + "</td>"
                                                                + "<td>" + product.getQuantityPerUnit() + "</td>"
                                                                + "<td>" + product.getUnitPrice() + "</td>"
                                                                + "<td>" + product.getUnitsInStock() + "</td>"
                                                                + "<td>" + product.getUnitsOnOrder() + "</td>"
                                                                + "</tr >");
                                                    }
                                                } catch (Exception ex) {
                                                    out.print(ex.toString());
                                                }
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>  </div> </div></div>
        </div>

    </body>
</html>
