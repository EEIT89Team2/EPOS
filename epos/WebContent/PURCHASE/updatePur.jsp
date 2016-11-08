<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改採購單</title>
</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty param.message}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${param.message}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<h1>採購單</h1>

<form method="post" action="updatePur.do" id="form1">

<table border="0">
		
		<tr><td>採購單編號 <input type="text" name="pur_id" value="${purVO.pur_id}" readonly="readonly" /></td></tr>
		<tr><td>詢價單編號<input type="text" name="quo_id" value="${purVO.quo_id}"></td></tr>
		<tr><td>採購日期<input type="date" name="pur_date" value="${purVO.pur_date}"></td></tr>
		<tr><td>送貨日期<input type="date" name="delivery_date" value="${purVO.delivery_date}"></td></tr>
		<tr><td>廠商編號<input type="text" name="com_id" value="${purVO.com_id}"></td></tr>
		<tr><td>修改人員<input type="text" name="key_id" value="${purVO.key_id}"></td></tr>
		<tr><td>修改日期<input type="date" name="key_date" value="${purVO.key_date}"></td></tr>
		<tr><td>備註<input type="text" name="remark" value="${purVO.remark}"></td></tr>
		<tr><td>狀態<input type="text" name="status" value="${purVO.status}"></td></tr>
		
</table>
<hr><hr>
<input type="submit" value="修改"/>
<!-- <input type="hidden" name="action" value="insert"> -->

</form>

<!-- <script src="../js/jquery-3.1.1.min.js"></script> -->

	<a href="PURCHASE/SelectPur.jsp">查詢採購單</a><br>
	<a href="PURCHASE/addPur.jsp">新增採購單</a><br>

</body>
</html>