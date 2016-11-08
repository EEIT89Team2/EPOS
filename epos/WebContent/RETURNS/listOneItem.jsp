<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.returns.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<RtnItemsVO> list = (List<RtnItemsVO>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨品</title>
</head>
<body>
<table border='1' bordercolor='#CCCCFF' width='800'>
<tr><th bgcolor='#CCCCFF' colspan='13'>退貨品</th></tr>
<tr>
	<td align='center'>商品名稱</td><td align='center'>廠商代號</td><td align='center'>退貨數量</td><td td align='center'>備註</td><td align='center'>修改</td><td align='center'>刪除</td>
</tr>
		<c:forEach var="RtnItemsVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${RtnItemsVO.prod_name}</td>
			<td>${RtnItemsVO.com_id}</td>
			<td>${RtnItemsVO.re_quantity}</td>
			<td>${RtnItemsVO.remark}</td>
		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update_Item.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="delete_Item.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}">
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