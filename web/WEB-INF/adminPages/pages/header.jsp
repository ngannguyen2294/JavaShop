<%-- 
    Document   : header
    Created on : Mar 12, 2017, 11:09:21 PM
    Author     : NGANNV
--%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Dashboard - Ace Admin</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="../css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="../css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
        <link rel="stylesheet" href="../css/ace-part2.min.css" class="ace-main-stylesheet" />
<![endif]-->
<link rel="stylesheet" href="../css/ace-skins.min.css" />
<link rel="stylesheet" href="../css/ace-rtl.min.css" />

<!--[if lte IE 9]>
  <link rel="stylesheet" href="../css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="../js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="../js/html5shiv.min.js"></script>
<script src="../js/respond.min.js"></script>
<![endif]-->
<%
    Cookie[] cookies = request.getCookies();
    boolean isLogin = false;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                isLogin = true;
            }
        }
    }
    if (!isLogin) {
        response.sendRedirect("../admin/login.htm");
    }
%>

 <!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="../js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="../js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="../js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="../js/jquery.dataTables.min.js"></script>
		<script src="../js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="../js/dataTables.buttons.min.js"></script>
		<script src="../js/buttons.flash.min.js"></script>
		<script src="../js/buttons.html5.min.js"></script>
		<script src="../js/buttons.print.min.js"></script>
		<script src="../js/buttons.colVis.min.js"></script>
		<script src="../js/dataTables.select.min.js"></script>

		<!-- ace scripts -->
		<script src="../js/ace-elements.min.js"></script>
		<script src="../js/ace.min.js"></script>
