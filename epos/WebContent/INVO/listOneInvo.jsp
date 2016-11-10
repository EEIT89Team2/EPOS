<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.invo.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>發票作廢資料</title>
</head>
<body bgcolor='white'>
<!-- 	<a href="select_page.jsp">回首頁</a> -->
	<table border='5' bordercolor='#CCCCFF' width='600'>
		<tr>
			<th>發票編號</th>
			<th>訂單編號</th>
			<th>新發票編號</th>
			<th>新`訂單編號</th>
		</tr>

		<tr align='center' valign='middle'>
			<td>${invoVO.invoice_id}</td>
			<td>${invoVO.ord_id}</td>
			<td>${invoVO.new_invoice_number}</td>
			<td>${invoVO.new_ord_id}</td>
		</tr>

	</table>
	<jsp:include page="/COMMON/footer_invo.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>
