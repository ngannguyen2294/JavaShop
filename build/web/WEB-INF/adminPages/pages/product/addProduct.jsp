<%-- 
    Document   : addProduct
    Created on : May 17, 2017, 11:22:09 PM
    Author     : NGANNV
--%>

<%@page import="java.util.function.Supplier"%>
<%@page import="models.Suppliers"%>
<%@page import="java.util.List"%>
<%@page import="models.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id = "Products" class = "model.bussiness.ProductBussiness" 
                 scope = "page"/>
    <jsp:useBean id = "Supplier" class = "model.bussiness.SupplierBussiness" 
                 scope = "page"/>
    <jsp:useBean id = "Categories" class = "model.bussiness.CategoryBussiness" 
                 scope = "page"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
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
                                <h3 class="header smaller lighter blue">Add Product</h3>

                                <form id="productform" role="form" method="post"    enctype="multipart/form-data" action="../admin/addProductAction.htm">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input type="hidden" id="productID" name="productID"/>
                                            <label for="productName">Product Name</label>
                                            <input type="text" class="form-control"
                                                   id="productName" name="productName" required/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="supplier">Supplier</label>

                                            <% List<Suppliers> supplierList = Supplier.getAllSupplier(); %>
                                            <input type="hidden" value="<% out.print(supplierList.get(0).getSupplierId()); %>" name="supplierID" id="supplierID"/>
                                            <select id="supplier" class="form-control" onchange="selectSupplier(this)">
                                                <%
                                                    for (Suppliers sup : supplierList) {
                                                        out.print("<option supID='" + sup.getSupplierId() + "'>" + sup.getCompanyName() + "</option>");
                                                    }
                                                %>              


                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="category">Category</label>
                                            <% List<Categories> categoriesList = Categories.getAllCategories(); %>
                                            <input type="hidden" value="<% out.print(categoriesList.get(0).getCategoryId());%>" name="categoryID" id="categoryID"/>
                                            <select id="category" class="form-control" onchange="selectCate(this)">
                                                <%
                                                    for (Categories cate : categoriesList) {
                                                        out.print("<option cateID='" + cate.getCategoryId() + "'>" + cate.getCategoryName() + "</option>");
                                                    }
                                                %>              

                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="quantityperunit">Quantity per Unit</label>
                                            <input type="text" id="quantityperunit" name="quantityPerUnit" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="unitprice">Unit Price</label>
                                            <input type="text" id="unitprice" name="unitPrice" class="form-control"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="unitinstock">Units In Stock</label>
                                            <input type="text" id="unitinstock" name="unitsInStock" name="unitinstock" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="unitonorder">Units On Orders</label>
                                            <input type="text" id="unitonorder"  name="unitsOnOrder" class="form-control"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="file">Image</label>
                                            <input type="hidden" name="image" id="imagePath"/>
                                            <input id="imageFile" type="file" name="file" accept="image/*"  required>


                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="form-group col-md-12">
                                            <label for="image">Image</label>
                                            <img class="img-responsive" id="image" src=""/>
                                        </div>
                                    </div>
                            </div>
                            <button type="submit" class="btn btn-primary" id="submit">Save</button>     </form> </div>  </div>  </div>  </div>  </div> 
    </body>
    <script>
        function uploadImage() {
            var data = new FormData();
            data.append('file', $('#imageFile')[0].files[0]);
            $.ajax({
                url: '../image/upload.htm', // url where to submit the request
                type: "POST", // type of action POST || GET
                enctype: 'multipart/form-data',
                processData: false, // tell jQuery not to process the data
                contentType: false, // tell jQuery not to set contentType
                data: data, // post data || get data
                success: function (data) {
                    $("#imagePath").val(data);
                    $("#image").attr('src', "../" + data);
                }
            })
        }
        function selectCate(obj)
        {
            $("#categoryID").val(($(obj).find(":selected").attr("cateID")));
        }
        function selectSupplier(obj)
        {
            $("#supplierID").val(($(obj).find(":selected").attr("supID")));
        }
    </script>
</html>
