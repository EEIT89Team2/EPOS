<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.quotation.model.*"%>
<%@ page import="java.util.*"%>
<%--<%
QuoService quoSrv = new QuoService(); 
 List<QuoVO> list = quoSrv.getAll(); 
pageContext.setAttribute("list",list);
  %>  --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>全部詢價單資料</title>

</head>
<body>
		<table border="2">
		<tr>
			<th>詢價單編號 </th>
			<th>請購單編號</th>
			<th>備註</th>
			<th>狀態</th>
			<th>明細</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		
<c:forEach var="list" items="${list}" varStatus="count">
		<form method="post" action="DetailDeleteQuo.do">
		<tr>
			<td>${list.quo_id}</td>
			<td>${list.req_id}</td>
			<td>${list.remark}</td>
			<td>${list.status}</td>
			<td><input type="submit" name="action" value="Detail" ></td>
			<td><input type="submit" name="action" value="update" ></td>
			<td><input type="submit" name="action" value="delete" ></td>
			<input type="hidden" name="quo_id" value="${list.quo_id}">
			
		</tr>
		
</form>
</c:forEach>
	</table>
	
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>