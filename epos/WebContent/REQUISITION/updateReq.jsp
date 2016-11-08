<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改請購單</title>
<link href="<c:url value="../resources/css/bootstrap.css" />" rel="stylesheet">
	<script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	!window.jQuery
			&& document
					.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
</script>
</head>
<style>
body {
	font-size: 16px;
}
</style>
<body>
	<section id="container"> <section class="wrapper">
	<nav class="nav navbar-default">
	<div class="container-fluid"
		style="float: right; left: -50%; position: relative;">
		<ul class="nav navbar-nav"
			style="float: left; left: 50%; position: relative;">
			<li><a id="req1" target="addReq.jsp">新增請購單</a></li>
			<li style="background-color: rgba(221, 15, 15, 0.8);"><a
				data-toggle="tab" style="color: white;">單筆查詢</a></li>
			<li><a id="req3" target="getAllReq.do">全部查詢</a></li>
			<li><a id="req4" target="SelectbyDate.jsp">依日期查詢</a></li>
			<li><a id="req5" target="selectOfN.do">審核</a></li>
		</ul>
	</div>
	</nav>
	<div
		style="background-color: rgba(0, 0, 0, 0.2); position: relativve; height: 750px; overflow: auto;">
		<!-- 	<br> -->
		<h1>修改請購單</h1>
		<hr>

		<form method="post" action="REQUISITION/insertReq.do" id="form1">

			<table border="0">
				<tr>
					<td>&nbsp;&nbsp;請購單號：<input type="text" name="req_id"
						id="req_id" value="${reqVO.req_id}" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;建檔人員：<input type="text" name="key_id"
						value="${reqVO.key_id}" id="key_id"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;建檔日期：<input type="date" name="key_date"
						value="${reqVO.key_date}" id="theDate" style="width: 174px;"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;狀&nbsp;&nbsp;&nbsp;態&nbsp;&nbsp;：<input
						type="text" id="status" name="status" value="${reqVO.status }"
						readonly="readonly" /><span style="font-size: 10px; color: gray">(N:未審核
							Y:已審核 D:註銷)</span></td>
				</tr>
			</table>
			<hr>
			<!-- 			<hr> -->
			<table border=0 class="table" id="detailtable">
				<tr>
					<td>#</td>
					<td>商品名稱</td>
					<td>商品數量</td>
				</tr>
				<c:forEach var="detailVO" items="${reqVO.reqDetails}"
					varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${detailVO.prod_name }</td>
						<td>${detailVO.prod_quantity }</td>
					</tr>

				</c:forEach>

			</table>
			<div style="position: absolute; bottom: 30px; right: 40%;">

				<input type="button" value="註銷" id="writeoff" target="REQUISITION/updateReq.do"> <input
					type="button" id="sbt" value="修改" /> <input type="button"
					id="confirm" value="確認" /> <input type="hidden" name="action"
					value="insert">

			</div>
		</form>
	</div>
	<script>
		$(function() {
			if ($('#status').val() == 'Y') {
				$('#writeoff').hide();
				$('#sbt').hide();
				$('#key_id').attr('readonly','readonly');
				$('#theDate').attr('readonly','readonly');
			}
			if ($('#status').val() == 'D') {
				$('#writeoff').hide();
				$('#sbt').hide();
				$('#key_id').attr('readonly','readonly');
				$('#theDate').attr('readonly','readonly');
			}
			
			$('#writeoff').on('click',function(){
				var url = $(this).attr('target');
				var req_id = $('#req_id').val();
				$.ajax({
					type:"POST",
					url:url,
					data:{"req_id":req_id,"status":"D"},
					success:function(data){
						$("#main-content").html(data);
					}
				})
			})
			
			$('#confirm').on('click',function(){
				var url ="REQUISITION/getAllReq.do";
				$.ajax({
					type:"post",
					url:url,
					success:function(data){
						$('#main-content').html(data);
					}
				})
			})
			$('#req1').on('click', function() {
				var t1 = $(this).attr('target');
				$.get(t1, function(data) {
					$('#main-content').html(data);
				})
			})
			$('#req3').on('click', function() {
				var t1 = $(this).attr('target');
				$.ajax({
					type : "post",
					url : t1,
					success : function(data) {
						$('#main-content').html(data);
					}
				})
			})
			$('#req4').on('click', function() {
				var t1 = $(this).attr('target');
				$.get(t1, function(data) {
					$('#main-content').html(data);
				})
			})
			$('#req5').on('click', function() {
				var t1 = $(this).attr('target');
				$.post(t1, function(data) {
					$('#main-content').html(data);
				})
			})
			
			
		})
	</script>
</body>
</html>