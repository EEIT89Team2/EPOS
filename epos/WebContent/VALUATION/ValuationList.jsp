<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.valuation.model.*"%>
<%@ page import="com.valuation_detail.model.*"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%
	 	ValuationVO vltListVO = (ValuationVO) request.getAttribute("Vlt_id");
 		Valuation_DetailVO vltDetailVO = (Valuation_DetailVO) request.getAttribute("Vlt_id");
 		session.getAttribute("LoginOK");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<title>報價單</title>

<style>

	.titledetail {
		/*     	margin-top:auto; */
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #fb9292;
		font-size: 23px;
		border-radius: 2px;
	}
	
	a{
		color:#ab2222;
	}
	
	.main{
		height: 250px;
		border-radius: 8px;
		background: #fbe7e7;
	}
	
	.table > thead:first-child > tr:first-child > td {
  		background:#fb9292;
  		color:white;
  		border-top: 0;
  		font-family: 微軟正黑體;
}
	.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
		background-color:white;
	}

	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
		border:1px solid #fdc0c0;
		background:#f7e3e3;
	}
	
	.alert-info{
		background: #f7a2a2;
		border-color:#e86262;
	}
	
	.addNewDetail{
		
	}
	
	.titlelist {
	/*     	margin-top:auto; */
	font-family: '微軟正黑體';
	font-weight: bold;
	color: white;
	height: 35px;
	background: #f7a2a2;
	font-size: 23px;
	border-radius: 2px;
}
	
	
	.btn-primary{
		margin-top:60px;
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
	</aside> <!--sidebar end--> <section id="main-content"> <section class="wrapper">
	 <!-- -----------------------------------------------------------查詢----------------------------------------------------------- -->
	
	<div class="row mt">
	<div class="col-sm-12">
	
		<div id="add" class="main">
			<div class="tab-content">
				<nav id="listinfo" class="alert alert-info">
				<div>
				<a id="add" href="#"><span class="glyphicon glyphicon-file"></span>新增</a>　　　
		    	<a href="#" onclick="window.open('searchList.jsp', 'RetrunItem', config='height=500,width=1200')"><span class="glyphicon glyphicon-search"></span>單筆查詢</a>　　
		    	<a href="#" onclick="window.open('SelectVltAll.jsp', 'ValuationList', config='height=1050,width=1680')"><span class="glyphicon glyphicon-list-alt"></span>全部查詢</a>　　　
		    	<a id="print" href="javaScript:varitext()"><span class="glyphicon glyphicon-print" ></span>列印</a>　　　
		    	<a id="sub" href="#"><span class="glyphicon glyphicon-ok-sign">送出</span></a>
		    	<a href="#" onclick="window.open('SelectVltAllForCHK.jsp', 'ValuationList', config='height=1050,width=1680')"><span class="glyphicon glyphicon-list-alt"></span>審核</a>
				</div>
 
				</nav> 
			</div>
	<FORM id="form1" METHOD="post" ACTION="addVltList.do" name="form1" class="form-inline">
	<table border="0">
	<tr>
<!-- 		<div class="form-group"> -->
<!-- 			<label for="exampleInputName2">　退貨單編號：</label> -->
<!-- 			<input type="TEXT" class="form-control" name="ret_id" disabled/> -->
<!-- 		</div>　　 -->
<!-- 		<div class="form-group"> -->
<!-- 			<label for="exampleInputName2">　報價單號 ：</label> -->
<!-- 			<input type=text class="form-control" name="vlt_id" readonly /> -->
<!-- 		</div>　　 -->
		<div class="form-group">
			<label for="exampleInputName2">報價日期 ：</label>
			<input type="date" class="form-control" name="vlt_date" value="" />	
		</div>　　
		<div class="form-group">
			<label for="exampleInputName2">交貨日期 ：</label>
			<input type="date" class="form-control" name="delivery_date" value="" />
		</div>　　
		<div class="form-group">
			<label for="exampleInputName2">總  金  額 ：</label>
			<input type="text" class="form-control" name="total_price" value="" />
		</div>　

		<div class="form-group">
			<label for="exampleInputName2">　修改人員 ：</label>
			<input type="text" class="form-control" name="key_id" value="${LoginOK.emp_id}" />
		</div>
		<div class="form-group">
			<label for="exampleInputName2">　　 修改日期 ：</label>
			<input type="date" class="form-control" name="key_date" />
		</div>　
		<div class="form-group">
			<label for="exampleInputName2">有效日期 ：</label>
			<input type="date" class="form-control" name="exp_date" />
		</div>　
		<div class="form-group">　
			<label for="exampleInputName2"> 狀　 態 ：</label>
			<input type="text" class="form-control" name="status" value="N" readonly />
		</div>　
		
		<div style="height: 10px;"></div>
		　　
		<div class="form-group">
			<label for="exampleInputName2">備　註：</label>
			<input type="text" class="form-control" name="remark" value="test" />
		</div>
	</tr>
</table>
<div style="height: 70px;"></div>
<button type="button" id="addNewDetail" class="btn btn-info">新增明細</button>
<div class="titlelist">報價單明細</div>
<table border="0" id="form2" class="table table-bordered table-striped table-hover">
<thead>
	<tr>
<!-- 		<td>退貨單編號：</td> -->
<!-- 		<td><input type="TEXT" name="ret_id1" size="40" value="RE2016101500001"/></td> -->
		<td align='center'>商品編號</td>
		<td align='center'>商品名稱</td>
		<td align='center'>商品數量</td>
		<td align='center'>商品價格</td>
		
		<td align='center'>刪除</td>
	</tr>
</thead>
	<tr align='center' valign='middle'>
		<td><input type="TEXT" name="prod_id1"  value="P00001" /></td>
		<td><input type="TEXT" name="prod_name1"  value="iphone 6 16G 黑色" /></td>
		<td><input type="TEXT" name="prod_quantity1" value="2" /></td>
		<td><input type="TEXT" name="prod_price1"  value="20000"/></td>
		<td><input type='button' value='刪除' class='btn btn-danger'></input></td>
	</tr>
		
</table>
<br>
</div>
<input type="hidden" name="action" value="insert">
</FORM>
	
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

// <!----------------------------------------  新增         ------------------------------------>
	$('#add').on('click',function(){
		var url = "ValuationList.jsp"; 
			$.ajax({
				type: "GET",
				url: url,
				success: function(data)
				 {
				     
				 }
			});
	})	

// <!----------------------------------------  新增明細         ------------------------------------>
	$("#form2").on('click', '.btn-danger', function() {
		$(this).parents("tr").remove();
	})
	
	$(function() {
		var a = 2;
		$("#addNewDetail").click(function() {
			$("#form2").append("<tr align='center' valign='middle'><td><input type='TEXT' name='prod_id"+a+"'/></td>"
								+ "<td><input type='TEXT' name='prod_name"+a+"'/></td>"
								+ "<td><input type='TEXT' name='prod_quantity"+a+"'/></td>"
								+ "<td><input type='TEXT' name='prod_price"+a+"' /></td>"
								+ "<td><input type='button' value='刪除' class='btn btn-danger'></input></td></tr>"
			)
							a = a + 1;
		})
	})
	

//<!----------------------------------------  送出新增        ------------------------------------>
		
	$('#sub').on('click',function(){
	    var url = "addVltList.do"; 
// 	    alert("1");
	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#form1").serialize(), 
	           success: function(data)
	           {
	        	   location.href="SelectVltAll.jsp";
	           }
	         });
// 	    alert("2");
		})

//<!----------------------------------------  送出審核        ------------------------------------>
		
	$('#CHK').on('click',function(){
	    var url = "addVltList.do"; 
// 	    alert("1");
	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#form1").serialize(), 
	           success: function(data)
	           {
	        	   location.href="SelectVltAll.jsp";
	           }
	         });
// 	    alert("2");
		})
		
		
//<!----------------------------------------  送出全部查詢        ------------------------------------>
		$('#allsearch').on('click',function(){
			var url="SelectVltAll.jsp";
		
			$.ajax({
				type:"POST",
				url:url,
				success:function()
				{
					window.open("SelectVltAll.jsp");
				}
			})
		})

	</script>
</body>
</html>
