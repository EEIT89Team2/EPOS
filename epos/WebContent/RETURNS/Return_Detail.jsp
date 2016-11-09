<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>
<%
	ReturnDetailService rtnDtlSvc = new ReturnDetailService();
    List<RtnDetailVO> list = rtnDtlSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨單明細</title>
</head>

<body>
<!-- -----------------------------------------------------------查詢----------------------------------------------------------- -->
<c:if test="${not empty errorMsgs}">
<font color='red'>請修正以下錯誤:
<ul>
	<c:forEach var="message" items="${errorMsgs}">
		<li>${message}</li>
	</c:forEach>
</ul>
</font>
</c:if>

  <fieldset style='width:800px'>
	<legend>查詢</legend>
	<table>
	 <tr>
	 <form action="getId.do" method="post">
	 	<td style="text-align:right;">退貨單編號</td>
	 	<td style="text-align:left;">
	 		<input type='text' name='ret_id'/>
	 		<input type="submit" value="查詢">
	 		<input type="hidden" name="action" value="getId">
	 	</td>
	 </form>
	 <form action="getName.do" method="post">
	 	<td style="text-align:right;">產品名稱</td>
	 	<td style="text-align:left;">
	 		<input type='text' name='prod_name'/>
	 		<input type="submit" value="查詢">
	 		<input type="hidden" name="action" value="getName">
	 	</td>
	 	</form>
	 </tr>
	</table>
  </fieldset>


<!-- -----------------------------------------------------------表格----------------------------------------------------------- -->
<table border='1' bordercolor='#FF95CA' width='800px'>
<tr><th bgcolor='#FF95CA' colspan='13'>退貨單明細</th></tr>
<tr>
	<td align='center'>退貨單編號</td><td align='center'>商品名稱</td><td align='center'>退貨原因</td><td align='center'>退貨數量</td><td align='center'>修改</td><td align='center'>刪除</td>
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
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"> -->
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

<h3>退貨管理</h3>
<ul>
<!--   <li><a href='addDetail.jsp'>新增退貨單明細</a></li> -->
 	<li><a href="../index.jsp">回首頁</a></li>
	<li><a href="javascript:" onclick="history.back(); ">回上頁</a> </li>
</ul>

</body>
</html>