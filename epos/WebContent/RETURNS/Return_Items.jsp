<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>

<%
	ReturnItemsService rtnItemSvc = new ReturnItemsService();
	List<RtnItemsVO> list = rtnItemSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">

function varitext(text){
text=document
print(text)
}

</script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap core CSS -->
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="../resources/css/bootstrap-theme.min.css" rel="stylesheet"> -->
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
<title>return-items</title>

<style>
.titledetail {
	/*     	margin-top:auto; */
	font-family: '微軟正黑體';
	font-weight: bold;
	color: white;
	height: 35px;
	background: #2B74C6;
	font-size: 23px;
	border-radius: 2px;
}
</style>
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
			<li><a class="logout" href="login.html">Logout</a></li>
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

		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside> <!--sidebar end--> <section id="main-content"> <section
		class="wrapper"> <!-- -----------------------------------------------------------查詢----------------------------------------------------------- -->
	
	<div class="row mt">
	<div class="col-sm-12">
		<div id="add" class="main">
			<div class="tab-content">
				<nav class="alert alert-info">
				<div>
				<a id="add" href="#"><span class="glyphicon glyphicon-file"></span>新增</a>　　　
		    	<a href="#" onclick="window.open('searchItem.jsp', 'Yahoo', config='height=500,width=850')"><span class="glyphicon glyphicon-search"></span>查詢</a>　　　
		    	<a href="#"><span class="glyphicon glyphicon-pencil"></span>修改</a>　　　
		    	<a href="#"><span class="glyphicon glyphicon-remove"></span>刪除</a>　　　
		    	<a id="print" href="javaScript:varitext()"><span class="glyphicon glyphicon-print" ></span>列印</a>　　　
		    	<a id="sub" href="#"><span class="glyphicon glyphicon-ok-sign">送出</span></a>　
				</div>

				</nav>
			</div>


			<FORM id="itemsform" METHOD="post" ACTION="insert_Item.do" class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">　商品名稱：</label> <input type="text"
						name="prod_name" class="form-control">
				</div> 　　
				<div class="form-group">
					<label for="exampleInputName2">廠商代號：</label> <input type="text"
						name="com_id" class="form-control" placeholder="C0001">
				</div>　　
				<div class="form-group">
					<label for="exampleInputEmail2">退貨數量：</label> <input type="text"
						name="re_quantity" class="form-control" placeholder="50">
				</div>　　
				<div class="form-group">
					<label for="exampleInputName2">備註：</label> <input type="text"
						name="remark" class="form-control">
				</div>
			</FORM>

		</div>
		<!-- -----------------------------------------------------------表格----------------------------------------------------------- -->
		<div>
			<div class="titledetail">退貨品</div>
			<table id="table1"
				class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<td align='center'>商品名稱</td>
						<td align='center'>廠商代號</td>
						<td align='center'>退貨數量</td>
						<td align='center'>備註</td>
						<td align='center'>修改</td>
						<td align='center'>刪除</td>
					</tr>
				</thead>
				<c:forEach var="RtnItemsVO" items="${list}">
					<tr class="table2" align='center' valign='middle'>
						<td>${RtnItemsVO.prod_name}</td>
						<td>${RtnItemsVO.com_id}</td>
						<td>${RtnItemsVO.re_quantity}</td>
						<td>${RtnItemsVO.remark}</td>
						<td>

							<FORM METHOD="post" ACTION="getOne_For_Update_Item.do">
								<button type="submit" class="btn btn-success">
									<i class="fa fa-pencil"></i>
								</button>
								<input type="hidden" name="prod_name"
									value="${RtnItemsVO.prod_name}"> <input type="hidden"
									name="action" value="getOne_For_Update">
							</FORM>
						</td>
						<td>
<!-- 							<FORM id="del" METHOD="post" ACTION="delete_Item.do"> -->
			    <button type="submit" target="${RtnItemsVO.prod_name}" class="btn btn-danger"><i class="fa fa-trash-o "></i></button>
<%-- 			    <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}"> --%>
<!-- 			    <input type="hidden" name="action"value="delete"> -->
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
	<!------------------------------------------------ 程式 --------------------------------------------------------------->
	<script src="<c:url value="../resources/js/gen_validatorv4.js" />"
		type="text/javascript"></script>
	<script type="text/JavaScript">
		 	$(function () {

// <!----------------------------------------  新增         ------------------------------------>
// 				$('#add').on('click',function(){
// 				var url = "Return_Items.jsp"; 
// 				    $.ajax({
// 				           type: "GET",
// 				           url: url,
// 				           success: function(data)
// 				           {
// 				               location.reload(); 
// 				           }
// 				         });
// 					})	

				$('#sub').on('click',function(){
			    var url = "../RETURNS/insert_Item.do"; 
			    $.ajax({
			           type: "POST",
			           url: url,
			           data: $("#itemsform").serialize(), 
			           success: function(data)
			           {
			        	   location.reload();
			           }
			         });
				})
//<!----------------------------------------刪除------------------------------------>
				$('.btn-danger').on('click',function(){	
					var id = $(this).attr('target');
			    	var url = "delete_Item.do"; 
			    $.ajax({
			           type: "POST",
			           url: url,
			           data: {prod_name:id},
			           success: function(data)
			           {
			        	   location.reload(); 
			           }
			         });
				})
//<!----------------------------------------  表格         ------------------------------------>
		 		$('#table1').DataTable();

		 	})
	</script>
</body>
</html>
