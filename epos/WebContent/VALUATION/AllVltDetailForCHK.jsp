<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報價單明細資料</title>

</head>
<body>
	<Form>
		<table border="2">
			<tr>
				<th>報價單編號</th>
				<th>報價日期</th>
				<th>交貨日期</th>
				<th>總金額</th>
				<th>狀態</th>
				<th>修改人員</th>
				<th>修改日期</th>
				<th>有效日期</th>
				<th>備註</th>

			</tr>

			<c:forEach var="list" items="${list}" varStatus="count">

				<tr>
					<td>${list.vlt_id}</td>
					<td>${list.vlt_date}</td>
					<td>${list.delivery_date}</td>
					<td>${list.total_price}</td>
					<td>${list.status}</td>
					<td>${list.key_id}</td>
					<td>${list.key_date}</td>
					<td>${list.exp_date}</td>
					<td>${list.remark}</td>
					<!-- 			<td><input type="submit" name="action" value="Delete" ></td> -->
					<input type="hidden" name="vlt_id" value="${list.vlt_id}">

				</tr>


			</c:forEach>
		</table>



		<table border="2">
			<tr>
				<th>出貨單編號</th>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>商品數量</th>
				<th>商品價格</th>

			</tr>

			<c:forEach var="list" items="${detailList}" varStatus="count">

				<tr>
					<td>${list.valuationVO.vlt_id}</td>
					<td>${list.prodVO.prod_id}</td>
					<td>${list.prod_name}</td>
					<td>${list.prod_quantity}</td>
					<td>${list.prod_price}</td>
					<!-- 			<td><input type="submit" value="Delete" ></td> -->
					<input type="hidden" name="vlt_id"
						value="${list.valuationVO.vlt_id}">
					<input type="hidden" name="prod_id" value="${list.prodVO.prod_id}">
					<input type="hidden" name="action" value="DeleteDetail">

				</tr>

			</c:forEach>
		</table>

	</Form>
	<center>
	<table>
		<tr>
			<form method="post" action="VltToOrd.do">
				<td><input type="submit" value="轉訂單"></td>
				<td> <input type="hidden" name="vlt_id" value="${vltVO.vlt_id}"></td>
				<td> <input type="hidden" name="action" value="toOrd"></td>
			</form>

			<form method="post" action="setVltStatus.do">
				<td><input type="submit" name="action" value="註銷"></td>
				<td><input type="hidden" name="vlt_id" value="${vltVO.vlt_id}"></td>
			</form>
			
				<td><input type="button" name="action" value="返回" onclick="history.back();"></td>
				
		</tr>
		<!-- 	<a href="../index.jsp">回首頁</a> -->
		<!-- 	<a href="javascript:" onclick="history.back(); ">回上頁</a>  -->
	</table>
	</center>
</body>
</html>