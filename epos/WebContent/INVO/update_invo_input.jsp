<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.invo.model.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>發票作廢資料修改</title>
</head>
<body>
	<h3>修改發票作廢資料:</h3>
	<FORM METHOD="post" ACTION="updateInvo.do" name="form1">
		
		<table border="0">
			<tr>
				<td>發票編號:</td>
				<td>${invoVO.invoice_id}</td>
			</tr>
			<tr>
				<td>訂單編號:</td>
				<td><input type="TEXT" name="ord_id" size="45"
					value="${invoVO.ord_id}" /></td>
			</tr>
			<tr>
				<td>新發票編號:</td>
				<td><input type="TEXT" name="new_invoice_number" size="45"
					value="${invoVO.new_invoice_number}" /></td>
			</tr>
			<tr>
				<td>新訂單編號:</td>
				<td><input type="TEXT" name="new_ord_id" size="45"
					value="${invoVO.new_ord_id}" /></td>
			</tr>

		</table>
		<br> 
<!-- 		<input type="hidden" name="action" value="update">  -->
		<input type="hidden" name="invoice_id" value="${invoVO.invoice_id}">
		<input type="submit" value="送出修改">
	</FORM>
	<jsp:include page="/COMMON/footer_invo.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>