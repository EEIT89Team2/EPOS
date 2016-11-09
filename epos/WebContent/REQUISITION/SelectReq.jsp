<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢請購單</title>

<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">

</head>
<style>
body {
	font-size: 16px;
}
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

			<div align=center>
				<br> <br> <br>
				<h3>請輸入請購單編號</h3>

				<form method="post" id="form1" action="getByReq_id.do">
					<table border="1">
						<tr>
							<td><input type="text" name="req_id"></td>
							<td><input type="button" id="sbt" value="查詢"></td>
						</tr>
					</table>
					<input type="hidden" name="action" value="getByReq_id">
				</form>
			</div>
		</div>
	</div>
	</section></section>
	<script>
		$(function() {
			$('#sbt').on('click', function() {

				var url = "getByReq_id.do";

				$.ajax({
					type : "POST",
					url : url,
					data : $('#form1').serialize(),
					success : function(data) {
						$("#main-content").html(data);
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