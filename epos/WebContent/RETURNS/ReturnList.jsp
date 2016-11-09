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
<title>�h�f��</title>
</head>


<body>

<!-- -----------------------------------------------------------�d��----------------------------------------------------------- -->
<c:if test="${not empty errorMsgs}">
<font color='red'>�Эץ��H�U���~:
<ul>
	<c:forEach var="message" items="${errorMsgs}">
		<li>${message}</li>
	</c:forEach>
</ul>
</font>
</c:if>

 <fieldset>
	<legend>�d��</legend>
	<table>
	 <tr>
	 <form action="getOne.do" method="post">
	 	<td style="text-align:right;">�h�f��s��</td>
	 	<td style="text-align:left;">
	 		<input type='text' name='ret_id'/>
	 		<input type="submit" value="�d��">
	 		<input type="hidden" name="action" value="getOne">
	 	</td>
	 </form>
	 <form action="getDate.do" method="post">
	 	<td style="text-align:right;">�h�f���</td>
	 	<td style="text-align:left;">
	 		<input type="date" name="ret_date"/>
	 		<input type="submit" value="�d��">
	 		<input type="hidden" name="action" value="getDate">
	 	</td>
	 </form>
	 <form action="getComName.do" method="post">	 
	 	<td style="text-align:right;">�t�ӦW��</td>
	 	<td style="text-align:left;">
	 		<input type='text' name='com_name'/>
	 		<input type="submit" value="�d��">
	 		<input type="hidden" name="action" value="getComName">
	 	</td>
	 </form>
	</table>
 </fieldset>

<!-- -----------------------------------------------------------���----------------------------------------------------------- -->
<table border='1' bordercolor='#C4E1FF'>
<tr><th bgcolor='#C4E1FF' colspan='13'>�h�f��</th></tr>
<tr>
	<td align='center'>�h�f��s��</td><td align='center'>�h�f���</td><td align='center'>�t�ӽs��</td><td align='center'>�t�ӦW��</td><td align='center'>�ק�H��</td><td align='center'>�ק���</td><td align='center'>�Ƶ�</td><td align='center'>���A</td><td align='center'>�d�ߩ���</td><td align='center'>�ק�</td><td align='center'>�R��</td>
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
			     <input type="submit" value="�d��">
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getDetail">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="delete.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="ret_id" value="${list.ret_id}">
			    <input type="hidden" name="action"value="delete">
			  </FORM>
		</td>
		</tr>
</c:forEach>
</table>

<h3>�h�f�޲z</h3>
<ul>
  <li><a href='/RETURNS/addList.jsp'>�s�W�h�f��</a></li>
  <li><a href='Index5.jsp'>�^����</a></li>
</ul>

</body>
</html>