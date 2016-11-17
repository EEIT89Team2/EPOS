<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>訂單明細資料</title>

</head>
<body>

		<table border="2">
		<tr>
			<th>訂單編號 </th>
			<th>訂單日期</th>
			<th>發票號碼</th>
			<th>統一編號</th>
			<th>身分</th>
			<th>實際金額</th>
			<th>折價券金額</th>
			<th>應付金額(現金)</th>
			<th>修改人員編號</th>
			<th>建檔日期</th>
			<th>班別</th>
			<th>備註</th>
			<th>狀態</th>
<!-- 			<th>Delete</th> -->
		</tr>
		
<c:forEach var="list" items="${list}" varStatus="count">
		<form method="post" action="Querydetail_DeleteOrd.do">
		<tr>
			<td>${list.ord_id}</td>
			<td>${list.ord_date}</td>
			<td>${list.invoice_id}</td>
			<td>${list.ord_um}</td>
			<td>${list.discount}</td>
			<td>${list.total_price}</td>
			<td>${list.cpon_dollar}</td>
			<td>${list.cash}</td>
			<td>${list.key_id}</td>
			<td>${list.key_date}</td>
			<td>${list.shift}</td>
			<td>${list.remark}</td>
			<td>${list.status}</td>
<!-- 			<td><input type="submit" name="action" value="Delete" ></td> -->
			<input type="hidden" name="ord_id" value="${list.ord_id}">
			
		</tr>
		
</form>
</c:forEach>
	</table>

<body>

		<table border="2">
		<tr>
			<th>訂單編號 </th>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>商品數量</th>
			<th>商品價格</th>
<!-- 			<th>刪除明細</th> -->
		</tr>
		
<c:forEach var="list" items="${detailList}" varStatus="count">
		<form method="post" action="DeleteOrdDetail.do">
		<tr>
			<td>${list.orderVO.ord_id}</td>
			<td>${list.prodVO.prod_id}</td>
			<td>${list.prod_name}</td>
			<td>${list.prod_quantity}</td>
			<td>${list.prod_price}</td>
<!-- 			<td><input type="submit" value="Delete" ></td> -->
			<input type="hidden" name="ord_id" value="${list.orderVO.ord_id}">
			<input type="hidden" name="prod_id" value="${list.prodVO.prod_id}">
			<input type="hidden" name="action" value="DeleteDetail">
			
		</tr>
		
</form>
</c:forEach>
	</table>
		<div>
			<form method="post" action="../ORDER/OrdToShip.do">
			  
				<input type="submit" value="轉出貨">
				<input type="hidden" name="ord_id" value="${ordVO.ord_id}">
				<input type="hidden" name="action" value="toShip">
			  
			</form>
				<input type="button" name="action" value="返回" onclick="history.back();">
		</div>	

</body>
</html>