<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*"%>
<%@ page import="com.promoting.model.*"%>
<%
	List<PromotingVO> list = (List<PromotingVO>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>促銷商品清單</title>
</head>
<body>
<center>
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
 
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>促銷品號</th>
		<th>促銷品名</th>
		<th>活動起始日</th>
		<th>活動截止日</th>
		<th>備註</th>
		<th>修改</th>
		<th>查詢</th>
	</tr>
	
	<c:forEach var="PromVO" items="${list}">	
		<tr align='center' valign='middle'>
			<td>${PromVO.pro_prod_id}</td>
			<td>${PromVO.pro_prod_name}</td>
			<td>${PromVO.pro_begin}</td>
			<td>${PromVO.pro_end}</td>
			<td>${PromVO.pro_neirong}</td>

        		<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/PROMOTING/allForUpdateProm.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="pro_prod_id" value="${PromVO.pro_prod_id}"> 
						<input type="hidden" name="pro_begin" value="${PromVO.pro_begin}"> 
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/PROMOTING/deleteProm.do">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="pro_prod_id" value="${PromVO.pro_prod_id}"> 
						<input type="hidden" name="pro_begin" value="${PromVO.pro_begin}"> 
<!-- 						<input type="hidden" name="action" value="delete"> -->
					</FORM>
				</td>
	 	</tr>
	 </c:forEach>
</table>
</center>
<jsp:include page="/COMMON/footer_prom.jsp" />

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>