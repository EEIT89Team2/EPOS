<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	List<RtnDetailVO> list = (List<RtnDetailVO>)request.getAttribute("list");
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨單明細</title>
</head>
<body>
<table border='1' bordercolor='#FF359A'>
<tr><th bgcolor='#FF359A' colspan='13'>退貨品</th></tr>
<tr>
	<td align='center'>退貨單明細</td><td align='center'>商品名稱</td><td align='center'>退貨原因</td><td td align='center'>退貨數量</td><td align='center'>修改</td><td align='center'>刪除</td>
</tr>
<c:forEach var="list" items="${list}">
		<tr align='center' valign='middle'>
			<td>${list.rtnListVO.ret_id}</td>
			<td>${list.rtnItemsVO.prod_name}</td>
			<td>${list.ret_reason}</td>
			<td>${list.prod_quantity}</td>

		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update_dtl.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ret_id" value="${list.rtnListVO.ret_id}">
			     <input type="hidden" name="prod_name" value="${list.rtnItemsVO.prod_name}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="delete_dtl.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="ret_id" value="${list.rtnListVO.ret_id}">
			    <input type="hidden" name="prod_name" value="${list.rtnItemsVO.prod_name}">
			    <input type="hidden" name="action"value="delete">
			  </FORM>
		</td>
		</tr>
		
</c:forEach>
</table>

<ul>
  <li><a href='Return_Detail.jsp'>查詢退貨單明細</a></li>
</ul>

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>