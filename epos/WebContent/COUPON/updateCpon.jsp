<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.coupon.model.*"%>
<%
CouponVO copVO = (CouponVO) request.getAttribute("copVO"); //若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改折價券資料</title>
</head>
<body>
<h3>折價券資料:</h3>
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
 
<FORM METHOD="post" ACTION="updateCpon.do" name="form2">
<table border="0">

	<tr>
		<td>折價券編號:</td>
		<td><input type="text" name="cpon_id" size="20"  value="${copVO.cpon_id}" 
		readonly="readonly" style="color: gray"/></td>
	</tr>
	<tr>
		<td>折價券名稱:</td>
		<td><input type="text" name="cpon_name" size="20" value="${copVO.cpon_name}" /></td>
	</tr>
	<tr>
		<td>發行日期:</td>
		<td><input type="date" name="release_date" size="20" value="${copVO.release_date}" /></td>
	</tr>
	<tr>
		<td>使用期限:</td>
		<td><input type="date" name="cpon_period" size="20" value="${copVO.cpon_period}" /></td>
	</tr>
	<tr>
		<td>面額:</td>
		<td><input type="text" name="cpon_dollar" size="20" value="${copVO.cpon_dollar}" /></td>
	</tr>
	<tr>
		<td>狀態:</td>
		<td>已出貨<input type="radio" name="status"  value="Y" ${copVO.status=="Y"?'checked':''}/>
			庫存<input type="radio" name="status"  value="N" ${copVO.status=="N"?'checked':''}/></td>
	</tr>

</table>

<br>
<!-- <input type="hidden" name="action" value="update"> -->
<input type="submit" value="送出修改"></FORM>
<jsp:include page="/COMMON/footer_cpon.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>