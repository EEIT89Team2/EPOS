<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.order_detail.model.*"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%
	OrderVO orderVO = (OrderVO) request.getAttribute("ord_id");
	Order_DetailVO ord_detail = (Order_DetailVO) request.getAttribute("ord_id");

	OrderService ordSvc = new OrderService();
	double dayPrice = ordSvc.GetDayTotalPrice();
	pageContext.setAttribute("dayPrice", dayPrice);

	long dayPeople = ordSvc.GetDayTotalPeople();
	pageContext.setAttribute("dayPeople", dayPeople);
	
	session.getAttribute("LoginOK");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script>
	//計算商品明細總金額
	function count_total_prod_price(prod_quantityObj, prod_priceObj,
			total_prod_priceObj) {

		//先刪除原本的商品明細總金額=單價*數量
		document.getElementById("total_price_temp").value = parseInt(document
				.getElementById("total_price_temp").value)
				- total_prod_priceObj.value
		//計算目前的商品明細總金額=單價*數量
		total_prod_priceObj.value = prod_quantityObj.value
				* prod_priceObj.value;
		//計算實際金額
		count_total_price(total_prod_priceObj.value)
	}
	//計算實際金額
	function count_total_price(total_prod_price) {
		if (total_prod_price == undefined) {
			total_prod_price = 0;
		}

		//total_prod_price=新增的商品金額
		//計算總計金額
		document.getElementById("total_price_temp").value = parseInt(document
				.getElementById("total_price_temp").value)
				+ parseInt(total_prod_price);
		document.getElementById("total_price").value = (document
				.getElementById("total_price_temp").value * document
				.getElementById("dis_price").value)
				- document.getElementById("cpon_dollar").value;
	}

	//計算應付金額(現金)
	function countCash() {
		var cpon_dollar = document.getElementById("cpon_dollar").value;

		if (cpon_dollar == "")//給初始值，不能拿空值來計算
			cpon_dollar = 0;

		var total_price = document.getElementById("total_price").value;
		document.getElementById("cash").value = total_price - cpon_dollar;
	}
</script>

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
<title>訂單</title>

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
	
	
	.main{
		height: 150px;
		background: #e0e9ff;
	}
	
/* 	.ordbtm{ */
/* 		margin-top: 100px; */
/* 	} */
	
	

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
			<Form METHOD="post" action="addOrder.do" name="ordmain" class="form-inline">
					<jsp:useBean id="weather" class="analysis.LoadWeatherRss" scope="page"/>
					<table border="1">
						<tr>
						<div class="form-group">
							<label for="exampleInputName2">　收銀員編號：</label> 
							<input type="text" value="${LoginOK.emp_id}" name="key_id" class="form-control" disabled="disabled">
						</div>
						<div class="form-group">
							<label for="exampleInputName2">　收銀員姓名：</label> 
							<input type="text" value="${LoginOK.emp_name}" name="key_id" class="form-control" disabled="disabled">
						</div>
							<td>收銀員姓名：</td>
							<td>${LoginOK.emp_name}</td>
							<td>班別：</td>
							<td>${SHIFT}<input type="hidden" name="shift" value="${SHIFT}" /></td>
							<td>購買會員：<input type="text" id="mem_name" name="mem_name" disabled /></td>
							<td>購買員工：<input type="text" id="emp_name" name="emp_name" disabled /></td>
							<td>今日天氣<input type="text" value="${weather.nowWeather}" disabled></td>
							
						</tr>
					</table>
					<!------------------------------------------------------------ 明細 -------------------------------------------------------------->
					<div style="height: 100px;"></div>
					<h2>新增訂單明細</h2>
					<!-- 		<input type="button" value="新增明細" id="addNewDetail"> -->
					<div
						style="width: 1200px; height: 200px; overflow: auto; background-color: white;">
						<table border="1" id="table1">

							<!-- 由$("#addNewDetail").click產出明細table -->

						</table>
					</div>
					<hr>
					<!------------------------------------------------------------ 輸入區 -------------------------------------------------------------->
					<table class="ordbtm" border="1">
						<tr valign="top">
							<td>
								<table border="1">
									<tr>
										<td>輸入商品ID：<input type="text" id="prod_id" name="prod_id"
											size="50" /></td>
									</tr>
								</table>
								<table border="1">
									<tr>
										<td>會員編號：<input type="text" id="mem_id" name="mem_id" /></td>
										<td>統一編號：<input type="text" id="ord_um" name="ord_um" /></td>
									</tr>
									<tr>
										<td>員工編號：<input type="text" id="emp_id" name="emp_id" /></td>
										<td>日營業額：$${dayPrice}</td>
									</tr>
									<tr>
										<td>折價卷號：<input type="text" id="cpon_id" name="cpon_id" /></td>
										<td>來客數量：${dayPeople}人次</td>
									</tr>
								</table>
							</td>
							<td>
								<table border="1">
									<tr>
										<td>總計金額：<input type="text" id="total_price"
											name="total_price" value="0" readonly /><input type="hidden"
											id="total_price_temp" name="total_price_temp" value="0" /></td>
										<td>折讓：<input type="text" id="dis_price" name="dis_price"
											value="1" readonly /></td>
										<td>禮卷：<input type="text" id="cpon_dollar"
											name="cpon_dollar" value="0" readonly /></td>
									</tr>
									<tr>
										<td>筆數：<input type="text" name="count" value="0" readonly /></td>
										<td>現金：<input type="text" name="cash_temp" id="cash_temp"
											value="" /> <input type="hidden" id="cash" name="cash"
											value="" /></td>
										<td>找零：<input type="text" name="charge" id="charge"
											value="" readonly /></td>
									</tr>
								</table> <input type="button" value="輸入" id="addNewDetail"> <input
								type="submit" value="結帳">
							</td>
						</tr>
					</table>

					<br> <input type="hidden" name="action" value="insert">
				</Form>
		</div>
	</div>  	<!-- "col-sm-12" -->
	<div> 		<!-- "row mt" -->
	</div>
	</section> </section> </section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>

<script type="text/JavaScript">
	//練習五使用on綁定網頁上刪除按鈕，完成刪除動作
	$("#table1").on('click', '.btn-danger', function() {
		//總計金額先扣除該筆商品的金額
		ordmain.total_price_temp.value = parseInt(ordmain.total_price_temp.value) - $(this).parents("tr").children("td:eq(8)").children("input").val();
		count_total_price();
		
		$(this).parents("tr").remove();
		//筆數再-1
		ordmain.count.value=parseInt(ordmain.count.value)-1;
	})
	
	$(function() {
				var a = 1;
				var prod_name;
				var prod_price;
				
				$("#addNewDetail").click(function() {
									$.getJSON('getByProd_id.do',{prod_id:$('#prod_id').val()},function(data){
										//取得JSON資料
										prod_name = data.prod_name;
										prod_price = data.prod_price;

										//先將總計金額加上本次新增商品金額
										ordmain.total_price_temp.value = parseInt(ordmain.total_price_temp.value) + parseInt(prod_price);
										count_total_price();
										
										$("#table1")
										.append(
												"<tr><td>商品編號：</td><td><input type='text' name='prod_id"+a+"' value='"+$('#prod_id').val()+"' /></td>"
														+ "<td>商品名稱：</td><td><input type='text' name='prod_name"+a+"' value='"+prod_name+"' /></td>"
														+ "<td>商品數量：</td><td><input type='text' name='prod_quantity"+a+"' value='1' onblur='count_total_prod_price(ordmain.prod_quantity"+a+",ordmain.prod_price"+a+",ordmain.total_prod_price"+a+")' /></td>"
														+ "<td>商品價格：</td><td><input type='text' name='prod_price"+a+"' value='"+prod_price+"' /></td>"
														+ "<td><input type='hidden' id='total_prod_price"+a+"' name='total_prod_price"+a+"' value='"+prod_price+"'/>"
														+ "<input type='button' value='刪除' class='btn btn-danger'></input></td></tr>")
										
										a = a + 1;
										//筆數+1
										ordmain.count.value=parseInt(ordmain.count.value)+1;
										
									})
								})
				
				$("#mem_id").blur(function() {
									if($('#mem_id').val() != ""){
										ordmain.emp_id.value='';
										$.getJSON('getByMem_id.do',{mem_id:$('#mem_id').val()},function(data){
											
											//取得JSON資料
											//不是會員
											if(data.error=="查無此帳號"){//查無此帳號時,預設查一般的折讓數
												alert(data.error);
												$.getJSON('getByDis_id.do',{dis_id:'一般'},function(data){
													//取得JSON資料
													ordmain.dis_price.value = data.dis_price;
													count_total_price();
													
												})
											}else{//是會員,找%數
												ordmain.emp_name.value ='';
												ordmain.mem_name.value = data.mem_name;
												$.getJSON('getByDis_id.do',{dis_id:'會員'},function(data){
													//取得JSON資料
													ordmain.dis_price.value = data.dis_price;
													count_total_price();
												})
											}
										})
									}else{//沒有輸入資料時,預設查一般的折讓數
										$.getJSON('getByDis_id.do',{dis_id:'一般'},function(data){
											//取得JSON資料
											ordmain.dis_price.value = data.dis_price;
											count_total_price();
										})
									}
									
								})
						
				$("#emp_id").blur(function() {
									if($('#emp_id').val() != ""){
										ordmain.mem_id.value='';
										$.getJSON('getByEmp_id.do',{emp_id:$('#emp_id').val()},function(data){
											//取得JSON資料
											//不是員工
											if(data.error=="查無此員工"){//查無此帳號時,預設查一般的折讓數
												alert(data.error);
												$.getJSON('getByDis_id.do',{dis_id:'一般'},function(data){
													//取得JSON資料
													ordmain.dis_price.value = data.dis_price;
													count_total_price();
												})
											}else{//是員工,找%數
												ordmain.mem_name.value ='';
												ordmain.emp_name.value = data.emp_name;
												$.getJSON('getByDis_id.do',{dis_id:'員工'},function(data){
													//取得JSON資料
													ordmain.dis_price.value = data.dis_price;
													count_total_price();	
												})
											}
										})
									}else{//沒有輸入資料時,預設查一般的折讓數
										$.getJSON('getByDis_id.do',{dis_id:'一般'},function(data){
											//取得JSON資料
											ordmain.dis_price.value = data.dis_price;
											count_total_price();
										})
									}
								})
								
								
								
				$("#cpon_id").blur(function() {
					if($('#cpon_id').val() != ""){
						
						$.getJSON('getByCpon_id.do',{cpon_id:$('#cpon_id').val()},function(data){
							//取得JSON資料
							if(data.error=="查無此禮券"){//查無此禮券時,預設查一般的折讓數
								alert(data.error);
										
								ordmain.cpon_dollar.value = 0;
								count_total_price();	
							}else{
								ordmain.cpon_dollar.value = data.cpon_dollar;
								count_total_price();
							}
						})
					}else{//沒有輸入資料時,預設查一般的折讓數
						
						ordmain.cpon_dollar.value = 0;
						count_total_price();
					}
				})
				
				
				$("#cash_temp").blur(function() {
				
					ordmain.charge.value = ordmain.cash.value - ordmain.total_price.value;
					ordmain.charge.value = ordmain.cash_temp.value - ordmain.total_price.value;
					ordmain.cash.value = ordmain.cash_temp.value - ordmain.charge.value;
				})				
	})
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
// 	$('#add').on('click',function(){
// 		var url = "ValuationList.jsp"; 
// 			$.ajax({
// 				type: "GET",
// 				url: url,
// 				success: function(data)
// 				 {
				     
// 				 }
// 			});
// 	})	

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
	

//<!----------------------------------------  送出全部查詢        ------------------------------------>
		$('#allsearch').on('click',function(){
			var url="SelectOrdAll.jsp";
		
			$.ajax({
				type:"POST",
				url:url,
				success:function()
				{
					window.open("SelectOrdAll.jsp");
				}
			})
		})
		


	</script>
</body>
</html>
