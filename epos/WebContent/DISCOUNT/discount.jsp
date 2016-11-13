<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>discount</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="../resources/css/bootstrap.css" />" rel="stylesheet">
<!--external css-->
<link href="<c:url value="../resources/font-awesome/css/font-awesome.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value="../resources/lineicons/style.css" />">
<!-- Custom styles for this template -->
<link href="<c:url value="../resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/style-responsive.css" />" rel="stylesheet">
<style>

a{
	color:#428bca;
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
						<a href="<%=request.getContextPath()%>/index.jsp"><img src="<c:url value="../resources/img/ui-sam.jpg"/>" class="img-circle" width="60"></a>
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
							<li><a href="<%=request.getContextPath()%>/EMPLOYEE/employee.jsp">員工資料維護</a></li>
							<li><a href="<%=request.getContextPath()%>/COMPANY/company.jsp">廠商資料維護</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-edit"></i> <span>進貨作業</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/REQUISITION/requisition.jsp">請購單維護</a></li>
							<li><a href="<%=request.getContextPath()%>/QUOTATION/quotation.jsp">詢價單維護</a></li>
							<li><a href="<%=request.getContextPath()%>/PURCHASE/pur.jsp">採購單維護</a></li>
							<li><a href="<%=request.getContextPath()%>/BILL_OF_PURCHASE/bop.jsp">進貨單維護</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="glyphicon glyphicon-shopping-cart"></i> <span>銷貨系統</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/VALUATION/valuation.jsp">報價單維護</a></li>
							<li><a href="<%=request.getContextPath()%>/ORDER/order.jsp">訂單維護</a></li>
							<li><a href="<%=request.getContextPath()%>/SHIPMENTS/shipments.jsp">出貨單維護</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-book"></i> <span>存貨作業</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/PRODUCT/product.jsp">商品管理</a></li>
							<li><a href="<%=request.getContextPath()%>/PROMOTING/promoting.jsp">促銷商品管理</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="glyphicon glyphicon-log-out"></i> <span>退貨作業</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/RETURNS/Return_Items.jsp">退貨品管理</a></li>
							<li><a href="<%=request.getContextPath()%>/RETURNS/ReturnList.jsp">退貨單管理</a></li>
							<li><a href="<%=request.getContextPath()%>/INVO/select_page.jsp">作廢發票管理</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class="active"> <i
							class="fa fa-usd"></i> <span>金流管理</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/SHIFTREPORT/shiftreport.jsp">班別報表維護</a></li>
							<li><a href="<%=request.getContextPath()%>/COUPON/coupon.jsp">折價券</a></li>
							<li class="active"><a href="<%=request.getContextPath()%>/DISCOUNT/discount.jsp">折扣管理</a></li>
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
		<section id="main-content"> <section class="wrapper"> 
	<div class="row mt">

	<nav class="nav navbar-default alert-info">
		<ul class="nav navbar-nav">
			<li id="search1"><a id="r_disc" target="search_disc.jsp" data-toggle="tab" href="#search"><span class="glyphicon glyphicon-search"></span>搜尋</a></li>
			<li id="import"><a id="c_disc" target="insertDic.jsp" data-toggle="tab" href="#new"><span class="glyphicon glyphicon-file"></span>新增</a></li>
			<li id="result"><a data-toggle="tab" href="#resolution"><span class="glyphicon glyphicon-list-alt" ></span>查詢結果</a></li>
			<li><a data-toggle="tab" href="#print" class="print"><span class="glyphicon glyphicon-print" ></span>列印</a></li>
		</ul>
	</nav>

		<div class="tab-content">
			<div id="search" class="tab-pane fade">
				<div class="chg_content"></div>
			</div>
			<div id="new" class="tab-pane fade">
				<div class="insert_content"></div>
			</div>
			<div id="resolution" class="tab-pane fade">
				<div class="form-panel">
					<h4 class="mb">
						<i class="fa fa-angle-right"></i> 查詢結果
					</h4>
					<div class="result-context"></div>
				</div>
			</div>
		</div>
	</div>
	</section> </section>

	</section>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script> 
	!window.jQuery && document.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
 	</script>

    <script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	<script class="include" type="text/javascript" src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
    <script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
    <script src="<c:url value="../resources/js/jquery.nicescroll.js" />" type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>
<script type="text/JavaScript">
	$(document).ready(function() {
		
		$('#r_disc').on('click', function() {						
			var updateweb = $(this).attr('target');
			$.get(updateweb, function(data) {
				$('.chg_content').html(data);
			})		
		})
		
		$('#c_disc').on('click', function() {						
			var insertweb = $(this).attr('target');
			$.get(insertweb, function(data) {
				$('.insert_content').html(data);
			})		
		})			
			
		$(".print").click(function() {
			window.print();
		})

	})
</script>
</body>
</html>