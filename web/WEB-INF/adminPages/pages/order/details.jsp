<%-- 
    Document   : addProduct
    Created on : May 17, 2017, 11:22:09 PM
    Author     : NGANNV
--%>

<%@page import="models.Orderdetails"%>
<%@page import="java.util.List"%>
<%@page import="models.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id = "Products" class = "model.bussiness.ProductBussiness" 
                 scope = "page"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
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
                                <a href="#">Admin</a>
                            </li>

                            <li>
                                <a href="#">Order</a>
                            </li>
                            <li class="active">Order Details</li>
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
                                <h3 class="header smaller lighter blue">Add Product</h3>

                                <form id="orderForm" role="form" method="post"    enctype="multipart/form-data" action="../admin/addProductAction.htm">
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <input type="hidden" id="orderID" name="productID"/>
                                            <label for="orderID">Order ID</label>
                                            <input type="text" class="form-control"
                                                   id="orderID" name="orderID" value="${order.getOrderId()}" disabled/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="customer">Customer</label>
                                            <input type="text" class="form-control"
                                                   id="customer" name="customer" value="${order.getCustomers().getCompanyName()}"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="employee">Employee</label>
                                            <input type="text" id="employee" name="employee" value="${order.getEmployees().getFirstName()}" class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="form-group col-md-4">
                                            <label for="orderdate">Order Date</label>
                                            <input type="date" id="orderdate" name="orderdate" value="${order.getOrderDate()}" class="form-control"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="shipaddress">Ship Address</label>
                                            <input type="text" id="shipaddress"  name="shipaddress" value="${order.getShipAddress()}" class="form-control"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="shipcity">Ship City</label>
                                            <input type="text" id="shipcity"  name="shipcity" value="${order.getShipCity()}" class="form-control"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="status" class="col-md-2">Status</label>                                              
                                            <select class="col-md-3" id="status" name="status">
                                                <option value="Pending" ${order.getStatus() =='Pending' ? 'selected' : ''}> Pending</option>
                                                <option value="Processing" ${order.getStatus() =='Processing' ? 'selected' : ''} >Processing</option>
                                                <option value="Complete" ${order.getStatus() =='Complete' ? 'selected' : ''}>Complete</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">

                                    </div>

                            </div>
                            <button type="submit" class="btn btn-primary" id="submit">Save</button>     </form> </div> 
                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th>No.</th>
                                    <th>Product</th>
                                    <th>Price</th>

                                    <th>Quantity</th>
                                    <th>Discount</th> 
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${order.getOrderdetailses()}" var="orderdetails">
                                <tr>  <td>1</td>  
                              </tr>
                            </c:forEach>
                            </tbody> 
                        </table>
                    </div> 
                </div> 
            </div>  
        </div> 
    </body>

</html>
