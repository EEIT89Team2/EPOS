<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.returns.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<%-- 
	RtnDetailVO rtnDetailVO = (RtnDetailVO) request.getAttribute("list");
	
--%>

<%-- <jsp:useBean id="rtnItemsSvc" scope="page" class="com.returns.model.ReturnItemsService" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�h�f����ӭק�</title>
</head>
<body>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="update_dtl.do" name="form1">
<fieldset style='width:50%'>
	<legend>�h�f�~��ƭק�</legend>
<table border="0">
	<tr>
		<td>�h�f��s��:</td>
		<td><input type="TEXT" name="ret_id" size="40" value="${list.rtnListVO.ret_id}" /></td>
	</tr>
	<tr>
		<td>���~�W��:</td>
		<td><input type="TEXT" name="prod_name" size="40" value="${list.rtnItemsVO.prod_name}" /></td>
	</tr>
	<tr>
		<td>�h�f��]:</td>
		<td><input type="TEXT" name="ret_reason" size="40" value="${list.ret_reason}" /></td>
	</tr>
	<tr>
		<td>�h�f�ƶq:</td>
		<td><input type="TEXT" name="prod_quantity" size="40" value="${list.prod_quantity}" /></td>
	</tr>
</table>
</fieldset>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="ret_id" value="${list.rtnListVO.ret_id}">
<input type="submit" value="�e�X�ק�"></FORM>

	<a href="../index.jsp">�^����</a>
	<a href="javascript:" onclick="history.back(); ">�^�W��</a> 

</body>
</html>