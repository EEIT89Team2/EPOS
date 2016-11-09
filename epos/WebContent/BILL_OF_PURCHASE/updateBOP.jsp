<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改進貨單</title>
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

<h1>進貨單</h1>

<form method="post" action="updateBOP.do" id="form1">

<table border="0">
	<tr>
		<td>進貨單編號 <input type="text" name="bop_id" value="${bopVO.bop_id}" readonly="readonly" /></td></tr>
		<tr><td>採購單編號<input type="text" name="pur_id" value="${bopVO.pur_id}"></td></tr>
		<tr><td>進貨日期<input type="date" name="bop_date" value="${bopVO.bop_date}"></td></tr>
		<tr><td>廠商名稱<input type="text" name="com_id" value="${bopVO.com_id}"></td></tr>
		<tr><td>修改人員<input type="text" name="key_id1" value="${bopVO.key_id}"></td></tr>
		<tr><td>修改日期<input type="date" name="key_date1" value="${bopVO.key_date}"></td></tr>
		<tr><td>備註<input type="text" name="remark" value="${bopVO.remark}"></td></tr>
		<tr><td>狀態<input type="text" name="status" value="${bopVO.status}"></td></tr>
</table>
<hr><hr>
<input type="submit" value="修改"/>
<!-- <input type="hidden" name="action" value="insert"> -->

</form>

<!-- <script src="../js/jquery-3.1.1.min.js"></script> -->

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>