<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.invo.model.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有發票作廢資料</title>
</head>
<body>
<!-- 	<a href="select_page.jsp">回首頁</a> -->
	<table border='1' bordercolor='#CCCCFF' width='600'>
		<tr>
			<th>發票編號</th>
			<th>訂單編號</th>
			<th>新發票號碼</th>
			<th>新訂單編號</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<c:forEach var="invoVO" items="${list}">
			<tr align='center' valign='middle'>
				<td>${invoVO.invoice_id}</td>
				<td>${invoVO.ord_id}</td>
				<td>${invoVO.new_invoice_number}</td>
				<td>${invoVO.new_ord_id}</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/INVO/allForUpdate.do">
						<input type="submit" value="修改"> <input type="hidden"
							name="invoice_id" value="${invoVO.invoice_id}"> 
<!-- 							<input type="hidden" name="action" value="getOne_For_Update"> -->
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/INVO/deleteInvo.do">
						<input type="submit" value="刪除"> <input type="hidden"
							name="invoice_id" value="${invoVO.invoice_id}"> 
<!-- 							<input type="hidden" name="action" value="delete"> -->
					</FORM>
				</td>
			</tr>
		</c:forEach>

	</table>

<jsp:include page="/COMMON/footer_invo.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>

