<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
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
<title>�ק���u���</title>
</head>
<body>
	<section id="container"> <!--header start--> <header
		class="header black-bg">
	<div class="sidebar-toggle-box">
		<div class="fa fa-bars tooltips" data-placement="right"
			data-original-title="Toggle Navigation"></div>
	</div>
	<!--logo start--> <a href="<%=request.getContextPath()%>/index.jsp"
		class="logo"><b>ePOS</b></a> <!--logo end-->

	<div class="top-menu">
		<ul class="nav pull-right top-menu">
			<li><a class="logout"
				href="<%=request.getContextPath()%>/LOGIN/logout.jsp">Logout</a></li>
		</ul>
	</div>
	</header> <!--header end--> <!--sidebar start--> <aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered">
				<a href="<%=request.getContextPath()%>/index.jsp"><img
					src="<c:url value="../resources/img/ui-sam.jpg"/>"
					class="img-circle" width="60"></a>
			</p>
			<h5 class="centered">ePOS</h5>

			<li class="mt"><a class="active"
				href="<%=request.getContextPath()%>/index.jsp"> <i
					class="fa fa-dashboard"></i> <span>index</span>
			</a></li>

			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-desktop"></i> <span>�򥻸�ƺ��@</span>
			</a>
				<ul class="sub">
					<li><a href="<%=request.getContextPath()%>/MEMBER/member.jsp">�|����ƺ��@</a></li>
					<li><a
						href="<%=request.getContextPath()%>/EMPLOYEE/employee.jsp">���u��ƺ��@</a></li>
					<li><a
						href="<%=request.getContextPath()%>/COMPANY/company.jsp">�t�Ӹ�ƺ��@</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-edit"></i> <span>�i�f�@�~</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/REQUISITION/requisition.jsp">���ʳ���@</a></li>
					<li><a
						href="<%=request.getContextPath()%>/QUOTATION/quotation.jsp">�߻�����@</a></li>
					<li><a href="<%=request.getContextPath()%>/PURCHASE/pur.jsp">���ʳ���@</a></li>
					<li><a
						href="<%=request.getContextPath()%>/BILL_OF_PURCHASE/bop.jsp">�i�f����@</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="glyphicon glyphicon-shopping-cart"></i> <span>�P�f�t��</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/VALUATION/valuation.jsp">��������@</a></li>
					<li><a href="<%=request.getContextPath()%>/ORDER/order.jsp">�q����@</a></li>
					<li><a
						href="<%=request.getContextPath()%>/SHIPMENTS/shipments.jsp">�X�f����@</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-book"></i> <span>�s�f�@�~</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/PRODUCT/product.jsp">�ӫ~�޲z</a></li>
					<li><a
						href="<%=request.getContextPath()%>/PROMOTING/promoting.jsp">�P�P�ӫ~�޲z</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="glyphicon glyphicon-log-out"></i> <span>�h�f�@�~</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/RETURNS/Return_Items.jsp">�h�f�~�޲z</a></li>
					<li><a
						href="<%=request.getContextPath()%>/RETURNS/returns.jsp">�h�f��޲z</a></li>
					<li><a
						href="<%=request.getContextPath()%>/INVO/select_page.jsp">�@�o�o���޲z</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-usd"></i> <span>���y�޲z</span>
			</a>
				<ul class="sub">
					<li><a
						href="<%=request.getContextPath()%>/SHIFTREPORT/shiftreport.jsp">�Z�O������@</a></li>
					<li><a href="<%=request.getContextPath()%>/COUPON/coupon.jsp">�����</a></li>
					<li><a
						href="<%=request.getContextPath()%>/DISCOUNT/discount.jsp">�馩�޲z</a></li>
				</ul></li>
			<li class="sub-menu"><a href="javascript:;"> <i
					class=" fa fa-bar-chart-o"></i> <span>������R</span>
			</a>
				<ul class="sub">
					<li><a href="morris.html">Morris</a></li>
				</ul></li>

		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <section id="main-content"> <section
		class="wrapper">

	<div class="row mt">
		<nav class="nav navbar-default">
		<div class="container-fluid"
			style="float: right; left: -45%; position: relative;">
			<ul class="nav navbar-nav">
				<li><a href="company.jsp">�j�M</a></li>
				<li><a style="background-color: rgba(224, 224, 224, 0.7);">�s�W</a></li>
				<li><a href="#">�d�ߵ��G</a></li>
			</ul>
		</div>
		</nav>
		<div class="col-lg-4"
			style="float: right; left: -30%; position: relative;">
			<div class="form-panel">
				<h4 class="mb">
					<i class="fa fa-angle-right"></i> �s�W
				</h4>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>�Эץ��H�U���~:
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>
				<form method="post" action="insertCom.do"
					enctype="multipart/form-data" class="form-horizontal style-form">
					<table>
					<tr>
						<td>�W��</td>
						<td><input type="text" name="com_name" value="�s���q�l"></td>
					</tr>
					<tr>
						<td>�Τ@�s��</td>
						<td><input type="text" name="com_um" value="33221354"></td>
					</tr>
					<tr>
						<td>�a�}</td>
						<td><input type="text" name="com_addr" value="�x�_���Q����83��5��"></td>
					</tr>
					<tr>
						<td>�q�l�H�c</td>
						<td><input type="text" name="com_mail" value="dadaa@gmail.com"></td>
					</tr>
					<tr>
						<td>�q��</td>
						<td><input type="text" name="com_phone" value="0988456877"></td>
					</tr>
					<tr>
						<td>�Ӥ�</td>
						<td><input type="file" name="picture"></td>
					</tr>
					<tr>
						<td>�ק�H</td>
						<td><input type="text" name="key_id" value="E00005"></td>
					</tr>
					</table>
					<br>
					<input type="submit" value="�s�W" class="btn btn-round btn-theme03">
				</form>
			</div>
		</div>
	</div>
	</section> </section> </section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>
	<script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	<script class="include" type="text/javascript"
		src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.nicescroll.js" />" ��
		type="text/javascript"></script>
	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>
</body>
</html>