<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>
<%
	ReturnListService rtnListSvc = new ReturnListService();
    List<RtnListVO> list = rtnListSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨單</title>
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

 <fieldset>
	<legend>查詢</legend>
	<table>
	 <tr>
	 <form action="getOne.do" method="post">
	 	<td style="text-align:right;">退貨單編號</td>
	 	<td style="text-align:left;">
	 		<input type='text' name='ret_id'/>
	 		<input type="submit" value="查詢">
	 		<input type="hidden" name="action" value="getOne">
	 	</td>
	 </form>
	 <form action="getDate.do" method="post">
	 	<td style="text-align:right;">退貨日期</td>
	 	<td style="text-align:left;">
	 		<input type="date" name="ret_date"/>
	 		<input type="submit" value="查詢">
	 		<input type="hidden" name="action" value="getDate">
	 	</td>
	 </form>
	 <form action="getComName.do" method="post">	 
	 	<td style="text-align:right;">廠商名稱</td>
	 	<td style="text-align:left;">
	 		<input type='text' name='com_name'/>
	 		<input type="submit" value="查詢">
	 		<input type="hidden" name="action" value="getComName">
	 	</td>
	 </form>
	</table>
 </fieldset>

<!-- -----------------------------------------------------------表格----------------------------------------------------------- -->
<table border='1' bordercolor='#C4E1FF'>
<tr><th bgcolor='#C4E1FF' colspan='13'>退貨單</th></tr>
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

<h3>退貨管理</h3>
<ul>
  <li><a href='/RETURNS/addList.jsp'>新增退貨單</a></li>
  <li><a href='Index5.jsp'>回首頁</a></li>
</ul>

</body>
</html>