<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.promoting.model.*"%>
<%
	PromotingVO promVO = (PromotingVO) request.getAttribute("promVO");//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改促銷商品</title>
</head>
<body>
<center>
	<h3>促銷商品資料:</h3>
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
</center>
 
	<FORM METHOD="post" ACTION="updateProm.do" name="form2">
		<table border="0">

			<tr>
				<td>促銷商品編號:</td>
				<td><input type="text" name="pro_prod_id" size="20"
					value="${promVO.pro_prod_id}" readonly="readonly" style="color: gray"/></td>
			</tr>
			<tr>
				<td>促銷商品名稱:</td>
				<td><input type="text" name="pro_prod_name" size="20"
					value="${promVO.pro_prod_name}" /></td>
			</tr>

			<tr>
				<td>促銷商品起始日期:</td>
				<td><input type="date" name="pro_begin" size="20"
					value="${promVO.pro_begin}" readonly="readonly" style="color: gray"/></td>
			</tr>

			<tr>
				<td>促銷商品截止日:</td>
				<td><input type="date" name="pro_end" size="20"
					value="${promVO.pro_end}" /></td>
			</tr>
			<tr>
				<td>備註:</td>
				<td><input type="text" name="pro_neirong" size="20"
					value="${promVO.pro_neirong}" /></td>
			</tr>

		</table>

		<br> 
<!-- 	 <input type="hidden" name="action" value="update">  -->
	 <input	type="submit" value="送出修改">
	</FORM>
</center>	
	<jsp:include page="/COMMON/footer_prom.jsp" />
	
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
	
</body>
</html>