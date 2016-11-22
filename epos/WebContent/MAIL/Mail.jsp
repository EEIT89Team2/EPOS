<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.css" />"
	rel="stylesheet">
<!--external css-->
<link
	href="<c:url value="/resources/font-awesome/css/font-awesome.css" />"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/style-responsive.css" />"
	rel="stylesheet">
<title>寄送系統</title>
</head>
<body>
	<section id="container"> <!--header start--> <header
		class="header black-bg">
	<div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!--logo start--> <a href="index.jsp" class="logo"><b>ePOS</b></a> <!--logo end-->

	<div class="top-menu">
		<ul class="nav pull-right top-menu">

			<li><a class="logout"
				href="<%=request.getContextPath()%>/LOGIN/logout.jsp">Logout</a>歡迎使用ePOS</li>
		</ul>
	</div>
	</header> <!--header end--> <!--sidebar start--> <aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered">
				<a href="<%=request.getContextPath()%>/ORDER/order.jsp"><img
					src="<c:url value="../resources/img/ui-sam.jpg"/>"
					class="img-circle" width="60"></a>
			</p>
			<h5 class="centered">ePOS</h5>

			<li class="mt"><a class="active"
				href="<%=request.getContextPath()%>/ORDER/order.jsp"> <i
					class="fa fa-dashboard"></i> <span>收銀結帳</span>
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
						href="<%=request.getContextPath()%>/VALUATION/ValuationList.jsp">報價單維護</a></li>
					<li><a href="<%=request.getContextPath()%>/ORDER/order.jsp">訂單維護</a></li>
					<li><a
						href="<%=request.getContextPath()%>/SHIPMENTS/ShipmentsList.jsp">出貨單維護</a></li>
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
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-usd"></i> <span>金流管理</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/SHIFTREPORT/shiftreport.jsp">班別報表維護</a></li>
					<li><a href="<%=request.getContextPath()%>/COUPON/coupon.jsp">折價券</a></li>
					<li><a
						href="<%=request.getContextPath()%>/DISCOUNT/discount.jsp">折扣管理</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class=" fa fa-bar-chart-o"></i> <span>報表分析</span>
			</a>
				<ul class="sub">
					<li><a href="morris.html">Morris</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-users"></i> <span>顧客關係</span>
			</a>
				<ul class="sub">
					<li><a href="<%=request.getContextPath()%>/MAIL/Mail.jsp">寄送系統</a></li>
				</ul></li>
		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <section id="main-content"> <section
		class="wrapper">
	<div class="row mt">
		<div class="col-lg-12">
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
			<!---------------------收件者信箱 -------------------- -->
			<form method="post" action="email.do" name="form2">
					<table>
						<tr>
							<!-- <td>Client:<input type="text" name="uesr" size="10"></td> -->
							<!-- <td>Password:<input type="password" name="pass" size="10"></td> -->
							<td>收件者信箱:<input type="text" name="addres" size="20"></td>
							<td>標題:<input type="text" name="from" size="10"></td>
							<td>主旨:<input type="text" name="subject" size="10"></td>
						</tr>
						<input type="submit" value="寄送單一會員" name="howMany"> 
						<input type="submit" value="寄送全部會員" name="howMany"> 
						<input type="submit" value="寄送優惠訊息" name="howMany"> <br> <br>
					</table>
					內容:
					<div align="center">
						<textarea cols="50" rows="9" name="text"></textarea>
					</div>
					</form>
					<div>
					<form method="post" action="email.do" name="form2"  class="col-lg-6">
						<table border='1' width='500'>
							<tr align='center' valign='middle'>
								<th>會員編號.信箱</th>
							</tr>
							<c:forEach var="list" items="${list1}">
								<tr align='center' valign='middle'>
									<td>${list.key},${list.value.mem_mail}</td>
								</tr>
							</c:forEach>
						</table>
						<input type="date" name="s_ord_date" value="2016-09-14"> <input
							type="date" name="e_ord_date" value="2016-10-16"> <input
							type="submit" value="查詢未下訂單會員" name="howMany">
			<a href="<c:out value='${pageContext.request.contextPath}' />/MAIL/Mail.jsp">回上頁</a>
			</form>
			<!-----------------------寄送全部會員--------------- -->
				<form method="post" action="allMail.do" class="col-lg-6">
			<table border='1' width='500'>
						<tr>
							<th>會員編號</th>
							<th>信箱</th>
						</tr>
						<br>
						<c:forEach var="list" items="${list}">
							<tr align='center' valign='middle'>
								<td>${list.mem_id}</td>
								<td>${list.mem_mail}</td>
							</tr>
						</c:forEach>
			</table>
					 <input type="submit" value="查詢全部會員">
			<a href="<c:out value='${pageContext.request.contextPath}' />/MAIL/Mail.jsp">回上頁</a>
				</form>
					</div>
			
					
		</div>
	</section> </section></section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>

	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script class="include" type="text/javascript"
		src="<c:url value="/resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.nicescroll.js" />"
		type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="/resources/js/common-scripts.js" />"></script>
	<script type="text/JavaScript">
		$(document).ready(function() {
			$.get("sign_in.jsp", function(data) { //初始將sign_in.jsp include div#main-content
				$("#main-content").html(data);
			});
		})
	</script>
	<script type="text/javascript"
		src="<c:url value="resources/js/jquery.backstretch.min.js" />"></script>
	<script>
		$.backstretch("resources/img/login-bg.jpg", {
			speed : 500
		});
	</script>
</body>
</html>