<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.returns.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<% 
	RtnItemsVO rtnItemsVO = (RtnItemsVO) request.getAttribute("RtnItemsVO");
%>

<%-- <jsp:useBean id="rtnItemsSvc" scope="page" class="com.returns.model.ReturnItemsService" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨品資料修改</title>
</head>
<body>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="update_Item.do" name="form1">
<fieldset style='width:50%'>
	<legend>退貨品資料修改</legend>
<table border="0">
	<tr>
		<td>產品名稱:</td>
		<td><input type="TEXT" name="prod_name" size="40" value="<%=rtnItemsVO.getProd_name()%>" /></td>
	</tr>
	<tr>
		<td>廠商代號:</td>
		<td><input type="TEXT" name="com_id" size="40" value="<%=rtnItemsVO.getCom_id()%>" /></td>
	</tr>
	<tr>
		<td>退貨數量:</td>
		<td><input type="TEXT" name="re_quantity" size="40" value="<%=rtnItemsVO.getRe_quantity()%>" /></td>
	</tr>
	<tr>
		<td>備註:</td>
		<td><input type="TEXT" name="remark" size="40" value="<%=rtnItemsVO.getProd_name()%>" /></td>
	</tr>
</table>
</fieldset>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="prod_name" value="<%=rtnItemsVO.getProd_name()%>">
<input type="submit" value="送出修改"></FORM>

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>