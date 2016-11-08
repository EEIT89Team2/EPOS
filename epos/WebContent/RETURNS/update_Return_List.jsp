<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.returns.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<% 
	RtnListVO rtnListVO = (RtnListVO) request.getAttribute("RtnListVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退貨單資料修改</title>
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

<FORM METHOD="post" ACTION="update.do" name="form1">
<fieldset style='width:30%'>
	<legend>退貨單資料修改</legend>
<table border="0">
	<tr>
		<td>退貨單編號:</td>
		<td><input type="TEXT" name="ret_id" size="40" value="<%=rtnListVO.getRet_id()%>" /></td>
	</tr>
	<tr>
		<td>退貨日期:</td>
		<td><input type="date" name="ret_date" size="40" value="<%=rtnListVO.getRet_date()%>" /></td>
	</tr>
	<tr>
		<td>廠商編號:</td>
		<td><input type="TEXT" name="com_id" size="40" value="<%=rtnListVO.getCom_id()%>" /></td>
	</tr>
	<tr>
		<td>廠商名稱:</td>
		<td><input type="TEXT" name="com_name" size="40" value="<%=rtnListVO.getCom_name()%>" /></td>
	</tr>
	<tr>
		<td>修改人員:</td>
		<td><input type="TEXT" name="key_id" size="40" value="<%=rtnListVO.getKey_id()%>" /></td>
	</tr>
	<tr>
		<td>修改日期:</td>
		<td><input type="Date" name="key_date" size="40" value="<%=rtnListVO.getKey_id()%>" /></td>
	</tr>
	<tr>
		<td>備註:</td>
		<td><input type="TEXT" name="remark" size="40" value="<%=rtnListVO.getRemark()%>" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="status" size="40" value="<%=rtnListVO.getStatus()%>" /></td>
	</tr>
</table>
</fieldset>
<br>
<input type="hidden" name="action" value="update">
<%-- <input type="hidden" name="ret_id" value="<%=rtnListVO.getRet_id()%>"> --%>
<input type="submit" value="送出修改"></FORM>

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>