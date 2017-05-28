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
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
                            <li class="active"></li>
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
                                <h3 class="header smaller lighter blue">Order Details</h3>

                                <form id="orderForm" role="form" method="post"    enctype="multipart/form-data" action="../admin/updateOrder.htm">
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <input type="hidden" id="orderID" name="OrderID" value="${order.getOrderId()}"/>
                                            <label for="OrderID">Order ID</label>
                                            <input type="text" class="form-control"
                                                   id="orderID" name="OrderID" value="${order.getOrderId()}" disabled/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="customer">Customer</label>
                                            <input type="text" class="form-control"
                                                   id="customer" name="customer" value="${order.getCustomers().getCompanyName()}" disabled/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="employee">Employee</label>
                                            <input type="text" id="employee" name="employee" value="${order.getEmployees().getFirstName()}" class="form-control" disabled/>
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
                                        <div class="form-group col-md-6">
                                            <label for="status" class="col-md-2">Status</label>                                              
                                            <select class="col-md-4" id="status" name="status">
                                                <option value="Pending" ${order.getStatus() =='Pending' ? 'selected' : ''}> Pending</option>
                                                <option value="Processing" ${order.getStatus() =='Processing' ? 'selected' : ''} >Processing</option>
                                                <option value="Complete" ${order.getStatus() =='Complete' ? 'selected' : ''}>Complete</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">

                                    </div>
                                    <button type="submit" class="btn btn-primary" id="submit">Save</button>     </form> </div> 
                        </div>

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
                                <% int i = 0; %>
                                <c:forEach items="${order.getOrderdetailses()}" var="orderdetails">
                                    <tr>
                                        <td>   </td>
                                        <td> <% i++;
                                            out.print(i);%></td>
                                        <td>  ${orderdetails.getProducts().getProductName()} </td>
                                        <td>      ${orderdetails.getUnitPrice()}</td>
                                        <td>      ${orderdetails.getQuantity()}</td>
                                        <td>      ${orderdetails.getDiscount()}</td>
                                        <td>      ${orderdetails.getUnitPrice()*orderdetails.getQuantity()}</td>
                                    </tr>
                                </c:forEach>

                            </tbody> 

                        </table>
                    </div> 
                </div> 
            </div>  
        </div> 

        <script type="text/javascript">
            var myTable =
                    $('#dynamic-table').DataTable({
                "footerCallback": function (row, data, start, end, display) {
                    var api = this.api(), data;

                    // Remove the formatting to get integer data for summation
                    var intVal = function (i) {
                        return typeof i === 'string' ?
                                i.replace(/[\$,]/g, '') * 1 :
                                typeof i === 'number' ?
                                i : 0;
                    };

                    // Total over all pages
                    total = api
                            .column(6)
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);

                    // Total over this page
                    pageTotal = api
                            .column(6, {page: 'current'})
                            .data()
                            .reduce(function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);

                    // Update footer
                    $(api.column(6).footer()).html(
                            '$' + pageTotal + ' ( $' + total + ' total)'
                            );
                }
            });
            $('#dynamic-table').on('click', 'tr', function (e) {
                if ($(this).hasClass('selected')) {
                    //   $(this).removeClass('selected');
                } else {
                    myTable.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            }
            );
            $('.btn-ok').on('click', function (e) {
                var orderID = $('.selected').find('.deleteProduct').attr('orderid');
                $.ajax({
                    url: '../admin/deleteProduct.htm', // url where to submit the request
                    type: "POST", // type of action POST || GET

                    data: {orderID: orderID}, // post data || get data
                    success: function (result) {
                        var data = JSON.parse(result);
                        if (data.status == 'ok')
                        {
                            myTable.row('.selected').remove().draw(false);
                            $("#confirm-delete").modal('hide');
                        }
                    }})
            });
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
                    var th_checked = this.checked; //checkbox inside "TH" table header

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
                    var th_checked = this.checked; //checkbox inside "TH" table header

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
    </body>

</html>
