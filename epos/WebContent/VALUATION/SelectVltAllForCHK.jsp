<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.valuation.model.*"%>

<%
	ValuationService vltSvc = new ValuationService();
	List<ValuationVO> list = vltSvc.getAllByN();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">
<!--external css-->
<link
	href="<c:url value="../resources/font-awesome/css/font-awesome.css" />"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value="../resources/lineicons/style.css" />">
<!-- Custom styles for this template -->
<link href="<c:url value="../resources/css/style.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/style-responsive.css" />"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<title>所有報價單資料</title>

<style type="text/css">
.table>thead:first-child>tr:first-child>td {
	background: #ffb400;
	font-size: 20px;
	font-family: 微軟正黑體;
	text-align: center;
	color: white;
	/* 		font-weight: bold; */
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: white;
}

.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td,
	.table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
	border: 1px solid #ffc334;
	background: #fff5cc;
}

/* 滑鼠移過 */
.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #ffd265;
}

.pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover,
	.pagination>.active>span:hover, .pagination>.active>a:focus,
	.pagination>.active>span:focus {
	background-color: #ffb400;
	border-color: #f5ae04;
}

#title {
	background: #fbd373;
	height: 35px;
	text-align: center;
	font-size: 20px;
	color: black;
	font-weight: bold;
}

td{
	text-align: center;
}

a{
	margin-left: 30px;
}
</style>
<title>所有報價單資料</title>

</head>
<body>

	<table id="CHK" class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<td>報價單編號</td>
				<td>報價日期</td>
				<td>交貨日期</td>
				<td>總金額</td>
				<td>狀態</td>
				<td>修改人員</td>
				<td>修改日期</td>
				<td>有效日期</td>
				<td>備註</td>
				<td>審核</td>
			</tr>
		</thead>

		<c:forEach var="list" items="${list}" varStatus="count">
			<form method="post" action="forVltCHK.do">
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
					<td><input type="submit" class="btn btn-danger" value="審核"></td>
					<input type="hidden" name="vlt_id" value="${list.vlt_id}">
					<input type="hidden" name="action" value="CHK">
				</tr>

			</form>
		</c:forEach>
	</table>
	<a href="../VALUATION/ValuationList.jsp"><i class="glyphicon glyphicon-th-list"></i>　報價單</a></br>
	<a href="javascript:" onclick="history.back(); "><i class="glyphicon glyphicon-arrow-left"></i>　回上頁</a>
</body>
</html>