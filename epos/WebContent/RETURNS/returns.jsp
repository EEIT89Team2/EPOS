<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>
<%
	ReturnListService rtnListSvc = new ReturnListService();
    List<RtnListVO> list = rtnListSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />


<style type="text/css">
	
	.titlelist{
			font-family: '�L�n������';
			font-weight: bold;
			color: white;
			height: 35px;
			background: #f96b98;
			font-size: 23px;
			border-radius: 2px;
	}

</style>
<title>�h�f��</title>
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
			<li><a class="logout" href="<%=request.getContextPath()%>/LOGIN/logout.jsp">Logout</a></li>
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
						href="<%=request.getContextPath()%>/RETURNS/ReturnList.jsp">�h�f��޲z</a></li>
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
	</aside> <!--sidebar end--> <section id="main-content"> <section class="wrapper">
<!-- -----------------------------------------------------------�d��----------------------------------------------------------- -->
<c:if test="${not empty errorMsgs}">
<font color='red'>�Эץ��H�U���~:
<ul>
	<c:forEach var="message" items="${errorMsgs}">
		<li>${message}</li>
	</c:forEach>
</ul>
</font>
</c:if>
	
	<div class="row mt">
		<div class="col-sm-12">
		<div id="add" class="main">
			<div class="tab-content">
				<nav class="alert alert-info">
				<div>
				<a id="add" href="#"><span class="glyphicon glyphicon-file"></span>�s�W</a>�@�@�@
		    	<a href="#" onclick="window.open('searchItem.jsp', 'Yahoo', config='height=500,width=850')"><span class="glyphicon glyphicon-search"></span>�d��</a>�@�@�@
		    	<a href="#"><span class="glyphicon glyphicon-pencil"></span>�ק�</a>�@�@�@
		    	<a href="#"><span class="glyphicon glyphicon-remove"></span>�R��</a>�@�@�@
		    	<a id="print" href="javaScript:varitext()"><span class="glyphicon glyphicon-print" ></span>�C�L</a>�@�@�@
		    	<a id="sub" href="#"><span class="glyphicon glyphicon-ok-sign">�e�X</span></a>�@
				</div>

				</nav>
			</div>
			
			<FORM METHOD="post" ACTION="insert.do" name="form1" class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">�@�h�f��s���G</label> 
					<input type="text"�@name="prod_name" class="form-control">
				</div> �@�@
				<div class="form-group">
					<label for="exampleInputName2">�h�f����G</label> 
					<input type="date"�@name="com_id" class="form-control" placeholder="C0001">
				</div>�@�@
				<div class="form-group">
					<label for="exampleInputEmail2">�t�ӽs���G</label> 
					<input type="text"�@name="re_quantity" class="form-control" placeholder="50">
				</div>�@�@
				<div class="form-group">
					<label for="exampleInputName2">�t�ӦW�١G</label> 
					<input type="text"�@name="remark" class="form-control">
				</div>�@�@
				<div class="form-group">
					<label for="exampleInputName2">�ק�H���G</label> 
					<input type="text"�@name="remark" class="form-control">
				</div>
				<div class="mainspace">
				<div class="form-group">
					<label for="exampleInputName2">�@�ק����G</label> 
					<input type="date"�@name="remark" class="form-control">
				</div>
				<div class="form-group">
					<label for="exampleInputName2">�Ƶ��G</label> 
					<input type="text"�@name="remark" class="form-control">
				</div>
				<div class="form-group">
					<label for="exampleInputName2">���A�G</label> 
					<input type="text"�@name="remark" class="form-control">
				</div>
				</div>
			</FORM>
		</div>
		

<!--  <fieldset> -->
<!-- 	<legend>�d��</legend> -->
<!-- 	<table> -->
<!-- 	 <tr> -->
<!-- 	 <form action="getOne.do" method="post"> -->
<!-- 	 	<td style="text-align:right;">�h�f��s��</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type='text' name='ret_id'/> -->
<!-- 	 		<input type="submit" value="�d��"> -->
<!-- 	 		<input type="hidden" name="action" value="getOne"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	 <form action="getDate.do" method="post"> -->
<!-- 	 	<td style="text-align:right;">�h�f���</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type="date" name="ret_date"/> -->
<!-- 	 		<input type="submit" value="�d��"> -->
<!-- 	 		<input type="hidden" name="action" value="getDate"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	 <form action="getComName.do" method="post">	  -->
<!-- 	 	<td style="text-align:right;">�t�ӦW��</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type='text' name='com_name'/> -->
<!-- 	 		<input type="submit" value="�d��"> -->
<!-- 	 		<input type="hidden" name="action" value="getComName"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	</table> -->
<!--  </fieldset> -->

<!-- -----------------------------------------------------------���----------------------------------------------------------- -->
<div>
<div class="titlelist">�h�f��</div>
<table id="tablelist"�@class="table table-bordered table-striped table-hover">
<thead>
<tr>
	<td align='center'>�h�f��s��</td>
	<td align='center'>�h�f���</td>
	<td align='center'>�t�ӽs��</td>
	<td align='center'>�t�ӦW��</td>
	<td align='center'>�ק�H��</td>
	<td align='center'>�ק���</td>
	<td align='center'>�Ƶ�</td>
	<td align='center'>���A</td>
	<td align='center'>�d�ߩ���</td>
	<td align='center'>�ק�</td>
	<td align='center'>�R��</td>
</tr>
</thead>

<c:forEach var="list" items="${list}">
		<tr align='center' valign='middle'>
			<td>${list.ret_id}</td>
			<td>${list.ret_date}</td>
			<td>${list.com_id}</td>
			<td>${list.com_name}</td>
			<td>${list.key_id}</td>
			<td>${list.key_date}</td>
			<td>${list.remark}</td>
			<td>${list.status}</td>
		<td>
			  <FORM METHOD="post" ACTION="getDetail.do">
			     <input type="submit" value="�d��">
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getDetail">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="delete.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="ret_id" value="${list.ret_id}">
			    <input type="hidden" name="action"value="delete">
			  </FORM>
		</td>
		</tr>
	</c:forEach>
	</table>
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
	<script type="text/javascript" src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
	<script class="include" type="text/javascript" src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.nicescroll.js" />"
		type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>
	<!------------------------------------------------ �{�� --------------------------------------------------------------->
	<script src="<c:url value="../resources/js/gen_validatorv4.js" />"
		type="text/javascript"></script>
		
		
<script type="text/javascript">
$(function () {
	
	$('#tablelist').DataTable();
	
})
	
</script>
<!-- <ul> -->
<!--   <li><a href='/RETURNS/addList.jsp'>�s�W�h�f��</a></li> -->
<!--   <li><a href='Index5.jsp'>�^����</a></li> -->
<!-- </ul> -->

</body>
</html>