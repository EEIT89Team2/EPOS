<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Select</title>
</head>
<body>


	<form action="Order.do" method="post">
		訂單日期(起):<input type="date" id="s_ord_date" name="s_ord_date" value="2016-09-14"/>~
		<input type="date" id="e_ord_date" name="e_ord_date" value="2016-10-02"/>(迄)
		<c:if test="${not empty errorMsg}">
		<c:forEach var="message" items="${errorMsg}">
		<font color="red">${message.s_ord_date}</font>
		</c:forEach>
		</c:if>
		
		
		<br>
		<input type="hidden" name="action_type" value="query">
		 <input	type="submit" value="查詢" />


	</form>	

	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>訂單日期</th>
			<th>訂單編號</th>
			<th>班別</th>
			<th>總金額</th>
			<th>結帳狀態</th>

		</tr>
		<c:forEach var="OrderVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${OrderVO.ord_date}</td>
			<td>${OrderVO.ord_id}</td>
			<td>${OrderVO.shift}</td>
			<td>${OrderVO.total_price}</td>
			<td>${OrderVO.status}</td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>