<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap core CSS -->
<link href="<c:url value="../resources/css/bootstrap.css" />" rel="stylesheet">
<!--external css-->
<link href="<c:url value="../resources/font-awesome/css/font-awesome.css" />" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value="../resources/lineicons/style.css" />">
<!-- Custom styles for this template -->
<link href="<c:url value="../resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/style-responsive.css" />" rel="stylesheet">
<title>shiftreport</title>
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
					<li><a class="logout" href="<%=request.getContextPath()%>/LOGIN/logout.jsp">Logout</a></li>
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

					<li class="mt"><a class="active" href="<%=request.getContextPath()%>/index.jsp"> <i
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
							<li><a href="<%=request.getContextPath()%>/RETURNS/returns.jsp">退貨單管理</a></li>
							<li><a href="<%=request.getContextPath()%>/INVO/select_page.jsp">作廢發票管理</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-usd"></i> <span>金流管理</span>
					</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/SHIFTREPORT/shiftreport.jsp">班別報表維護</a></li>
							<li><a href="<%=request.getContextPath()%>/COUPON/coupon.jsp">折價券</a></li>
							<li><a href="<%=request.getContextPath()%>/DISCOUNT/discount.jsp">折扣管理</a></li>
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
		<section id="main-content"> 
		<section class="wrapper"> 
	<div class="row mt">
		<nav class="nav navbar-default">
			<ul class="nav navbar-nav">
				<li><a data-toggle="tab" href="#search">搜尋</a></li>
				<li><a data-toggle="tab" href="#new">新增</a></li>
				<li><a data-toggle="tab" href="#print" class="print">列印</a></li>
			</ul>
		</nav>

		<div class="tab-content">
			<div id="search" class="tab-pane fade">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty param.message}">
					<font color='red'>請修正以下錯誤:
					<ul>
						<c:forEach var="message" items="${param.message}">
							<li>${message}</li>
						</c:forEach>
					</ul>
					</font>
				</c:if>

				<div class="col-lg-6">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 查詢
						</h4>
						<form method="post" action="getOneShiftre.do">
							<p>依班別報表搜尋</p>
							日期<input type="date" name="Date"><br> 班別<Select
								name="shift">
								<option value="A">A</option>
								<option value="B">B</option>
							</Select><br> <input type="submit" value="搜尋">
						</form>

						<form method="post" action="getAllShiftre.do">
							<p>查詢全部班別報表(刪除.修改)</p>
							<input type="submit" value="搜尋">
						</form>

						<form method="post" action="getShiftreByDate.do">
							<p>依照日期查詢</p>
							日期<input type="date" name="Date"><br> <input
								type="submit" value="搜尋"> <input type="hidden"
								name="action" value="selectByDate">
						</form>
					</div>
					<div class="sub-context"></div>
				</div>

			</div>
			<div id="new" class="tab-pane fade">
				<div class="col-lg-4">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 新增
						</h4>
						<!--錯誤表列 -->
						<c:if test="${not empty param.message}">
							<font color='red'>請修正以下錯誤:
								<ul>
									<c:forEach var="message" items="${param.message}">
										<li>${message}</li>
									</c:forEach>
								</ul>
							</font>
						</c:if>
						<form method="post" action="insertShiftre.do">
							<p>新增班別報表</p>
							日期<input type="date" name="Date"><br> 班別<Select
								name="shift">
								<option value="A">A</option>
								<option value="B">B</option>
							</Select><br> 員工編號 <input type="text" name="emp_id" value="E00001"><br>
							現金<input type="text" name="cash" value="2000"><br>
							禮卷<input type="text" name="coupon" value="0"><br> 折讓<input
								type="text" name="discount" value="0"><br> 零用金<input
								type="text" name="coins" value="1500"><br> 交易額<input
								type="text" name="deal_sum" value="2000"><br> 交易成本<input
								type="text" name="deal_cost" value="1000"><br> 交易淨利<input
								type="text" name="deal_profit" value="1000"><br>
							交易次數<input type="text" name="deal_num" value="3"><br>
							班別小計<input type="text" name="shift_sum" value="2000"><br>
							<input type="submit" value="新增">
						</form>
					</div>
				</div>
				<div class="insert-context"></div>
			</div>
		</div>
	</div>
	</section> </section>

	</section>

	<<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script> 
	!window.jQuery && document.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
 	</script>

    <script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	<script class="include" type="text/javascript" src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
    <script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
    <script src="<c:url value="../resources/js/jquery.nicescroll.js" />" type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>

</body>
</html>