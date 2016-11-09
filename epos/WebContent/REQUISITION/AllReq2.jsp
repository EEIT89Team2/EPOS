<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>全部詢價單資料</title>
<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">

</head>
<style>
body {
	font-size: 16px;
}

/* 	th { */
/* 		padding: 20px 10px;  */
/*  		margin: 10px 2px;  */
/* 		line-height: 30px;  */
/* 		width:200px; */
/* 	} */

/*  	td {  */
/* 		padding: 20px 10px;  */
/*  		margin: 10px 2px;  */
/* 		line-height: 30px;  */
/*  		width:500px;  */
/*  	}  */
</style>
<body>
	<section id="container"> <section class="wrapper">
	<div class="row mt">
		<nav class="nav navbar-default">
		<div class="container-fluid"
			style="float: right; left: -50%; position: relative;">
			<ul class="nav navbar-nav"
				style="float: left; left: 50%; position: relative;">
				<li><a id="req1" target="addReq.jsp">新增請購單</a></li>
				<li style="background-color: rgba(221, 15, 15, 0.8);"><a
					style="color: white;">單筆查詢</a></li>
				<li><a id="req3" target="getAllReq.do">全部查詢</a></li>
				<li><a id="req4" target="SelectbyDate.jsp">依日期查詢</a></li>
				<li><a id="req5" target="selectOfN.do">審核</a></li>
			</ul>
		</div>
		</nav>
		<div
			style="background-color: rgba(0, 0, 0, 0.2); position: relativve; height: 750px; overflow: auto;">
			<div>
				<table class="table" style="text-align: center;">
					<c:forEach var="list" items="${list}" varStatus="count">

						<tr>
							<th>請購單編號</th>
							<td id="req_id">${list.req_id}</td>
						</tr>
						<tr>
							<th>修改人員</th>
							<td>${list.key_id}</td>
						</tr>
						<tr>
							<th>修改日期</th>
							<td>${list.key_date}</td>
						</tr>
						<tr>
							<th>狀態</th>
							<td>${list.status}</td>
						</tr>
						<tr>
							<td>#</td>
							<td>商品名稱</td>
							<td>商品數量</td>
						</tr>
						<c:forEach var="Reqdetail" items="${list.reqDetails }"
							varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${Reqdetail.prod_name }</td>
								<td>${Reqdetail.prod_quantity }</td>
							</tr>

						</c:forEach>
					</c:forEach>
				</table>
			</div>
		</div>
		<div style="position: absolute; bottom: 30px; right: 40%;">

			<input type="button" value="修改" id="alter"
				target="DetailDeleteReq.do" /> <input type="button"
				value="確認" id="confirm" target="getAllReq.do">
			<!-- 		<input type="button" value="註銷" id="writeoff"> -->
		</div>
	</div>
	</section></section>
	<script>
		$(function() {
			$('#alter').on('click', function() {
				var url = $(this).attr('target');
				var req_id = $('#req_id').text();
				$.ajax({
					type : "POST",
					url : url,
					data : {
						"req_id" : req_id,
						"action" : "update"
					},
					success : function(data) {
						$("#main-content").html(data);
					}
				})
			})

			$('#confirm').on('click', function() {
				var t1 = $(this).attr('target');
				$.ajax({
					type : "post",
					url : t1,
					success : function(data) {
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