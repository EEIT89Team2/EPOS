<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>employee</title>
</head>
<body>
<jsp:useBean id="empSvc" scope="page" class="com.employee.model.EmpService" />
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

    	<section id="main-content">
	   		<section class="wrapper">
				<div class="row mt">
					<nav class="nav navbar-default">
						<div class="container-fluid" style="float: right; left: -50%; position: relative;">
							<ul class="nav navbar-nav">
								<li id="search1"><a data-toggle="tab" href="#search">搜尋</a></li>
								<li id="new1"><a data-toggle="tab" href="#new">新增</a></li>
								<li><a data-toggle="tab" href="#passcode" class="passscode">修改權限</a></li>
								<li id="result"><a data-toggle="tab" href="#resolution">查詢結果</a></li>
							</ul>
						</div>
					</nav>
					<div class="tab-content">
						<div id="search" class="tab-pane fade">
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

							<div class="col-lg-6">
								<div class="form-panel">
									<h4 class="mb">
										<i class="fa fa-angle-right"></i> 查詢
									</h4>
									<form method="post" action="getOneEmp.do" id="empId" class="form-horizontal style-form">
										<div class="form-group">
												<label class="col-sm-5 col-sm-3 control-label">依員工編號搜尋</label>
											<div class="col-sm-3">
												<input type="text" name="emp_id">
<!-- 												<input type="submit" value="搜尋"> -->
											</div>
											<div class="col-sm-4">
												<input type="button" value="依員工編號搜尋" class="btn btn-round btn-theme03">
											</div>
										</div>
									</form>
									<form METHOD="post" ACTION="getEmpByName.do" id="name" class="form-horizontal style-form">
										<div class="form-group">
											<label class="col-sm-5 col-sm-3 control-label">姓名關鍵字查詢</label>
											<div class="col-sm-3">
												<input type="text" name="emp_name"><br>
											</div>
											<div class="col-sm-4">
													<input type="button" value="姓名關鍵字查詢" class="btn btn-round btn-theme03">
											</div>
										</div>
									</form>
									<form METHOD="post" ACTION="getAllEmp.do" id="all" class="form-horizontal style-form">
										<div class="form-group">
										<label class="col-sm-5 col-sm-3 control-label">查詢全部</label>
											<div class="col-sm-3"></div>
											<div class="col-sm-4">
												<input type="button" value="查詢全部" class="btn btn-round btn-theme03">
											</div>
										</div>
									</form>
									<div class="sub-context"></div>
								</div>
							</div>
						</div>
						<div id="passcode" class="tab-pane fade">
							<form method="post" action="setPassCode.do" id="change">
								<p>修改權限</p>
								<b>選擇員工姓名:</b>
      							 <select size="1" name="emp_id">
        							 <c:forEach var="empVO" items="${empSvc.all}" > 
         								 <option value="${empVO.emp_id}">${empVO.emp_name} ${empVO.emp_id}
        							 </c:forEach>   
      							 </select>
       
								<h4>最大權限</h4>
								<input type="checkbox" name="pass_code" value="ALL" >通行無阻<br>

								<h4>會員資料維護</h4>
								<input type="checkbox" name="pass_code" value="/insertMemb.do" >新增會員<br>
								<input type="checkbox" name="pass_code" value="/allMemb.do" >查詢全部會員<br>
								<input type="checkbox" name="pass_code" value="/Memb.do" >依照會員編號、姓名搜詢<br>
								<input type="checkbox" name="pass_code" value="/datesMem.do" >依新增日期搜詢<br>
								<input type="checkbox" name="pass_code" value="/updateMem.do" >修改員工<br>
								<input type="checkbox" name="pass_code" value="/deleteMem.do" >刪除員工<br>
								<h4>員工維護</h4>
								<input type="checkbox" name="pass_code" value="/getOneEmp.do" >依照員工編號搜詢<br>
								<input type="checkbox" name="pass_code" value="/getAllEmp.do" >查詢全部員工<br>
								<input type="checkbox" name="pass_code" value="/insertEmp.do" >新增員工<br>
								<input type="checkbox" name="pass_code" value="/getEmpByName.do" >依照員工姓名搜詢  <br>
								<input type="checkbox" name="pass_code" value="/updateDeleteEmp.do" >修改刪除員工<br>
								<input type="checkbox" name="pass_code" value="/updateEmp.do" >修改員工<br>
								<input type="checkbox" name="pass_code" value="/setPassCode.do" >權限設定<br>
								<h4>廠商資料維護</h4>
								<input type="checkbox" name="pass_code" value="/getOneCom.do" >依廠商編號搜尋<br>
								<input type="checkbox" name="pass_code" value="/getComByName.do" >依廠商名稱搜尋<br>								
								<input type="checkbox" name="pass_code" value="/getAllCom.do" >搜尋全部廠商<br>								
								<input type="checkbox" name="pass_code" value="/insertCom.do" >新增廠商<br>																
								<input type="checkbox" name="pass_code" value="/updateDeleteCom.do" >刪除修改廠商<br>																																																
								<input type="checkbox" name="pass_code" value="/updateCom.do" >修改廠商<br>																																																
								
								<h4>請購單維護</h4>
								<input type="checkbox" name="pass_code" value="/insertReq.do" >新增請購單<br>
								<input type="checkbox" name="pass_code" value="/getAllReq.do" >查詢全部請購單<br>
								<input type="checkbox" name="pass_code" value="/getByReq_id.do" >依請購單編號、日期搜詢<br>
								<input type="checkbox" name="pass_code" value="/selectOfN.do" >審核請購單<br>																							
								<input type="checkbox" name="pass_code" value="/DetailDeleteReq.do" >刪除修改顯示請購單明細<br>
								<h4>詢價單維護</h4>
								<input type="checkbox" name="pass_code" value="/insertQuo.do" >新增詢價單<br>
								<input type="checkbox" name="pass_code" value="/getAllQuo.do" >查詢全部詢價單<br>
								<input type="checkbox" name="pass_code" value="/getByQuo_id.do" >依詢價單編號、日期搜詢<br>
								<input type="checkbox" name="pass_code" value="/selectOfN.do" >審核詢價單<br>
								<input type="checkbox" name="pass_code" value="/DetailDeleteQuo.do" >刪除、修改顯示詢價單明細<br>																								
								<h4>採購單維護</h4>
								<input type="checkbox" name="pass_code" value="/insertPur.do" >新增採購單<br>
								<input type="checkbox" name="pass_code" value="/getAllPur.do" >查詢全部採購單<br>
								<input type="checkbox" name="pass_code" value="/getOnePurforDisplay.do" >依採購單編號搜詢<br>
								<input type="checkbox" name="pass_code" value="/selectOfN.do" >審核採購單<br>
								<input type="checkbox" name="pass_code" value="/updateQuo.do" >修改採購單<br>	
								<input type="checkbox" name="pass_code" value="/DetailUpdateDeletePur.do" >刪除修改顯示採購單明細<br>	
								<input type="checkbox" name="pass_code" value="/deleteDetailPur.do" >刪除採購單明細<br>	
								<input type="checkbox" name="pass_code" value="/updatePur.do" >修改採購單<br>	
								<h4>進貨單維護</h4>
								<input type="checkbox" name="pass_code" value="/insertBOP.do" >新增進貨單<br>
								<input type="checkbox" name="pass_code" value="/updateBOP.do" >修改進貨單  <br>
								<input type="checkbox" name="pass_code" value="/getOneBopforDisplay.do" >依照進貨單編號搜詢 <br>
								<input type="checkbox" name="pass_code" value="/getAllBop.do" >查詢全部進貨單  <br>
								<input type="checkbox" name="pass_code" value="/deleteDetailBOP.do" >刪除進貨單明細	<br>
								<input type="checkbox" name="pass_code" value="/DetailUpdateDeleteBOP.do" >查詢刪除修改進貨單	<br>
								<h4>報價單維護</h4>
								<input type="checkbox" name="pass_code" value="/addVltList.do" >新增報價單	<br>
								<input type="checkbox" name="pass_code" value="/VltListServlet.do" >修改報價單	<br>
								<input type="checkbox" name="pass_code" value="/getAllVlt.do" >查詢全部報價單	<br>
								<input type="checkbox" name="pass_code" value="/getVltDate.do" >依報價單日期搜詢	<br>
								<input type="checkbox" name="pass_code" value="/getByVlt_id.do" >依報價單編號搜詢	<br>
								<input type="checkbox" name="pass_code" value="/Querydetail_DeleteVlt.do" >刪除顯示報價單明細	<br>
								<h4>訂單維護</h4>
<!-- 								<input type="checkbox" name="pass_code" value="/Order.do" >新增訂單<br> -->
<!-- 								<input type="checkbox" name="pass_code" value="/Order.do" >修改訂單<br> -->
								<h4>出貨單維護</h4>
								<input type="checkbox" name="pass_code" value="/insertShip.do" >新增出貨單	<br>
								<input type="checkbox" name="pass_code" value="/getShipByDate.do" >依出貨單日期搜詢	<br>
								<input type="checkbox" name="pass_code" value="/getAllShip.do" >查詢全部出貨單	<br>
								<input type="checkbox" name="pass_code" value="/getShipByShipId.do" >依出貨單編號搜詢	<br>
								<input type="checkbox" name="pass_code" value="/getShipByOrdId.do" >依訂單編號搜詢	<br>
								<input type="checkbox" name="pass_code" value="/detailDeleteShip.do" >刪除顯示出貨單明細	<br>
								<h4>商品管理</h4>
								<input type="checkbox" name="pass_code" value="/insertProd.do" >新增商品	<br>
								<input type="checkbox" name="pass_code" value="/updateDeleteProd.do" >刪除修改商品	<br>
								<input type="checkbox" name="pass_code" value="/updateProd.do" >修改商品	<br>
								<input type="checkbox" name="pass_code" value="/getAllProd.do" >查詢全部商品	<br>
								<input type="checkbox" name="pass_code" value="/getOneProd.do" >依商品編號搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getProdByName.do" >依商品名稱搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getProdByGroup.do" >依商品類別搜尋	<br>
								<h4>促銷商品管理</h4>
								<input type="checkbox" name="pass_code" value="/insertProm.do" >新增促銷品	<br>
								<input type="checkbox" name="pass_code" value="/deleteProm.do" >刪除促銷品	<br>
								<input type="checkbox" name="pass_code" value="/updateProm.do" >修改促銷品	<br>
								<input type="checkbox" name="pass_code" value="/allProm.do" >查尋全部促銷品	<br>
								<input type="checkbox" name="pass_code" value="/namesProm.do" >依促銷品編號搜尋	<br>
								<input type="checkbox" name="pass_code" value="/datesProm.do" >依促銷日期搜尋	<br>
								<input type="checkbox" name="pass_code" value="/idsProm.do" >依促銷編號範圍搜尋	<br>
								<h4>退貨品管理</h4>
								<input type="checkbox" name="pass_code" value="/insert_Item.do" >新增退貨品	<br>
								<input type="checkbox" name="pass_code" value="/delete_Item.do" >刪除退貨品	<br>
								<input type="checkbox" name="pass_code" value="/update_Item.do" >修改退貨品	<br>
								<input type="checkbox" name="pass_code" value="/getName_Item.do" >依退貨品名稱搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getComId.do" >依廠商編號搜尋	<br>
								<h4>退貨單管理</h4>
								<input type="checkbox" name="pass_code" value="/insert.do" >新增退貨單	<br>
								<input type="checkbox" name="pass_code" value="/delete.do" >刪除退貨單	<br>
								<input type="checkbox" name="pass_code" value="/update.do" >修改退貨單	<br>
								<input type="checkbox" name="pass_code" value="/getOne.do" >依退貨單編號搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getOne.do" >依退貨單編號搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getDate.do" >依退貨單日期搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getDate.do" >依退貨單日期搜尋	<br>
								<input type="checkbox" name="pass_code" value="/getComName.do" >依廠商名稱搜尋<br>
								<input type="checkbox" name="pass_code" value="/getDetail.do" >顯示退貨單明細<br>
								<h4>作廢發票管理</h4>
								<input type="checkbox" name="pass_code" value="/insertInvo.do" >新增作廢發票<br>
								<input type="checkbox" name="pass_code" value="/deleteInvo.do" >刪除作廢發票<br>
								<input type="checkbox" name="pass_code" value="/updateInvo.do" >修改作廢發票<br>
								<input type="checkbox" name="pass_code" value="/updateInvo.do" >搜群全部作廢發票<br>
								<input type="checkbox" name="pass_code" value="/getOneinvo.do" >依發票編號搜尋<br>
								<input type="checkbox" name="pass_code" value="/getOneinvo.do" >依發票編號搜尋<br>
								<h4>班別報表維護</h4>
								<input type="checkbox" name="pass_code" value="/insertShiftre.do" >新增班別報表<br>
								<input type="checkbox" name="pass_code" value="/updateDeleteShiftre.do" >刪除班別報表<br>
								<input type="checkbox" name="pass_code" value="/updateShiftre.do" >修改班別報表<br>
								<input type="checkbox" name="pass_code" value="/updateShiftre.do" >依班別報表搜尋<br>
								<input type="checkbox" name="pass_code" value="/getAllShiftre.do" >查詢全部<br>
								<input type="checkbox" name="pass_code" value="/getShiftreByDate.do" >依日期搜尋<br>
								<h4>折價券</h4>
								<input type="checkbox" name="pass_code" value="/insertCpon.do" >新增折價券<br>
								<input type="checkbox" name="pass_code" value="/deleteCpon.do" >刪除折價券<br>
								<input type="checkbox" name="pass_code" value="/updateCpon.do" >修改折價券<br>
								<input type="checkbox" name="pass_code" value="/coupon.do" >依折價券編號搜尋<br>
								<input type="checkbox" name="pass_code" value="/namesCpon.do" >依折價券名稱搜尋<br>
								<input type="checkbox" name="pass_code" value="/dollarCpon.do" >依折價券金額搜尋<br>
								<input type="checkbox" name="pass_code" value="/datesCpon.do" >依折價券日期搜尋<br>
								<input type="checkbox" name="pass_code" value="/allCpon.do" >查詢全部<br>
								<h4>折扣管理</h4>
								<input type="checkbox" name="pass_code" value="/insertDisc.do" >新增折扣<br>
								<input type="checkbox" name="pass_code" value="/deleteDisc.do" >刪除折扣<br>
								<input type="checkbox" name="pass_code" value="/updateDisc.do" >修改折扣<br>
								<input type="checkbox" name="pass_code" value="/disc.do" >依折扣身分、%數搜尋<br>
								<input type="checkbox" name="pass_code" value="/disc.do" >查詢全部<br>
								<input type="submit" value="修改權限" class="btn btn-round btn-theme03">
		   					</form>
						</div>
						<div id="new" class="tab-pane fade">
							<div class="col-lg-4">
								<div class="form-panel">
									<h4 class="mb">
										<i class="fa fa-angle-right"></i> 新增
									</h4>
								錯誤表列
						<c:if test="${not empty errorMsgs}">
							<font color='red'>請修正以下錯誤:
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li>${message}</li>
									</c:forEach>
								</ul>
							</font>
						</c:if>

									<form class="form-inline" METHOD="post" ACTION="insertEmp.do" id="insert" enctype="multipart/form-data">
										密碼<input type="text" name="emp_pwd" value="3310"><br> 
										姓名<input type="text" name="emp_name" value="柯大中"><br> 
										性別<input type="text" name="emp_sex" value="男"><br> 
										身分證<input type="text" name="emp_idnum" value="A132789952"><br> 
										地址<input type="text" name="emp_addr" value="台北市新生北路五段一號"><br>
										電子信箱<input type="text" name="emp_mail" value="dadaa@gmail.com"><br>
										電話<input type="text" name="emp_phone" value="0988456877"><br>
										生日<input type="date" name="emp_bday" value="1991-08-26"><br>
										到職日<input type="date" name="emp_reg" value="2016-09-30"><br>
										離職日<input type="date" name="emp_due"><br>
									            照片<input type="file" name="picture"><br> 
									            修改人<input type="text" name="key_id" value="E00005"><br> 
									    <input type="submit" value="新增">
										<input type="button" value="送出新增" class="btn btn-theme03">
									</form>
								</div>
							</div>
						</div>
						<div id="resolution" class="tab-pane fade">
							<div class="form-panel">
								<h4 class="mb">
									<i class="fa fa-angle-right"></i> 查詢結果
								</h4>
								<div class="result-context"></div>
							</div>
						</div>
					</div>
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
	<script class="include" type="text/javascript"
		src="<c:url value="../resources/js/jquery.dcjqaccordion.2.7.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.scrollTo.min.js" />"></script>
	<script src="<c:url value="../resources/js/jquery.nicescroll.js" />"
ㄒ		type="text/javascript"></script>

	<!--common script for all pages-->
	<script src="<c:url value="../resources/js/common-scripts.js" />"></script>
<script type="text/JavaScript">
	$(document).ready(function() {

		$(function() {

			$(":button").click(function() {
				if ("查詢全部" == $(this).val()) {
					var all = $("#all");
					$.ajax({
						"type" : all.attr("method"),
						"url" : all.attr("action"),
						"data" : all.serialize(),
						"success" : function(data) {
							$(".result-context").html(data);
							$("#result").attr("class","active");
							$("#search1").removeAttr("class");
							$("#search").attr("class","tab-pane fade");
							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("依員工編號搜尋" == $(this).val()) {
					var empId = $("#empId");
					$.ajax({
						"type" : empId.attr("method"),
						"url" : empId.attr("action"),
						"data" : empId.serialize(),
						"success" : function(data) {
							$(".result-context").html(data)
							$("#result").attr("class","active");
							$("#search1").removeAttr("class");
							$("#search").attr("class","tab-pane fade");
							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("姓名關鍵字查詢" == $(this).val()) {
					var name = $("#name");
					$.ajax({
						"type" : name.attr("method"),
						"url" : name.attr("action"),
						"data" : name.serialize(),
						"success" : function(data) {
							$(".result-context").html(data)
							$("#result").attr("class","active");
							$("#search1").removeAttr("class");
							$("#search").attr("class","tab-pane fade");
							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("送出新增" == $(this).val()) {
					var insert = $("#insert");
					$.ajax({
						"type" : insert.attr("method"),
						"url" : insert.attr("action"),
						"data" : insert.serialize(),
						"success" : function(data) {
// 							$(".result-context").html(data)
// 							$("#result").attr("class","active");
// 							$("#search1").removeAttr("class");
// 							$("#search").attr("class","tab-pane fade");
// 							$("#insert1").removeAttr("class");
// 							$("#insert").attr("class","tab-pane fade");
// 							$("#resolution").attr("class","tab-pane active");
						},
					});
				} else if ("修改權限" == $(this).val()) {
					var change = $("#change");
					$.ajax({
						"type" : change.attr("method"),
						"url" : change.attr("action"),
						"data" : change.serialize(),
						"success" : function(data) {
						},
					});
				}

			})
		})
	})
</script>
</body>
</html>