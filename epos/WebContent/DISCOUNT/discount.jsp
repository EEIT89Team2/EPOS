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
		<section id="main-content"> <section class="wrapper"> 
	<div class="row mt">
	<nav class="nav navbar-default">
		<ul class="nav navbar-nav">
			<li id="search1"><a data-toggle="tab" href="#search">搜尋</a></li>
			<li><a data-toggle="tab" href="#new">新增</a></li>
			<li><a data-toggle="tab" href="#print" class="print">列印</a></li>
			<li id="result"><a data-toggle="tab" href="#resolution">查詢結果</a></li>
		</ul>
	</nav>

		<div class="tab-content">
			<div id="search" class="tab-pane fade">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>請修正以下錯誤:
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>

				<jsp:useBean id="DiscSvc" scope="page"
					class="com.discount.model.DiscountService" />

				<div class="col-lg-6">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 查詢
						</h4>
						<form METHOD="post" ACTION="disc.do" id="count"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">選擇折扣身份</label>
								<div class="col-sm-3">
									<select size="1" name="dis_id" class="form-control">
										<c:forEach var="discVO" items="${DiscSvc.all}">
											<option value="${discVO.dis_id}">${discVO.dis_id}
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4">
									<input type="button" value="以折扣身份查詢"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
						<form METHOD="post" ACTION="disc.do" id="pre"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">選擇折扣%數</label>
								<div class="col-sm-3">
									<select size="1" name="dis_id" class="form-control">
										<c:forEach var="discVO" items="${DiscSvc.all}">
											<option value="${discVO.dis_id}">${discVO.dis_price}
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4">
									<input type="button" value="以折扣%數查詢"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
						<form METHOD="post" ACTION="allDisc.do" id="all"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">查詢全部</label>
								<div class="col-sm-3"></div>
								<div class="col-sm-4">
									<input type="button" value="查詢全部"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
					<div class="sub-context"></div>
					</div>
				</div>

			</div>
			<div id="new" class="tab-pane fade">
				<div class="col-lg-4">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 新增
						</h4>
						<!--錯誤表列 -->
<%-- 						<c:if test="${not empty errorMsgs}"> --%>
<!-- 							<font color='red'>請修正以下錯誤: -->
<!-- 								<ul> -->
<%-- 									<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 										<li>${message}</li> --%>
<%-- 									</c:forEach> --%>
<!-- 								</ul> -->
<!-- 							</font> -->
<%-- 						</c:if> --%>
						<form class="form-inline" METHOD="post" ACTION="insertDisc.do"
							id="insert">
							<div class="form-group">
								<input type=text class="form-control" name="dis_id"
									placeholder="折扣身分" size="10">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="dis_price"
									placeholder="折扣%數" size="10">
							</div>
							<input type="button" value="送出新增" class="btn btn-theme03">
						</form>
					</div>
				</div>

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
<script type="text/JavaScript">
	$(document).ready(function() {

		$(function() {

			$(":button").click(function() {
				if ("查詢全部" == $(this).val()) {
					var all = $("#all");
					$.ajax({
						"type" : all.attr("method"),
						"url" : all.attr("action"),
						"data" : all.serialize(),
						"success" : function(data) {
							$(".result-context").html(data);
							$("#result").attr("class","active");
							$("#search1").removeAttr("class");
							$("#search").attr("class","tab-pane fade");
							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("以折扣%數查詢" == $(this).val()) {
					var pre = $("#pre");
					$.ajax({
						"type" : pre.attr("method"),
						"url" : pre.attr("action"),
						"data" : pre.serialize(),
						"success" : function(data) {
							$(".result-context").html(data)
							$("#result").attr("class","active");
							$("#search1").removeAttr("class");
							$("#search").attr("class","tab-pane fade");
							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("以折扣身份查詢" == $(this).val()) {
					var count = $("#count");
					$.ajax({
						"type" : count.attr("method"),
						"url" : count.attr("action"),
						"data" : count.serialize(),
						"success" : function(data) {
							$(".result-context").html(data)
							$("#result").attr("class","active");
							$("#search1").removeAttr("class");
							$("#search").attr("class","tab-pane fade");
							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("送出新增" == $(this).val()) {
					var insert = $("#insert");
					$.ajax({
						"type" : insert.attr("method"),
						"url" : insert.attr("action"),
						"data" : insert.serialize(),
						"success" : function(data) {
// 							$.ajax({
// 								"type" : "post",
// 								"url" : "allDisc.do",
// 								"data" : {},
// 								"success" : function(data) {
// 									$(".result-context").html(data);
// 									$("#result").attr("class","active");
// 									$("#search1").removeAttr("class");
// 									$("#search").attr("class","tab-pane fade");
// 									$("#resolution").attr("class","tab-pane active");
// 								},
// 							});
						},
					});
				}

			})
		})

		$(".print").click(function() {
			window.print();
		})
	})
</script>
</body>
</html>