<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.order.model.*"%>

<%
 	OrderService ordSvc = new OrderService();
 	List<OrderVO> list = ordSvc.getAll();
 	pageContext.setAttribute("list",list);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有訂單資料</title>

</head>
<body>
<section id="container"> <section class="wrapper">
	<div class="row mt">
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
			<th>Detail</th>
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
			<td><input type="submit" name="action" value="Detail" ></td>
<!-- 			<td><input type="submit" name="action" value="Delete" ></td> -->
			<input type="hidden" name="ord_id" value="${list.ord_id}">
			
		</tr>		
</form>
</c:forEach>
	</table>
	
<!-- 	<a href="../index.jsp">回首頁</a> -->
<!-- 	<a href="javascript:" onclick="history.back(); ">回上頁</a>  -->
</div>

	</section> </section>
</body>
</html>