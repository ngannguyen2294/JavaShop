<%-- 
    Document   : list
    Created on : Mar 17, 2017, 11:27:54 PM
    Author     : NGANNV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
    </head>
    <body class="no-skin">
              <%@ include file="pages/header.jsp" %>
            
                      <jsp:include page="pages/navbar.jsp"/>
                      
                   <jsp:useBean id = "Orders" class = "model.bussiness.OrderBussiness" 
                 scope = "page"/>       
  
        <div class="main-container ace-save-state" id="main-container">
      
            <jsp:include page="pages/sidebar.jsp"/>

            <div class="main-content">
      
          
                <div class="main-content-inner">
                          	<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>

							<li>
								<a href="#">Java Shop</a>
							</li>
							
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
                      
<div class="infobox infobox-pink">
											<div class="infobox-icon">
												<i class="ace-icon fa fa-shopping-cart"></i>
											</div>

											<div class="infobox-data">
												<span class="infobox-data-number">   <% out.print(Orders.GetPendingOrder()); %></span>
												<div class="infobox-content">new orders</div>
											</div>
											<div class="stat stat-important">4%</div>
										</div>
                    </div>  </div> </div></div>
        </div>
           
    </body>
</html>
