<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.valuation.model.*"%>

<%
	ValuationService vltSvc = new ValuationService();
	List<ValuationVO> list = vltSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有報價單資料</title>

</head>
<body>

	<table border="2">
		<tr>
			<th>報價單編號</th>
			<th>報價日期</th>
			<th>交貨日期</th>
			<th>總金額</th>
			<th>狀態</th>
			<th>修改人員</th>
			<th>修改日期</th>
			<th>有效日期</th>
			<th>備註</th>
			<th>明細</th>
<!-- 			<th>刪除</th> -->
		</tr>

		<c:forEach var="list" items="${list}" varStatus="count">
			<form method="post" action="Querydetail_DeleteVlt.do">
				<tr>
					<td>${list.vlt_id}</td>
					<td>${list.vlt_date}</td>
					<td>${list.delivery_date}</td>
					<td>${list.total_price}</td>
					<td>${list.status}</td>
					<td>${list.key_id}</td>
					<td>${list.key_date}</td>
					<td>${list.exp_date}</td>
					<td>${list.remark}</td>
					<td><input type="submit" name="action" value="Detail"></td>
<!-- 					<td><input type="submit" name="action" value="Delete"></td> -->
					<input type="hidden" name="vlt_id" value="${list.vlt_id}">

				</tr>

			</form>
		</c:forEach>
	</table>

<!-- <input type="button" name="action" value="返回" onclick="history.back();"> -->

</body>
</html>