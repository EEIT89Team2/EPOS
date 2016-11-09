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
<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">
<!--external css-->
<link
	href="<c:url value="../resources/font-awesome/css/font-awesome.css" />"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="../resources/lineicons/style.css" />">
<!-- Custom styles for this template -->
<link href="<c:url value="../resources/css/style.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/style-responsive.css" />"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<title>退貨品</title>
<style type="text/css">
	.item{
		background:#5bc0de; 
		font-size: 20px; 
		font-family: 微軟正黑體;
		text-align: center;
		color: white;
		font-weight: bold;
	}
	

</style>
</head>
<body>
<div class="item">退貨品</div>
<table border='1' bordercolor='#CCCCFF' width='800' class="table table-bordered table-striped table-hover">
<tr>
	<td align='center' >商品名稱</td><td align='center'>廠商代號</td><td align='center'>退貨數量</td><td td align='center'>備註</td><td align='center'>修改</td><td align='center'>刪除</td>
</tr>
		<c:forEach var="RtnItemsVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${RtnItemsVO.prod_name}</td>
			<td>${RtnItemsVO.com_id}</td>
			<td>${RtnItemsVO.re_quantity}</td>
			<td>${RtnItemsVO.remark}</td>
		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update_Item.do">
			     <button type="submit" class="btn btn-success"><i class="fa fa-pencil"></i></button>
			     <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="delete_Item.do">
			  	<button type="submit" class="btn btn-danger"><i class="fa fa-trash-o "></i></button>
			    <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}">
			    <input type="hidden" name="action"value="delete">
			  </FORM>
		</td>
		</tr>
		</c:forEach>
</table>

<ul>

	<li><a href="javascript:" onclick="history.back(); ">回上頁</a> </li>
</ul>




</body>
</html>