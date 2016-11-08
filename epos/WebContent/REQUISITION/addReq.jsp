<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增請購單</title>
<link href="<c:url value="../resources/css/bootstrap.css" />" rel="stylesheet">

</head>
<style type="text/css">
body {
	font-size: 16px;
}

table {
	margin: 10px 2px;
	line-height: 20px;
}

input {
	margin: 5px;
	text-align: left;
	/* 		background-color:rgba(234,225,225,1); */
}

.dbt {
	height: 24px;
	color: white;
	background-color: rgba(221, 15, 15, 0.8);
	border: 0px;
}

.detailtable td {
	padding: 2px 10px;
}
</style>
<body>

	<section id="container"> <section class="wrapper">
	<%-- 錯誤表列 --%> <%-- <c:if test="${not empty param.message}"> --%> <!-- 	<font color='red'>請修正以下錯誤: -->
	<!-- 	<ul> --> <%-- 		<c:forEach var="message" items="${param.message}"> --%>
	<%-- 			<li>${message}</li> --%> <%-- 		</c:forEach> --%> <!-- 	</ul> -->
	<!-- 	</font> --> <%-- </c:if> --%> 
	<nav class="nav navbar-default">
	<div class="container-fluid"
		style="float: right; left: -50%; position: relative;">
		<ul class="nav navbar-nav"
			style="float: left; left: 50%; position: relative;">
			<li style="background-color: rgba(221, 15, 15, 0.8);"><a
				style="color: white;">新增請購單</a></li>
			<li><a id="req2" target="SelectReq.jsp">單筆查詢</a></li>
			<li><a id="req3" target="getAllReq.do">全部查詢</a></li>
			<li><a id="req4" target="SelectbyDate.jsp">依日期查詢</a></li>
			<li><a id="req5" target="selectOfN.do">審核</a></li>
		</ul>
	</div>
	</nav>
	
	<div
		style="background-color: rgba(0, 0, 0, 0.2); position: relativve; height: 750px; overflow: auto;">
		<!-- 	<br> -->
		<h1>新增請購單</h1>
		<hr>

		<form method="post" action="insertReq.do" id="form1">

			<table border="0">
				<tr>
					<td>&nbsp;&nbsp;請購單號：<input type="text" name="req_id"
						value="系統產生" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;建檔人員：<input type="text" name="key_id"
						value="E00001"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;建檔日期：<input type="date" name="key_date"
						id="theDate" style="width: 200px;"></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;狀&nbsp;&nbsp;&nbsp;態&nbsp;&nbsp;：<input
						type="text" name="status" value="N" readonly="readonly" /><span
						style="font-size: 10px; color: gray">(N:未審核 Y:已審核 D:註銷)</span></td>
				</tr>
			</table>
			<hr>
			<!-- 			<hr> -->
			<table border=0 class="detailtable" id="detailtable">

			</table>
			<div style="position: absolute; bottom: 30px; right: 40%;">

				<input type="button" value="新增明細" id="addNewDetail"> <input
					type="button" id="sbt" value="提交" /> <input type="hidden"
					name="action" value="insert">

			</div>
		</form>
	</div>

	<script>
		$(function() {
					var a = 1;
					$("#addNewDetail")
							.click(
									function() {
										$("#detailtable")
												.append(
														"<tr><td>商品名稱：<input type='text' name='prod_name"+a+"'/ ></td>"
																+ "<td>商品數量：<input type='text' name='prod_quantity"+a+"'/></td>"
																+ "<td><input type='button' value='刪除' class='dbt'/></td></tr>")
										a = a + 1;
										$('.dbt').on('click', function() {
											$(this).parents('tr').remove();
										})
									})

					$('#sbt').on('click', function() {

						var url = "insertReq.do";
						$.ajax({
							type : "POST",
							url : url,
							data : $('#form1').serialize(),
							success : function(data) {
								$("#main-content").html(data);
							}
						})
					})
					$('#req2').on('click', function() {
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
	</script> <a href="../index.jsp">回首頁</a> <a href="javascript:" onclick="history.back(); ">回上頁</a>
</body>
</html>