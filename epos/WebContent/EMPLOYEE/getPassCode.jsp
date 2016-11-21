<%@page import="java.awt.Checkbox"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage="" %>

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
<title>權限控管</title>
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
				<a href="<%=request.getContextPath()%>/index.jsp"> <img
					src="<c:url value="../resources/img/ui-sam.jpg"/>"
					class="img-circle" width="60"></a>
			</p>
			<h5 class="centered">ePOS</h5>

			<li class="mt"><a href="<%=request.getContextPath()%>/index.jsp"> <i
					class="fa fa-dashboard"></i> <span>index</span>
			</a></li>

			<li class="sub-menu"><a href="javascript:;" class="active"> <i
					class="fa fa-desktop"></i> <span>基本資料維護</span>
			</a>
				<ul class="sub">
					<li><a href="<%=request.getContextPath()%>/MEMBER/member.jsp">會員資料維護</a></li>
					<li class="active"><a
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
						href="<%=request.getContextPath()%>/RETURNS/returns.jsp">退貨單管理</a></li>
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
	</aside> <!--sidebar end--> 
	<section id="main-content"> <section class="wrapper">
	<div class="row mt">
		<nav class="nav navbar-default">
		<div class="tab-content">
			<ul class="nav navbar-nav ">
				<li><a href="employee.jsp" class="glyphicon glyphicon-search">搜尋</a></li>
				<li><a href="addEmp.jsp" class="glyphicon glyphicon-file">新增</a></li>
				<li><a href="SetPassCode.jsp" class="glyphicon glyphicon-lock">修改權限</a></li>
				<li><a href="#" class="glyphicon glyphicon-list-alt">查詢結果</a></li>
				<li><a style="background-color: rgba(172,214,255,0.6);">查詢權限</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="col-lg-4"
		style="float: right; left: -30%; position: relative;">
		<div class="form-panel">
			<jsp:useBean id="empSvc" scope="page"
				class="com.employee.model.EmpService" />
			<form method="post" action="setPassCode.do">
				<p>修改權限</p>
				<b>選擇員工姓名:</b> 
				<select size="1" name="emp_id" id="button Toggle">
					<c:forEach var="empVO" items="${empSvc.all}">
						<option value="${empVO.emp_id}">${empVO.emp_name}${empVO.emp_id}
					</c:forEach>
				</select>
				<h4>最大權限</h4>
<%-- 				<% if (rs("STOREADDRESS") = "Y")%> --%>
<!-- 				<input type="checkbox" name="checkbox" value="checkbox1" checked="checked" /> -->
<%--   				<% else %> --%>
<!--   				<input type="checkbox" name="checkbox" value="ALL" />通行無阻<br> -->

				<input type="checkbox" name="pass_code" value="ALL" checked>通行無阻<br>

				<h4>會員資料維護</h4>
				<input type="checkbox" name="pass_code" value="/insertMemb.do" checked>新增會員<br>
				<input type="checkbox" name="pass_code" value="/allMemb.do" checked>查詢全部會員<br>
				<input type="checkbox" name="pass_code" value="/Memb.do" checked>依照會員編號、姓名搜詢<br>
				<input type="checkbox" name="pass_code" value="/datesMem.do" checked>依新增日期搜詢<br>
				<input type="checkbox" name="pass_code" value="/updateMem.do" checked>修改員工<br>
				<input type="checkbox" name="pass_code" value="/deleteMem.do" checked>刪除員工<br>
				<h4>員工維護</h4>
				<input type="checkbox" name="pass_code" value="/getOneEmp.do" checked>依照員工編號搜詢<br>
				<input type="checkbox" name="pass_code" value="/getAllEmp.do" checked>查詢全部員工<br>
				<input type="checkbox" name="pass_code" value="/insertEmp.do" checked>新增員工<br>
				<input type="checkbox" name="pass_code" value="/getEmpByName.do" checked>依照員工姓名搜詢 <br> 
				<input type="checkbox" name="pass_code" value="/updateDeleteEmp.do" checked>修改刪除員工<br> 
				<input type="checkbox" name="pass_code" value="/updateEmp.do" checked>修改員工<br>
				<input type="checkbox" name="pass_code" value="/setPassCode.do" checked>權限設定<br>
				<h4>廠商資料維護</h4>
				<input type="checkbox" name="pass_code" value="/getOneCom.do" checked>依廠商編號搜尋<br>
				<input type="checkbox" name="pass_code" value="/getComByName.do" checked>依廠商名稱搜尋<br>
				<input type="checkbox" name="pass_code" value="/getAllCom.do" checked>搜尋全部廠商<br>
				<input type="checkbox" name="pass_code" value="/insertCom.do" checked>新增廠商<br>
				<input type="checkbox" name="pass_code" value="/updateDeleteCom.do" checked>刪除修改廠商<br>
				<input type="checkbox" name="pass_code" value="/updateCom.do" checked>修改廠商<br>

				<h4>請購單維護</h4>
				<input type="checkbox" name="pass_code" value="/insertReq.do" checked>新增請購單<br>
				<input type="checkbox" name="pass_code" value="/getAllReq.do" checked>查詢全部請購單<br>
				<input type="checkbox" name="pass_code" value="/getByReq_id.do" checked>依請購單編號、日期搜詢<br>
				<input type="checkbox" name="pass_code" value="/selectOfN.do" checked>審核請購單<br>
				<input type="checkbox" name="pass_code" value="/DetailDeleteReq.do" checked>刪除修改顯示請購單明細<br>
				<h4>詢價單維護</h4>
				<input type="checkbox" name="pass_code" value="/insertQuo.do" checked>新增詢價單<br>
				<input type="checkbox" name="pass_code" value="/getAllQuo.do" checked>查詢全部詢價單<br>
				<input type="checkbox" name="pass_code" value="/getByQuo_id.do" checked>依詢價單編號、日期搜詢<br>
				<input type="checkbox" name="pass_code" value="/selectOfN.do" checked>審核詢價單<br>
				<input type="checkbox" name="pass_code" value="/DetailDeleteQuo.do" checked>刪除、修改顯示詢價單明細<br>
				<h4>採購單維護</h4>
				<input type="checkbox" name="pass_code" value="/insertPur.do" checked>新增採購單<br>
				<input type="checkbox" name="pass_code" value="/getAllPur.do" checked>查詢全部採購單<br>
				<input type="checkbox" name="pass_code" value="/getOnePurforDisplay.do" checked>依採購單編號搜詢<br> 
				<input type="checkbox" name="pass_code" value="/selectOfN.do" checked>審核採購單<br>
				<input type="checkbox" name="pass_code" value="/updateQuo.do" checked>修改採購單<br>
				<input type="checkbox" name="pass_code" value="/DetailUpdateDeletePur.do" checked>刪除修改顯示採購單明細<br> 
				<input type="checkbox" name="pass_code" value="/deleteDetailPur.do" checked>刪除採購單明細<br>
				<input type="checkbox" name="pass_code" value="/updatePur.do" checked>修改採購單<br>
				<h4>進貨單維護</h4>
				<input type="checkbox" name="pass_code" value="/insertBOP.do" checked>新增進貨單<br>
				<input type="checkbox" name="pass_code" value="/updateBOP.do" checked>修改進貨單<br> 
				<input type="checkbox" name="pass_code" value="/getOneBopforDisplay.do" checked>依照進貨單編號搜詢 <br> 
				<input type="checkbox" name="pass_code" value="/getAllBop.do" checked>查詢全部進貨單<br> 
				<input type="checkbox" name="pass_code" value="/deleteDetailBOP.do" checked>刪除進貨單明細 <br> 
				<input type="checkbox" name="pass_code" value="/DetailUpdateDeleteBOP.do" checked>查詢刪除修改進貨單<br>
				<h4>報價單維護</h4>
				<input type="checkbox" name="pass_code" value="/addVltList.do" checked>新增報價單<br> 
				<input type="checkbox" name="pass_code" value="/VltListServlet.do" checked>修改報價單 <br> 
				<input type="checkbox" name="pass_code" value="/getAllVlt.do" checked>查詢全部報價單<br> 
				<input type="checkbox" name="pass_code" value="/getVltDate.do" checked>依報價單日期搜詢 <br> <input
					type="checkbox" name="pass_code" value="/getByVlt_id.do" checked>依報價單編號搜詢
				<br> <input type="checkbox" name="pass_code" value="/Querydetail_DeleteVlt.do" checked>刪除顯示報價單明細 <br>
				<h4>訂單維護</h4>
				<!-- 								<input type="checkbox" name="pass_code" value="/Order.do" >新增訂單<br> -->
				<!-- 								<input type="checkbox" name="pass_code" value="/Order.do" >修改訂單<br> -->
				<h4>出貨單維護</h4>
				<input type="checkbox" name="pass_code" value="/insertShip.do" checked>新增出貨單<br> 
				<input type="checkbox" name="pass_code" value="/getShipByDate.do" checked>依出貨單日期搜詢 <br> 
				<input type="checkbox" name="pass_code" value="/getAllShip.do" checked>查詢全部出貨單<br> 
				<input type="checkbox" name="pass_code" value="/getShipByShipId.do" checked>依出貨單編號搜詢 <br> 
				<input type="checkbox" name="pass_code" value="/getShipByOrdId.do" checked>依訂單編號搜詢<br> 
				<input type="checkbox" name="pass_code" value="/detailDeleteShip.do" checked>刪除顯示出貨單明細 <br>
				<h4>商品管理</h4>
				<input type="checkbox" name="pass_code" value="/insertProd.do" checked>新增商品<br> 
				<input type="checkbox" name="pass_code" value="/updateDeleteProd.do" checked>刪除修改商品 <br> 
				<input type="checkbox" name="pass_code" value="/updateProd.do" checked>修改商品<br> 
				<input type="checkbox" name="pass_code" value="/getAllProd.do" checked>查詢全部商品 <br> 
				<input type="checkbox" name="pass_code" value="/getOneProd.do" checked>依商品編號搜尋<br> 
				<input type="checkbox" name="pass_code" value="/getProdByName.do" checked>依商品名稱搜尋 <br> 
				<input type="checkbox" name="pass_code" value="/getProdByGroup.do" checked>依商品類別搜尋<br>
				<h4>促銷商品管理</h4>
				<input type="checkbox" name="pass_code" value="/insertProm.do" checked>新增促銷品<br> 
				<input type="checkbox" name="pass_code" value="/deleteProm.do" checked>刪除促銷品 <br> 
				<input type="checkbox" name="pass_code" value="/updateProm.do" checked>修改促銷品<br> 
				<input type="checkbox" name="pass_code" value="/allProm.do" checked>查尋全部促銷品 <br> 
				<input type="checkbox" name="pass_code" value="/namesProm.do" checked>依促銷品編號搜尋<br> 
				<input type="checkbox" name="pass_code" value="/datesProm.do" checked>依促銷日期搜尋 <br> 
				<input type="checkbox" name="pass_code" value="/idsProm.do" checked>依促銷編號範圍搜尋<br>
				<h4>退貨品管理</h4>
				<input type="checkbox" name="pass_code" value="/insert_Item.do" checked>新增退貨品<br> 
				<input type="checkbox" name="pass_code" value="/delete_Item.do" checked>刪除退貨品 <br> 
				<input type="checkbox" name="pass_code" value="/update_Item.do" checked>修改退貨品<br> 
				<input type="checkbox" name="pass_code" value="/getName_Item.do" checked>依退貨品名稱搜尋 <br> 
				<input type="checkbox" name="pass_code" value="/getComId.do" checked>依廠商編號搜尋<br>
				<h4>退貨單管理</h4>
				<input type="checkbox" name="pass_code" value="/insert.do" checked>新增退貨單
				<br> <input type="checkbox" name="pass_code" value="/delete.do" checked>刪除退貨單
				<br> <input type="checkbox" name="pass_code" value="/update.do" checked>修改退貨單
				<br> <input type="checkbox" name="pass_code" value="/getOne.do" checked>依退貨單編號搜尋
				<br> <input type="checkbox" name="pass_code" value="/getOne.do" checked>依退貨單編號搜尋
				<br> <input type="checkbox" name="pass_code" value="/getDate.do" checked>依退貨單日期搜尋 <br> 
				<input type="checkbox" name="pass_code" value="/getDate.do" checked>依退貨單日期搜尋
				<br> <input type="checkbox" name="pass_code" value="/getComName.do" checked>依廠商名稱搜尋<br> 
				<input type="checkbox" name="pass_code" value="/getDetail.do" checked>顯示退貨單明細<br>
				<h4>作廢發票管理</h4>
				<input type="checkbox" name="pass_code" value="/insertInvo.do" checked>新增作廢發票<br>
				<input type="checkbox" name="pass_code" value="/deleteInvo.do" checked>刪除作廢發票<br>
				<input type="checkbox" name="pass_code" value="/updateInvo.do" checked>修改作廢發票<br>
				<input type="checkbox" name="pass_code" value="/updateInvo.do" checked>搜群全部作廢發票<br>
				<input type="checkbox" name="pass_code" value="/getOneinvo.do" checked>依發票編號搜尋<br>
				<input type="checkbox" name="pass_code" value="/getOneinvo.do" checked>依發票編號搜尋<br>
				<h4>班別報表維護</h4>
				<input type="checkbox" name="pass_code" value="/insertShiftre.do" checked>新增班別報表<br>
				<input type="checkbox" name="pass_code" value="/updateDeleteShiftre.do" checked>刪除班別報表<br> 
				<input type="checkbox" name="pass_code" value="/updateShiftre.do" checked>修改班別報表<br>
				<input type="checkbox" name="pass_code" value="/updateShiftre.do" checked>依班別報表搜尋<br>
				<input type="checkbox" name="pass_code" value="/getAllShiftre.do" checked>查詢全部<br>
				<input type="checkbox" name="pass_code" value="/getShiftreByDate.do" checked>依日期搜尋<br>
				<h4>折價券</h4>
				<input type="checkbox" name="pass_code" value="/insertCpon.do" checked>新增折價券<br>
				<input type="checkbox" name="pass_code" value="/deleteCpon.do" checked>刪除折價券<br>
				<input type="checkbox" name="pass_code" value="/updateCpon.do" checked>修改折價券<br>
				<input type="checkbox" name="pass_code" value="/coupon.do" checked>依折價券編號搜尋<br>
				<input type="checkbox" name="pass_code" value="/namesCpon.do" checked>依折價券名稱搜尋<br>
				<input type="checkbox" name="pass_code" value="/dollarCpon.do" checked>依折價券金額搜尋<br>
				<input type="checkbox" name="pass_code" value="/datesCpon.do" checked>依折價券日期搜尋<br>
				<input type="checkbox" name="pass_code" value="/allCpon.do" checked>查詢全部<br>
				<h4>折扣管理</h4>
				<input type="checkbox" name="pass_code" value="/insertDisc.do" checked>新增折扣<br>
				<input type="checkbox" name="pass_code" value="/deleteDisc.do" checked>刪除折扣<br>
				<input type="checkbox" name="pass_code" value="/updateDisc.do" checked>修改折扣<br>
				<input type="checkbox" name="pass_code" value="/disc.do" checked>依折扣身分、%數搜尋<br>
				<input type="checkbox" name="pass_code" value="/allDisc.do" checked>查詢全部<br>
				<input type="submit" value="修改權限" class="btn btn-round btn-theme03" id="button Toggle">
				
			</form>
		</div>
	</div><div class="a"></div>
	</section> </section> </section>
	<script>
		!window.jQuery
				&& document
						.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>

	<script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
	<script class="include" type="text/javascript"
		src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.nicescroll.js" />"
		type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>
	<!------------------------------------------------ 程式 --------------------------------------------------------------->
	<script src="<c:url value="../resources/js/gen_validatorv4.js" />"
		type="text/javascript"></script>
	<script>
<%-- 	<% for(var i=0 ; i < (list.pass_code).length() ; i++){
		if(list.contains($(:checkbox[name="pass_code"]).val())){
			$(:checkbox[name="pass_code"]).val().attr(check:checked);
		}
	}%> --%>
 		$(function() {
 			$('select').change(function() {
		  	
// 		切換各自checkbox的勾選狀態
				$(':checkbox[name="pass_code"]').each(function(){
	<c:forEach var="list" items="${list}">
		var code = ${list.pass_code};
	</c:forEach>

					if(code.contains($(':checkbox[name="pass_code"]').val()))
					{
						var b = !$(this).prop('checked');
						$(this).prop('checked',b);
					}
				});
 			})
		})
	</script>

</body>
</html>