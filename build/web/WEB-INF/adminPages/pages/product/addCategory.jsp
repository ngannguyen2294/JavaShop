<%-- 
    Document   : addCategory
    Created on : May 17, 2017, 11:22:09 PM
    Author     : NGANNV
--%>

<%@page import="models.Suppliers"%>
<%@page import="java.util.List"%>
<%@page import="models.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:useBean id = "Categories" class = "model.bussiness.CategoryBussiness" 
                 scope = "page"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
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
                                <a href="#">Category</a>
                            </li>
                            <li class="active">Add New Category</li>
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
                                <h3 class="header smaller lighter blue">Add Category</h3>

                                <form id="productform" role="form" method="post"    enctype="multipart/form-data" action="../admin/addCategoryAction.htm">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input type="hidden" id="productID" name="productID"/>
                                            <label for="cateName">Category Name</label>
                                            <input type="text" class="form-control"
                                                   id="cateName" name="cateName" required/>
                                        </div>
                                       <div class="form-group col-md-6">
                                            <label for="description">Description</label>
                                            <input type="text" id="description"  name="description" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                       
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
    </script>
</html>
