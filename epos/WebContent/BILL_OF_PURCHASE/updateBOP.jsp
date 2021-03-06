<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List,java.util.Collections"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改請購單</title>

<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">

</head>
<style>


.my-error-class {
	color: #1dc489;
}

.my-valid-class {
	color: #3a51e8;
}
</style>
<body>
	<section id="container"> <section class="wrapper">
	<div class="row mt">

		<nav class="nav navbar-default">
		<div class="container-fluid"
			style="float: left;">
			<ul class="nav navbar-nav"
				style="float: left;">
				<li><a id="bop1" target="selectOfY.do">新增進貨單</a></li>
				<li style="background-color: rgba(221, 15, 15, 0.8);"><a
					style="color: white;">單筆查詢</a></li>
				<li><a id="bop3" target="getAllBop.do">全部查詢</a></li>
				<li><a id="bop4" target="SelectbyDate.jsp">依日期查詢</a></li>
				<li><a id="bop5" target="selectOfN.do">審核</a></li>
				<li><a id="bop6" target="selectOfY2.do">到貨確認</a></li>
				<li><a id="bop7" target="analyze.do">單月進貨金額</a>
			</ul>
		</div>
		</nav>
		<div
			style="background-color: rgba(66, 134, 244, 0.3); position: relativve; height: 750px; overflow: auto;">
			<!-- 	<br> -->
			<!-- 		<h1>詢價單</h1> -->
			<!-- 		<hr> -->
			<h1>進貨單修改</h1>
			<hr>
			<form method="post" action="REQUISITION/insertReq.do" id="form1">

				<table border="0" id="table1"
					class="table table-bordered table-striped table-hover">
					<tr>
						<td>&nbsp;&nbsp;送貨單號：<input type="text" name="bop_id"
							value="${bopVO.bop_id }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;採購單號：<input type="text" name="pur_id"
							value="${bopVO.pur_id }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;廠商編號：<input type="text" name="com_id"
							value="${bopVO.com_id }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;建檔人員：<input type="text" name="key_id"
							value="${sessionScope.LoginOK.emp_id }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;建檔日期：<input type="date" name="key_date"
							id="key_date" style="width: 199px;" value="${bopVO.key_date}" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;送貨日期：<input type="date" name="bop_date"
							id="bop_date" style="width: 199px;" value="${bopVO.bop_date}" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;金&nbsp;&nbsp;&nbsp;額&nbsp;&nbsp;：<input
							type="text" name="remark" value="${bopVO.remark }"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;狀&nbsp;&nbsp;&nbsp;態&nbsp;&nbsp;：<input
							type="text" id="status" name="status" value="${bopVO.status }"
							readonly="readonly" /><span style="font-size: 10px; color: gray">(N:未審核
								Y:已審核 D:註銷 S:成功)</span></td>
					</tr>
				</table>
				<hr>
				<!-- 			<hr> -->
				<table border=0
					class="table table-bordered table-striped table-hover"
					id="detailtable">
					<tr>
						<td>#</td>
						<td>商品編號</td>
						<td>商品名稱</td>
						<td>商品數量</td>
						<td>商品單價</td>
						<td>金額小計</td>

					</tr>
					<c:forEach var="detailVO" items="${detailList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><input type="text" name="prod_id${status.count }"
								value="${detailVO.prod_id }" readonly="readonly" /></td>
							<td><input type="text" name="prod_name${status.count }"
								value="${detailVO.prod_name }" readonly="readonly" /></td>
							<td><input type="text" name="prod_quantity${status.count }"
								value="${detailVO.prod_quantity }" readonly="readonly" /></td>
							<td><input type="text" name="prod_cost${status.count }"
								value="${detailVO.prod_price }" readonly="readonly" /></td>
							<td><input type="text" name="prod_lsum${status.count }"
								value="${detailVO.prod_lsum }" readonly="readonly" /></td>

						</tr>

					</c:forEach>

				</table>
				<div style="position: absolute; bottom: 30px; right: 40%;">

					<input type="button" id="alter" target="${bopVO.bop_id }"
						value="更新" /> <input type="button" id="writeoff"
						target="${bopVO.bop_id }" value="註銷" /><input type="button"
						id="return" target="${bopVO.bop_id }" value="返回" />
					<!-- 					<input type="hidden" name="action" value="insert"> -->

				</div>
			</form>
		</div>
		<script>
			$(function() {
				// 			if ($('#status').val() == 'Y') {
				// 				$('#alter').hide();
				// 			}
				// 			if ($('#status').val() == 'D') {
				// 				$('#alter').hide();
				// 			}
				$('#form1').validate({

					errorClass : "my-error-class",
					validClass : "my-valid-class",

					rules : {
						key_date : "required",
						bop_date : "required"
					},
					messages : {
						key_date : {required:"【請輸入建檔日期】"},
						bop_date : {required:"【請輸入送貨日期】"}
					}
				})

				$('#alter').on('click', function() {
					var $form = $('#form1');
					var url = "updateBOP.do";
					if ($form.valid()) {
						$.ajax({
							type : "POST",
							url : url,
							data : $('#form1').serialize(),
							success : function(data) {
								$("#main-content").html(data);
							}
						})
					}
				})

				$('#writeoff').on('click', function() {
					var bop_id = $(this).attr('target');
					var url = "setStatus2.do";
					$.ajax({
						type : "post",
						url : url,
						data : {
							"bop_id" : bop_id,
							"status" : "D"
						},
						success : function(data) {
							$('#main-content').html(data);
						}
					})
				})
				$('#return').on('click', function() {
					var bop_id = $(this).attr('target');
					var url = "getOneBop.do";
					$.ajax({
						type : "POST",
						url : url,
						data : {
							"bop_id" : bop_id
						},
						success : function(data) {
							$("#main-content").html(data);
						}
					})
				})
				$('#bop1').on('click', function() {
					var t1 = $(this).attr('target');
					$.post(t1, function(data) {
						$('#main-content').html(data);
					})
				})
				$('#bop3').on('click', function() {
					var t1 = $(this).attr('target');
					$.ajax({
						type : "post",
						url : t1,
						success : function(data) {
							$('#main-content').html(data);
						}
					})
				})
				$('#bop4').on('click', function() {
					var t1 = $(this).attr('target');
					$.post(t1, function(data) {
						$('#main-content').html(data);
					})
				})
				$('#bop5').on('click', function() {
					var t1 = $(this).attr('target');
					$.post(t1, function(data) {
						$('#main-content').html(data);
					})
				})
				$('#bop6').on('click', function() {
					var t1 = $(this).attr('target');
					$.post(t1, function(data) {
						$('#main-content').html(data);
					})
				})
				$('#bop7').on('click', function() {
						var t1 = $(this).attr('target');
						$.post(t1, function(data) {
							$('#main-content').html(data);
						})
					})

			})
			$("input[readonly]").css("background-color","lightgray");
// 			$("#table1").dataTable();
		</script>
</body>
</html>