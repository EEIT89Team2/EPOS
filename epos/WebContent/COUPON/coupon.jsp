<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>coupon</title>
<!-- Bootstrap core CSS -->
<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">
<!--external css-->
<link
	href="<c:url value="../resources/font-awesome/css/font-awesome.css" />"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="../resources/lineicons/style.css" />">
<!-- Custom styles for this template -->
<link href="<c:url value="../resources/css/style.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/style-responsive.css" />"
	rel="stylesheet">
<style>
 	.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus{
 		background: #f3a827;
 	}
	.navbar-default{
		background: #FFE4B5;
		border-color:#FF59FF;
		border-radius: 8px;
	}

 	.main{ 
 		height: 750px; 
 		border-radius: 8px; 
 		background:#FFF8DC; 
 	} 
</style>	
</head>

<body>
	<section id="container"> 
	<!--header start--> 
	<header class="header black-bg">
	<div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!--logo start--> 
	<a href="<%=request.getContextPath()%>/index.jsp" class="logo"><b>ePOS</b></a> 
	<!--logo end-->

	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<li><a class="logout" href="login.html">Logout</a></li>
		</ul>
	</div>
	</header> 
	<!--header end--> 
	<!--sidebar start--> 
	<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered">
				<a href="<%=request.getContextPath()%>/index.jsp"><img
					src="<c:url value="../resources/img/ui-sam.jpg"/>"
					class="img-circle" width="60"></a>
			</p>
			<h5 class="centered">ePOS</h5>

			<li class="mt"><a href="<%=request.getContextPath()%>/index.jsp"> <i
					class="fa fa-dashboard"></i> <span>index</span>
			</a></li>

			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-desktop"></i> <span>基本資料維護</span>
			</a>
				<ul class="sub">
					<li><a href="<%=request.getContextPath()%>/MEMBER/member.jsp">會員資料維護</a></li>
					<li><a
						href="<%=request.getContextPath()%>/EMPLOYEE/employee.jsp">員工資料維護</a></li>
					<li><a
						href="<%=request.getContextPath()%>/COMPANY/company.jsp">廠商資料維護</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-edit"></i> <span>進貨作業</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/REQUISITION/requisition.jsp">請購單維護</a></li>
					<li><a
						href="<%=request.getContextPath()%>/QUOTATION/quotation.jsp">詢價單維護</a></li>
					<li><a href="<%=request.getContextPath()%>/PURCHASE/pur.jsp">採購單維護</a></li>
					<li><a
						href="<%=request.getContextPath()%>/BILL_OF_PURCHASE/bop.jsp">進貨單維護</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="glyphicon glyphicon-shopping-cart"></i> <span>銷貨系統</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/VALUATION/valuation.jsp">報價單維護</a></li>
					<li><a href="<%=request.getContextPath()%>/ORDER/order.jsp">訂單維護</a></li>
					<li><a
						href="<%=request.getContextPath()%>/SHIPMENTS/shipments.jsp">出貨單維護</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-book"></i> <span>存貨作業</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/PRODUCT/product.jsp">商品管理</a></li>
					<li><a
						href="<%=request.getContextPath()%>/PROMOTING/promoting.jsp">促銷商品管理</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="glyphicon glyphicon-log-out"></i> <span>退貨作業</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/RETURNS/Return_Items.jsp">退貨品管理</a></li>
					<li><a
						href="<%=request.getContextPath()%>/RETURNS/ReturnList.jsp">退貨單管理</a></li>
					<li><a
						href="<%=request.getContextPath()%>/INVO/select_page.jsp">作廢發票管理</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;" class="active"> <i
					class="fa fa-usd"></i> <span>金流管理</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/SHIFTREPORT/shiftreport.jsp">班別報表維護</a></li>
					<li class="active"><a href="<%=request.getContextPath()%>/COUPON/coupon.jsp">折價券</a></li>
					<li><a
						href="<%=request.getContextPath()%>/DISCOUNT/discount.jsp">折扣管理</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class=" fa fa-bar-chart-o"></i> <span>報表分析</span>
			</a>
				<ul class="sub">
					<li><a href="morris.html">Morris</a></li>
				</ul></li>

		</ul>
	<!-- sidebar menu end-->
	</div>
	</aside>
	<!--sidebar end--> 
	<section id="main-content"><section class="wrapper"> 
		<div class="row mt">
			<div class="col-lg-12">
			<div class="nav navbar-default">
				<div class="container-fluid" style="float: right; left: -50%; position: relative">
					<ul class="nav navbar-nav" style="float: left; left: 50%; position: relative">
						<li><a id="r_coup" target="search_cpon.jsp" href="#search_Cou"  data-toggle="tab"><span class="glyphicon glyphicon-search"></span>範圍查詢</a></li>
						<li><a id="c_coup" target="addCpon.jsp"  href="#new_Cou"  data-toggle="tab"><span class="glyphicon glyphicon-file"></span>新增</a></li>
						<li><a id="a_coup" target="all.jsp" href="#resolution_Cou"  data-toggle="tab"><span class="glyphicon glyphicon-list-alt" ></span>查詢全部</a></li>
						<li><a id="print" href="#print"  data-toggle="tab"><span class="glyphicon glyphicon-print" ></span>列印</a></li>
					</ul>
				</div>	
			</div>
	
<!--page include here -->		
				<div class="tab-content">
					<div id="search_Cou" class="tab-pane fade">
						<div class="chg_content main"></div>
					</div>
					<div id="new_Cou" class="tab-pane fade">
						<div class="insert_content main"></div>
					</div>
					<div id="resolution_Cou" class="tab-pane fade">
						<div class="result_content main"></div>
					</div>
				</div>	
			</div>
		</div>
		</section></section> 
	</section>
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery&& document.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>

	<script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	<script class="include" type="text/javascript"
		src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.nicescroll.js" />"
		type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>
	<script>
		$(function() {
			$('a').on('click', function() {
				if($(this).attr('target')=="addCpon.jsp"){							
					var includeWeb = $(this).attr('target');
					$.get(includeWeb, function(data) {
						$('.insert_content').html(data);
					})
				}else if($(this).attr('target')=="search_cpon.jsp"){
					var includeWeb = $(this).attr('target');
					$.get(includeWeb, function(data) {
						$('.chg_content').html(data);
					})	
				}else if($(this).attr('target')=="all.jsp"){
					var includeWeb = $(this).attr('target');
					$.get(includeWeb, function(data) {
						$('.result_content').html(data);
					})	
				}		
			})
			
		})
			$("#print").click(function() {
			window.print();
			})
	</script>
</body>
</html>
