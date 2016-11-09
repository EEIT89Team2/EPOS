<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品銷售統計</title>

</head>
<body>

		<table border="2">
		<tr>
			<th>商品編號 </th>
			<th>商品名稱</th>
			<th>銷售數量</th>
		</tr>
		<tr>
			<td>${result.prod_id}</td>
			<td>${result.prod_name}</td>
			<td>${result.quantity}</td>
			
		</tr>
	</table>
	
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>