<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coupon.model.*"%>
<%
	List<CouponVO> list =(List<CouponVO>) request.getAttribute("list");	//除了錯誤訊息是用VO或List送來外,其餘的查詢結果都是用List送來
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折價券清單</title>
</head>
<body>
<center>
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
			<th>折價券編號</th>
			<th>折價券名稱</th>
			<th>發行日期</th>
			<th>使用期限</th>
			<th>面額</th>
			<th>狀態</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
	
		<c:forEach var="copVO" items="${list}">
<!-- 		<form method="post" action="updateAll.do"> -->
			<tr align='center' valign='middle'>
				<td>${copVO.cpon_id}</td>
				<td>${copVO.cpon_name}</td>
				<td>${copVO.release_date}</td>
				<td>${copVO.cpon_period}</td>
				<td>${copVO.cpon_dollar}</td>
				<td>${copVO.status}</td>
				<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/COUPON/allForUpdateCpon.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="cpon_id" value="${copVO.cpon_id}"> 
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/COUPON/deleteCpon.do">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="cpon_id" value="${copVO.cpon_id}"> 
<!-- 						<input type="hidden" name="action" value="delete"> -->
					</FORM>
				</td>
			</tr>
<!-- 			</form> -->
		</c:forEach>
	</table>
	</center>
<jsp:include page="/COMMON/footer_cpon.jsp" />
	<p />
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>