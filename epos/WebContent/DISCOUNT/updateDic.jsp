<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.discount.model.*"%>

<%
	DiscountVO discVO = (DiscountVO) request.getAttribute("discVO");	//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折扣管理</title>
</head>
<body>
<center>
<h3>折扣資料:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
 
<FORM METHOD="post" ACTION="updateDisc.do" name="form2">
<table border="0">

	<tr>
		<td>折扣身分:</td>
		<td><input type="text" name="dis_id" size="10"
		value="${discVO.dis_id}" readonly="readonly" 
		style="color: gray"/></td>
		
	</tr>
	<tr>
		<td>折扣%數:</td>
		<td><input type="text" name="dis_price" size="10" value="${discVO.dis_price}" /></td>
	</tr>

</table>

<br>
<!-- 	<input type="hidden" name="action" value="update"> -->
	<input type="submit" value="送出修改"></FORM>
</center>
<jsp:include page="/COMMON/footer_disc.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>