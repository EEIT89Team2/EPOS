<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO");	//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>新增會員</title>
</head>
<body>
	<section id="container"> <!--header start--> 
		<header class="header black-bg">
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start--> <a href="<%=request.getContextPath()%>/index.jsp" class="logo"><b>ePOS</b></a> <!--logo end-->

			<div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout" href="login.html">Logout</a></li>
				</ul>
			</div>
		</header> <!--header end--> <!--sidebar start-->
	 <aside>
		<div id="sidebar" class="nav-collapse ">
			<!-- sidebar menu start-->
			<ul class="sidebar-menu" id="nav-accordion">

				<p class="centered">
					<a href="<%=request.getContextPath()%>/index.jsp">
					<img src="<c:url value="../resources/img/ui-sam.jpg"/>" class="img-circle" width="60"></a>
				</p>
				<h5 class="centered">ePOS</h5>

				<li class="mt">
					<a class="active" href="<%=request.getContextPath()%>/index.jsp"> 
						<i class="fa fa-dashboard"></i>
					    <span>index</span>
					</a>
				</li>

				<li class="sub-menu">
					<a href="javascript:;"> 
						<i class="fa fa-desktop"></i>
				   	    <span>基本資料維護</span>
				    </a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/MEMBER/member.jsp">會員資料維護</a></li>
						<li><a 	href="<%=request.getContextPath()%>/EMPLOYEE/employee.jsp">員工資料維護</a></li>
						<li><a href="<%=request.getContextPath()%>/COMPANY/company.jsp">廠商資料維護</a></li>
					</ul>
				</li>
				<li class="sub-menu">
					<a href="javascript:;"> 
						<i class="fa fa-edit"></i>
					    <span>進貨作業</span>
					</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/REQUISITION/requisition.jsp">請購單維護</a></li>
						<li><ahref="<%=request.getContextPath()%>/QUOTATION/quotation.jsp">詢價單維護</a></li>
						<li><a href="<%=request.getContextPath()%>/PURCHASE/pur.jsp">採購單維護</a></li>
						<li><ahref="<%=request.getContextPath()%>/BILL_OF_PURCHASE/bop.jsp">進貨單維護</a></li>
					</ul>
				</li>
				<li class="sub-menu">
					<a href="javascript:;"> 
						<i class="glyphicon glyphicon-shopping-cart"></i> 
						<span>銷貨系統</span>
					</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/VALUATION/valuation.jsp">報價單維護</a></li>
						<li><a href="<%=request.getContextPath()%>/ORDER/order.jsp">訂單維護</a></li>
						<li><a href="<%=request.getContextPath()%>/SHIPMENTS/shipments.jsp">出貨單維護</a></li>
					</ul>
				</li>
				<li class="sub-menu">
					<a href="javascript:;"> 
						<i class="fa fa-book"></i> 
						<span>存貨作業</span>
					</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/PRODUCT/product.jsp">商品管理</a></li>
						<li><a href="<%=request.getContextPath()%>/PROMOTING/promoting.jsp">促銷商品管理</a></li>
					</ul>
				</li>
				<li class="sub-menu">
					<a href="javascript:;"> 
						<i class="glyphicon glyphicon-log-out"></i> 
						<span>退貨作業</span>
					</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/RETURNS/Return_Items.jsp">退貨品管理</a></li>
						<li><a href="<%=request.getContextPath()%>/RETURNS/returns.jsp">退貨單管理</a></li>
						<li><a href="<%=request.getContextPath()%>/INVO/select_page.jsp">作廢發票管理</a></li>
					</ul>
				</li>
				<li class="sub-menu">
					<a href="javascript:;"> 
						<i class="fa fa-usd"></i> 
						<span>金流管理</span>
					</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/SHIFTREPORT/shiftreport.jsp">班別報表維護</a></li>
						<li><a href="<%=request.getContextPath()%>/COUPON/coupon.jsp">折價券</a></li>
						<li><a href="<%=request.getContextPath()%>/DISCOUNT/discount.jsp">折扣管理</a></li>
					</ul>
				</li>
				<li class="sub-menu">
					<a href="javascript:;">
						 <i class=" fa fa-bar-chart-o"></i>
						 <span>報表分析</span>
					</a>
					<ul class="sub">
						<li><a href="morris.html">Morris</a></li>
					</ul>
				</li>
			</ul>
		<!-- sidebar menu end-->
		</div>
	 </aside> <!--sidebar end-->
		 <section id="main-content"> 
	 		<section class="wrapper">
	 		<div class="row mt">
				<nav class="nav navbar-default">
					<div class="container-fluid" style="float: right; left: -50%; position: relative;">
						<form name="submitForm" method="POST" action="allMemb.do">
							<input type="hidden" name="param1" value="param1Value">
							<ul class="nav navbar-nav" style="float: left; left: 50%; position: relative;">
								<li><a class="insertMem" style="background-color: rgba(221, 15, 15, 0.8);"><span class="insertMemText" style="color: white;">新增會員</span></a></li>
								<li><A HREF="javascript:document.submitForm.submit()">查詢會員</A></li>
								<li><a class="selectMemId" href="selectMemId.jsp"><span class="selectMemIdText">依會員編號查詢</span></a></li>
								<li><a class="selectManyMem" href="selectManyMem.jsp"><span class="selectManyMemText">查詢多筆會員</span></a></li>
								<li><a class="selectMemName" href="selectMemName.jsp"><span class="selectMemNameText">依會員姓名查詢</span></a></li>
								<li><a class="selectMemDate" href="selectMemDate.jsp"><span class="selectMemDateText">依新增日期查詢</span></a></li>
							</ul>
						</form>
					</div>
				</nav>
				</div>
			</section> 
		</section>
	</section>
<center>
	<h3>會員資料:</h3>
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
 
	<FORM METHOD="post" ACTION="insertMemb.do" name="form1">
		<table border="0">

<!-- 			<tr> -->
<!-- 				<td>會員編號:</td> -->
<!-- 				<td><input type="text" name="mem_id" size="20" -->
<%-- 					value="<%=(memVO == null) ? "M00001" : memVO.getMem_id()%>" /></td> --%>
<!-- 			</tr> -->
			<tr>
				<td>密碼:</td>
				<td><input type="text" name="mem_pwd" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_pwd()%>" /></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><input type="text" name="mem_name" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_name()%>" /></td>
			</tr>
			<tr>
				<td>身分證:</td>
				<td><input type="text" name="mem_idnum" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_idnum()%>" /></td>
			</tr>
			<tr>
				<td>生日:</td>
				<td><input type="date" name="mem_bday" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_bday()%>" /></td>
			</tr>
			<tr>
				<td>連絡電話:</td>
				<td><input type="text" name="mem_phone" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_phone()%>" /></td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input type="text" name="mem_addr" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_addr()%>" /></td>
			</tr>
			<tr>
				<td>e-mail:</td>
				<td><input type="text" name="mem_mail" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_mail()%>" /></td>
			</tr>
			<tr>
				<td>會員到期日:</td>
				<td><input type="date" name="mem_due" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_due()%>" /></td>
			</tr>
			<tr>
				<td>建檔人員:</td>
				<td><input type="text" name="key_id" size="20"
					value="<%=(memVO == null) ? "" : memVO.getKey_id()%>" /></td>
			</tr>
			<tr>
				<td>統編:</td>
				<td><input type="text" name="mem_um" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_um()%>" /></td>
			</tr>

		</table>

		<br>
<!-- 	 <input type="hidden" name="action" value="insert">  -->
	 <input type="submit" value="送出新增">
	</FORM>
</center>	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>

	<script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	<script class="include" type="text/javascript" src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.nicescroll.js" />" type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>

	<jsp:include page="/COMMON/footer_mem.jsp" />
</body>
</html>