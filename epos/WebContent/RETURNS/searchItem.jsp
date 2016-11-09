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
<title>Insert title here</title>
<style>
	.divser{
		font-size: 20px;
		background: #5bc0de;
		font-family: 微軟正黑體;
		font-weight:bold;
		text-align: center;
		color:white;
	}

</style>

</head>
<body>
  	
	<div class="divser">查詢</div>
	
	 <form action="getName_Item.do" method="post" class="form-inline">
	 <div class="form-group">
	 	<label style="font-family: 微軟正黑體; font-size: 20px;" for="exampleInputName2">商品名稱</label>
	 	<input style="width: 40%" type='text' name='prod_name' class="form-control"/>
	 	
	 </div>
	 	<input type="submit" value="查詢" class="btn btn-info">
	 	<input type="hidden" name="action" value="getName">
	 </form>
	 <form action="getComId.do" method="post" class="form-inline">
	 <div class="form-group">
	 	<label style="font-family: 微軟正黑體; font-size: 20px;" for="exampleInputName2">廠商代號</label>
	 	<input style="width: 40%" type='text' name='com_id' class="form-control"/>
	 </div>
	 	<input type="submit" value="查詢" class="btn btn-info">
	 	<input type="hidden" name="action" value="getComId">
	 </form>
	 
	
  

</body>
</html>