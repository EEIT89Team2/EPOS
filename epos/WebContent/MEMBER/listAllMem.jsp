<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
// 	MemberService MemSvc = new MemberService();
// 	List<MemberVO> list =MemSvc.getAll();//除了錯誤訊息是用VO或List送來外,其餘的查詢結果都是用List送來
	List<MemberVO> list=(List<MemberVO>) request.getAttribute("list");	
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
<title>會員清單</title>
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
	 		<div class="col-lg-12">
				<nav class="nav navbar-default">
					<div class="container-fluid" style="float: right; left: -50%; position: relative;">
						<ul class="nav navbar-nav" style="float: left; left: 50%; position: relative;">
							<li><a class="insertMem" href="addMem.jsp" method="post"><span class="insertMemText">新增會員</span></a></li>
							<li><a class="selectAllMem" style="background-color: rgba(224, 224, 224, 0.7);"><span class="selectAllMemText">查詢會員</span></a></li>
							<li><a class="selectMemId" href="selectMemId.jsp"><span class="selectMemIdText">依會員編號查詢</span></a></li>
							<li><a class="selectManyMem" href="selectManyMem.jsp"><span class="selectManyMemText">查詢多筆會員</span></a></li>
							<li><a class="selectMemName" href="selectMemName.jsp"><span class="selectMemNameText">依會員姓名查詢</span></a></li>
							<li><a class="selectMemDate" href="selectMemDate.jsp"><span class="selectMemDateText">依新增日期查詢</span></a></li>
						</ul>
					</div></div>
				</nav>
<center>
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
 
<table border='1' bordercolor='#CCCCFF' width='1450'>
	<tr>
		<th>會員編號</th>
		<th>密碼</th>
		<th>姓名</th>
		<th>身分證</th>
		<th>生日</th>
		<th>連絡電話</th>
		<th>地址</th>
		<th>e-mail</th>
		<th>會員到期日</th>
		<th>建檔人員</th>
		<th>建檔日期</th>
		<th>統編</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<c:forEach var="memVO" items="${list}">	
		<tr align='center' valign='middle'>
			<td>${memVO.mem_id}</td>
			<td>${memVO.mem_pwd}</td>
			<td>${memVO.mem_name}</td>
			<td>${memVO.mem_idnum}</td>
			<td>${memVO.mem_bday}</td>
			<td>${memVO.mem_phone}</td>
			<td>${memVO.mem_addr}</td>
			<td>${memVO.mem_mail}</td>
			<td>${memVO.mem_due}</td>
			<td>${memVO.key_id}</td>
			<td>${memVO.key_date}</td>
			<td>${memVO.mem_um}</td>

        		<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/MEMBER/allForUpdateMem.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="mem_id" value="${memVO.mem_id}"> 
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/MEMBER/deleteMem.do">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="mem_id" value="${memVO.mem_id}"> 
<!-- 						<input type="hidden" name="action" value="delete"> -->
					</FORM>
				</td>
	 	</tr>
	 </c:forEach>
</table>
</center>

				</div>
			</section> 
		</section>
	</section>

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