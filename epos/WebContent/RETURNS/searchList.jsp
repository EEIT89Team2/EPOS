<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap-theme.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	.divser{
		font-size: 20px;
		background: #ff7d7d;
		font-family: 微軟正黑體;
		font-weight:bold;
		text-align: center;
		color:white;
	}
	
	.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td{
		background-color:#fbbbbb;
	
	}

</style>

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
	<div class="divser">查詢</div>
	<div style="height: 20px"></div>
	 <form action="getOne.do" method="post" class="form-inline">
	 <div class="form-group">
	 	<label style="font-family: 微軟正黑體; font-size: 20px;" for="exampleInputName2">退貨單編號</label>
	 	<input style="width: 60%" type='text' name='ret_id' class="form-control"/>
	 	
	 </div>
	 	<input type="submit" value="查詢" class="btn btn-info">
	 	<input type="hidden" name="action" value="getOne">
	 </form>
	 <form action="getDate.do" method="post" class="form-inline">
	 <div class="form-group">
	 	<label style="font-family: 微軟正黑體; font-size: 20px;" for="exampleInputName2">退貨日期</label>
	 	<input style="width: 60%" type='text' name='ret_date' class="form-control"/>
	 </div>
	 	<input type="submit" value="查詢" class="btn btn-info">
	 	<input type="hidden" name="action" value="getDate">
	 </form>
	 <input type="submit" value="查詢全部" class="btn btn-info">
	 <input type="hidden" name="action" value="getAll">
	 
	
  <!--  <fieldset> -->
<!-- 	<legend>查詢</legend> -->
<!-- 	<table> -->
<!-- 	 <tr> -->
<!-- 	 <form action="getOne.do" method="post"> -->
<!-- 	 	<td style="text-align:right;">退貨單編號</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type='text' name='ret_id'/> -->
<!-- 	 		<input type="submit" value="查詢"> -->
<!-- 	 		<input type="hidden" name="action" value="getOne"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	 <form action="getDate.do" method="post"> -->
<!-- 	 	<td style="text-align:right;">退貨日期</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type="date" name="ret_date"/> -->
<!-- 	 		<input type="submit" value="查詢"> -->
<!-- 	 		<input type="hidden" name="action" value="getDate"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	 <form action="getComName.do" method="post">	  -->
<!-- 	 	<td style="text-align:right;">廠商名稱</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type='text' name='com_name'/> -->
<!-- 	 		<input type="submit" value="查詢"> -->
<!-- 	 		<input type="hidden" name="action" value="getComName"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	</table> -->
<!--  </fieldset> -->

</body>
</html>