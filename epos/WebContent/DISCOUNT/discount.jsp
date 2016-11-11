<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.discount.model.*"%>

<%
	DiscountService DiscSvc = new DiscountService();
	List<DiscountVO> list = DiscSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<html>
<head>

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
.main{
	height:200px;
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
				<a id="add" href="#" ><span class="glyphicon glyphicon-file"></span>新增</a>　　　
		    	<a href="#" onclick="window.open('searchdisc.jsp', 'Yahoo', config='height=500,width=850')"><span class="glyphicon glyphicon-search"></span>查詢</a>　　
		    	<a id="print" href="javaScript:varitext()"><span class="glyphicon glyphicon-print" ></span>列印</a>　　　
		    	<a id="sub" href="javascript:document.discform.submit()"><span class="glyphicon glyphicon-ok-sign">送出</span></a>　
				</div>


				</nav>
			</div>


			<FORM id="discform" name="discform" METHOD="post" ACTION="insertDisc.do" class="form-inline">
				<div class="form-group">
					<label for="exampleInputName2">　折扣身分：</label> 
					<input type=text class="form-control" name="dis_id" placeholder="其他" size="10">
				</div> 　　
				<div class="form-group">
						<label for="exampleInputName2">折扣%數：</label> 
						<input type="text" class="form-control" name="dis_price" placeholder="1.0" size="10">
				</div>　　　
			</FORM>

		</div>
		<!-- -----------------------------------------------------------表格----------------------------------------------------------- -->
		<div>
			<div class="titledetail">折扣</div>
			<table id="table1"
				class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<td align='center'>折扣身分</td>
						<td align='center'>折扣%數</td>
						<td align='center'>修改</td>
						<td align='center'>刪除</td>
					</tr>
				</thead>
				<tbody class="chg_insert">
					<c:forEach var="discVO" items="${list}">
						<tr class="table2" align='center' valign='middle'>
							<td>${discVO.dis_id}</td>
							<td>
								<label>${discVO.dis_price}</label>
								<input type="text" name="dis_price" size="5" class="chg_price">
							</td>
							<td>
								<button type="button" class="btn btn-success" onclick="editEvent(this)" target="${discVO.dis_id}"><i class="fa fa-pencil"></i></button>
								<button type="button" class="btn btn-primary" onclick="confirmEvent(this)" ><i class="fa fa-check"></i></button>
							</td>
							<td>
				    			<button type="button" class="btn btn-danger" target="${discVO.dis_id}"><i class="fa fa-trash-o "></i></button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	</section> </section> </section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery&& document.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
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
	
	$(document).ready(function() {
		$('.btn-primary').hide();
		$('.chg_price').hide();
	})
	
//<!----------------------------------------按下新增按鈕事件------------------------------------>	
		 	$(function () {

// 				$('#sub').on('click',function(){
// 			    $.ajax({
// 			           type: "POST",
// 			           url: "insertDisc.do",
// 			           data: $("#discform").serialize(), 
// 			           async: false,
// 			           success: {}

// 					        	   $(".chg_insert td").remove();
// 					        	   $.ajax({
// 									       type: "POST",
// 									       url: "alljson.do",
// 									       data: {},
// 									       success: function(data)
// 									       {
// 									    	   var tbody = $('.chg_insert');
//建新表格												
// 												$.each($.parseJSON(data), function() {
// 													var n = this.dis_id
// 													var v = this.dis_price
// 													var tr = $("<tr>");
// 													var td1 = $("<td>");		//id
// 													var td2 = $("<td>");		//price
// 													var td3 = $("<td>");		//update
// 													var td4 = $("<td>");		//delete
// 													var lab = $("<label>");
// 													var inp = $("<input>");
// 													var btn1 = $("<button>");		//update
// 													var btn2 = $("<button>");		//check
// 													var btn3 = $("<button>");		//delete
// 													var i3 = $("<i>");
// 													tr.attr({'class':'table2','align':'center','valign':'middle'});
// 													inp.attr({'class':'chg_price','size':'5','name':'dis_price'});
// 													btn3.attr({'class':'btn btn-danger','type':'button','target':'n'});
// 													btn3.append(i3.attr('class','fa fa-trash-o'));
// 													td1.append(n);
// 													tr.append(td1).append(td2.append(lab.append(v)).append(inp)).append(btn3);
// 													tbody.append(tr);
// 													$('.chg_price').hide();

// 												})				
// 									       }
// 								  });

// 			           	})
// 			         })
				
//<!----------------------------------------按下刪除按鈕事件------------------------------------>
				$('.btn-danger').on('click',function(){	
					var tr = $(this).parent().parent();
					var id = $(this).attr('target');
			    	var url = "deleteDisc.do"; 
				    $.ajax({
				           type: "POST",
				           url: url,
				           data: {dis_id:id},
				           success: function(data)
				           {
								tr.remove();
				           }
				         });
				})
//<!----------------------------------------列印------------------------------------>	
	function varitext(text){
		text=document
		print(text)
		}
//<!----------------------------------------  表格 ------------------------------------>
		 		$('#table1').DataTable();
		 	})
//<!----------------------------------------按下修改按鈕事件------------------------------------>				
	function editEvent(event) {
		var $label = $(event).parent().parent().find("td:eq(1) > label");
		var value = $label.html();
		var input = $(event).parent().parent().find("td:eq(1) input");
		input.val(value);
		$label.hide();
		input.show();		
		$(event).hide();
		$(event).parent().find("button:eq(1)").show();
	}
//<!----------------------------------------按下確認按鈕事件------------------------------------>
	function confirmEvent(event) {
		var id = $(event).parent().parent().find("td:eq(0)").html(); //id
		var inp = $(event).parent().parent().find(":text");
		var value =inp.val();

		var $label = $(event).parent().parent().find("td:eq(1) > label");
		$.ajax({
			"type" : "post",
			"url" : "updateDisc.do",
			"data" : {
				dis_id : id,
				dis_price : value
			},
			"success" :{}
		});
			
		inp.hide();
		$label.html(value);
		$label.show();
		$(event).hide();
		$(event).parent().find("button:eq(0)").show();
	}
</script>
</body>
</html>
