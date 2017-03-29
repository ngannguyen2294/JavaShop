<%-- 
    Document   : list
    Created on : Mar 17, 2017, 11:27:54 PM
    Author     : NGANNV
--%>
<%@page import="models.Suppliers"%>
<%@page import="models.Categories"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.Products"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id = "Products" class = "model.bussiness.ProductBussiness" 
             scope = "page"/>
<jsp:useBean id = "Supplier" class = "model.bussiness.SupplierBussiness" 
             scope = "page"/>
<jsp:useBean id = "Categories" class = "model.bussiness.CategoryBussiness" 
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
                                                <th>
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" />
                                                        <span class="lbl"></span>
                                                    </label>
                                                </th>
                                                <th>STT</th>
                                                <th>Product Name</th>
                                                <th>Supplier</th>

                                                <th>
                                                    <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                                                    Category
                                                </th>
                                                <th>Quantity per Unit</th>

                                                <th> Unit Price</th>
                                                <th> Units In Stock</th>
                                                <th> Units On Order</th>
                                                <th>Image</th>  
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:set var="root" value="${request.contextPath}/" />
                                        <%                                                try {
                                                List<Products> productlist = Products.getAllProductListInfor();
                                                int i=0;
                                                for (Products product : productlist) {
                                                    out.print("<tr>"
                                                            + "<td></td>"
                                                            + "<td>"+(i++)+"</td>"
                                                            + "<td>" + product.getProductName() + "</td>"
                                                            + "<td id='" + product.getCategories().getCategoryId() + "'>" + product.getSuppliers().getCompanyName() + "</td>"
                                                            + "<td>" + product.getCategories().getCategoryName() + "</td>"
                                                            + "<td>" + product.getQuantityPerUnit() + "</td>"
                                                            + "<td>" + product.getUnitPrice() + "</td>"
                                                            + "<td>" + product.getUnitsInStock() + "</td>"
                                                            + "<td>" + product.getUnitsOnOrder() + "</td>"
                                                            + "<td><img id='productImage' src='.." + product.getImage()+ "' height='70' width='70' onclick='showImage(this)'/></td>"
                                                            + "<td id='" + product.getProductId() + "' onclick='showModalEdit(this)'><a href='#' class='tooltip-success' data-rel='tooltip' title='Edit'><span class='green'><i class='ace-icon fa fa-pencil-square-o bigger-120'></i></span></a></td>"
                                                            + "<td><a href='#' class='tooltip-error' data-rel='tooltip' title='Delete'><span class='red'><i class='ace-icon fa fa-trash-o bigger-120'></i></span></a></td>"
                                                            + "</tr>");
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
        <div id="imageModal" class="modal2">
            <span class="close" id="closeImage">&times;</span>
            <img class="modal-content2" id="img01">
            <div id="caption"></div>
        </div>

        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" 
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <button type="button" class="close" 
                                data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            Edit Product
                        </h4>
                    </div>

                    <!-- Modal Body -->
                    <div class="modal-body">

                        <form role="form">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <input type="hidden" id="productID"/>
                                    <label for="productName">Product Name</label>
                                    <input type="text" class="form-control"
                                           id="productName"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="supplier">Supplier</label>
                                    <select id="supplier" class="form-control">
                                        <% List<Suppliers> supplierList = Supplier.getAllSupplier();
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
                                    <select id="category" class="form-control">
                                        <% List<Categories> categoriesList = Categories.getAllCategories();
                                            for (Categories cate : categoriesList) {
                                                out.print("<option catID='" + cate.getCategoryId() + "'>" + cate.getCategoryName() + "</option>");
                                            }
                                        %>              

                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="quantityperunit">Quantity per Unit</label>
                                    <input type="text" id="quantityperunit" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="unitprice">Unit Price</label>
                                    <input type="text" id="unitprice" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="unitinstock">Units In Stock</label>
                                    <input type="text" id="unitinstock" class="form-control"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="unitonorder">Units On Orders</label>
                                    <input type="text" id="unitonorder" class="form-control"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="image">Image</label>
                                    <input type="file" name="pic" accept="image/*">
                                </div>
                            </div>
                            <div class="row">

                                <div class="form-group col-md-12">
                                    <label for="image">Image</label>
                                    <div id="image"></div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">
                            Close
                        </button>
                        <button type="button" class="btn btn-primary">
                            Save changes
                        </button>
                    </div>
                </div>
            </div>
        </div>



        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            var myTable =
                    $('#dynamic-table').DataTable();
            function showModalEdit(obj)
            {
                var productID = obj.id;
                $('#editModal').modal('show');
                var table = $('#dynamic-table').DataTable();
                $('#dynamic-table').on('click', 'tr', function () {
                    var data = table.row(this).data();
                    $("#productID").val(productID);
                    $("#productName").val(data[2]);
                    $("#supplier").val(data[3]);
                    $("#category").val(data[4]);
                    $("#quantityperunit").val(data[5]);
                    $("#unitprice").val(data[6]);
                    $("#unitinstock").val(data[7]);
                    $("#unitonorder").val(data[8]);
                    $("#image").html(data[9]).attr("disabled", "true");
                    ;

                });
            }

            jQuery(function ($) {
                //initiate dataTables plugin
                $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

                new $.fn.dataTable.Buttons(myTable, {
                    buttons: [
                        {
                            "extend": "colvis",
                            "text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
                            "className": "btn btn-white btn-primary btn-bold",
                            columns: ':not(:first):not(:last)'
                        },
                        {
                            "extend": "copy",
                            "text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
                            "className": "btn btn-white btn-primary btn-bold"
                        },
                        {
                            "extend": "csv",
                            "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
                            "className": "btn btn-white btn-primary btn-bold"
                        },
                        {
                            "extend": "excel",
                            "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
                            "className": "btn btn-white btn-primary btn-bold"
                        },
                        {
                            "extend": "pdf",
                            "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
                            "className": "btn btn-white btn-primary btn-bold"
                        },
                        {
                            "extend": "print",
                            "text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
                            "className": "btn btn-white btn-primary btn-bold",
                            autoPrint: false,
                            message: 'This print was produced using the Print button for DataTables'
                        }
                    ]
                });
                myTable.buttons().container().appendTo($('.tableTools-container'));

                //style the message box
                var defaultCopyAction = myTable.button(1).action();
                myTable.button(1).action(function (e, dt, button, config) {
                    defaultCopyAction(e, dt, button, config);
                    $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
                });


                var defaultColvisAction = myTable.button(0).action();
                myTable.button(0).action(function (e, dt, button, config) {

                    defaultColvisAction(e, dt, button, config);


                    if ($('.dt-button-collection > .dropdown-menu').length == 0) {
                        $('.dt-button-collection')
                                .wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
                                .find('a').attr('href', '#').wrap("<li />")
                    }
                    $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
                });

                ////

                setTimeout(function () {
                    $($('.tableTools-container')).find('a.dt-button').each(function () {
                        var div = $(this).find(' > div').first();
                        if (div.length == 1)
                            div.tooltip({container: 'body', title: div.parent().text()});
                        else
                            $(this).tooltip({container: 'body', title: $(this).text()});
                    });
                }, 500);





                myTable.on('select', function (e, dt, type, index) {
                    if (type === 'row') {
                        $(myTable.row(index).node()).find('input:checkbox').prop('checked', true);
                    }
                });
                myTable.on('deselect', function (e, dt, type, index) {
                    if (type === 'row') {
                        $(myTable.row(index).node()).find('input:checkbox').prop('checked', false);
                    }
                });




                /////////////////////////////////
                //table checkboxes
                $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

                //select/deselect all rows according to table header checkbox
                $('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function () {
                    var th_checked = this.checked;//checkbox inside "TH" table header

                    $('#dynamic-table').find('tbody > tr').each(function () {
                        var row = this;
                        if (th_checked)
                            myTable.row(row).select();
                        else
                            myTable.row(row).deselect();
                    });
                });

                //select/deselect a row when the checkbox is checked/unchecked
                $('#dynamic-table').on('click', 'td input[type=checkbox]', function () {
                    var row = $(this).closest('tr').get(0);
                    if (this.checked)
                        myTable.row(row).deselect();
                    else
                        myTable.row(row).select();
                });



                $(document).on('click', '#dynamic-table .dropdown-toggle', function (e) {
                    e.stopImmediatePropagation();
                    e.stopPropagation();
                    e.preventDefault();
                });



                //And for the first simple table, which doesn't have TableTools or dataTables
                //select/deselect all rows according to table header checkbox
                var active_class = 'active';
                $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
                    var th_checked = this.checked;//checkbox inside "TH" table header

                    $(this).closest('table').find('tbody > tr').each(function () {
                        var row = this;
                        if (th_checked)
                            $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                        else
                            $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
                    });
                });

                //select/deselect a row when the checkbox is checked/unchecked
                $('#simple-table').on('click', 'td input[type=checkbox]', function () {
                    var $row = $(this).closest('tr');
                    if ($row.is('.detail-row '))
                        return;
                    if (this.checked)
                        $row.addClass(active_class);
                    else
                        $row.removeClass(active_class);
                });



                /********************************/
                //add tooltip for small view action buttons in dropdown menu
                $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

                //tooltip placement on right or left
                function tooltip_placement(context, source) {
                    var $source = $(source);
                    var $parent = $source.closest('table')
                    var off1 = $parent.offset();
                    var w1 = $parent.width();

                    var off2 = $source.offset();
                    //var w2 = $source.width();

                    if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
                        return 'right';
                    return 'left';
                }




                /***************/
                $('.show-details-btn').on('click', function (e) {
                    e.preventDefault();
                    $(this).closest('tr').next().toggleClass('open');
                    $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                });
                /***************/





                /**
                 //add horizontal scrollbars to a simple table
                 $('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
                 {
                 horizontal: true,
                 styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
                 size: 2000,
                 mouseWheelLock: true
                 }
                 ).css('padding-top', '12px');
                 */


            }
            )
        </script>
        <style>
            #productImage {
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            #productImage:hover {opacity: 0.7;}

            /* The Modal (background) */
            .modal2 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
            }

            /* Modal Content (image) */
            .modal-content2 {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
            }

            /* Caption of Modal Image */
            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            /* Add Animation */
            .modal-content2, #caption {    
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @-webkit-keyframes zoom {
                from {-webkit-transform:scale(0)} 
                to {-webkit-transform:scale(1)}
            }

            @keyframes zoom {
                from {transform:scale(0)} 
                to {transform:scale(1)}
            }

            /* The Close Button */
            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

            /* 100% Image Width on Smaller Screens */
            @media only screen and (max-width: 700px){
                .modal-content {
                    width: 100%;
                }
            }
        </style>




        <script>
            function showImage(obj)
            {
                // Get the modal
                var modal = document.getElementById('imageModal');

                // Get the image and insert it inside the modal - use its "alt" text as a caption

                var modalImg = document.getElementById("img01");
                var captionText = document.getElementById("caption");
                modal.style.display = "block";
                modalImg.src = obj.src;
                captionText.innerHTML = obj.alt;

                // Get the <span> element that closes the modal

            }


            // When the user clicks on <span> (x), close the modal
            $("#closeImage").click(function () {
                $("#imageModal").css("display", "none");
            });
        </script>
    </body>
</html>
