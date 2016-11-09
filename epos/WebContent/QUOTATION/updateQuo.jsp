<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改詢價單</title>
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

<h1>詢價單</h1>

<!-- <hr> -->
<%-- <form:form action="test.do" method="POST" modelAttribute="quoVO"> --%>
<!-- <table border="0"> -->
<!-- 	<tr> -->
<!-- 		<td>詢價單編號 <input type="text" name="quo_id" value="由資料庫產生" readonly="readonly" /></td></tr> -->
<%-- 		<tr><td>請購單編號<form:input type="text" name="req_id" path="req_id" value="R2016092900005"/></td></tr> --%>
<%-- 		<tr><td>備註<form:input type="text" name="remark" path="remark" value="test"/></td></tr> --%>
<%-- 		<tr><td>狀態<form:input type="text" name="status" path="status" value="Y"/></td></tr> --%>
<!-- </table> -->
<!-- <input type="submit" value="OK"> -->
<%-- </form:form> --%>
<!-- <hr> -->



<form method="post" action="updateQuo.do" id="form1">

<table border="0">
	<tr>
		<td>詢價單編號 <input type="text" name="quo_id" value="${quoVO.quo_id}" readonly="readonly" /></td></tr>
		<tr><td>請購單編號<input type="text" name="req_id" value="${quoVO.req_id}"></td></tr>
		<tr><td>備註<input type="text" name="remark" value="${quoVO.remark}"></td></tr>
		<tr><td>狀態<input type="text" name="status" value="${quoVO.status}"></td></tr>
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