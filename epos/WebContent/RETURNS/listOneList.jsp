<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.returns.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<RtnListVO> list = (List<RtnListVO>)request.getAttribute("list");
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨單</title>
</head>
<body>
<table border='1' bordercolor='#C4E1FF'>
<tr><th bgcolor='#C4E1FF' colspan='13'>退貨品</th></tr>
<tr>
	<td align='center'>退貨單編號</td><td align='center'>退貨日期</td><td align='center'>廠商編號</td><td align='center'>廠商名稱</td><td align='center'>修改人員</td><td align='center'>修改日期</td><td align='center'>備註</td><td align='center'>狀態</td><td align='center'>查詢明細</td><td align='center'>修改</td><td align='center'>刪除</td>
</tr>
		<c:forEach var="list" items="${list}">
		<tr align='center' valign='middle'>
			<td>${list.ret_id}</td>
			<td>${list.ret_date}</td>
			<td>${list.com_id}</td>
			<td>${list.com_name}</td>
			<td>${list.key_id}</td>
			<td>${list.key_date}</td>
			<td>${list.remark}</td>
			<td>${list.status}</td>
		<td>
			  <FORM METHOD="post" ACTION="getDetail.do">
			     <input type="submit" value="查詢">
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getDetail">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="delete.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="ret_id" value="${list.ret_id}">
			    <input type="hidden" name="action"value="delete">
			  </FORM>
		</td>
		</tr>
		</c:forEach>
</table>

<ul>
 	<li><a href="../index.jsp">回首頁</a></li>
	<li><a href="javascript:" onclick="history.back(); ">回上頁</a> </li>
</ul>

</body>
</html>