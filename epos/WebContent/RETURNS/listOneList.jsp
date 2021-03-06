<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.returns.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<RtnListVO> list = (List<RtnListVO>)request.getAttribute("list");
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<title>退貨單</title>

<style type="text/css">

	html{
		background: white;
	}
	
	a{
		margin-left: 30px;
	}
	
	.titledetail {
		/*     	margin-top:auto; */
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #ffa9a9;
		font-size: 23px;
		border-radius: 2px;
		text-align: center;
	}
	
	body{
		background: white;
	}
	
	/* 	表格標題 */
	.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td{
		background: #ff7d7d;
		font-weight:bold;
	}
	
	/* 	表格內容偶數 */
	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
		background:#ffe0e0;
		border:1px solid #ff7d7d;
		
	}
	/* 	表格內容單數 */
	.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
		background:white;
	}
	
	/* 	表格偶數滑鼠指向 */
	.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th{
		background-color:#fdaeae;
	}
</style>

</head>
<body>
<div class="titledetail">退貨單</div>
<table border='1' class="table table-bordered table-striped table-hover">
<thead>
<tr>
	<td align='center'>退貨單編號</td><td align='center'>退貨日期</td><td align='center'>廠商編號</td><td align='center'>廠商名稱</td><td align='center'>修改人員</td><td align='center'>修改日期</td><td align='center'>備註</td><td align='center'>狀態</td><td align='center'>查詢明細</td><td align='center'>修改</td><td align='center'>刪除</td>
</tr>
</thead>
		<c:forEach var="list" items="${list}">
		<tr align='center' valign='middle'>
			<td>${list.ret_id}</td>
			<td>${list.ret_date}</td>
			<td>${list.com_id}</td>
			<td>${list.com_name}</td>
			<td>${list.key_id}</td>
			<td>${list.key_date}</td>
			<td>${list.remark}</td>
			<td>${list.status}</td>
		<td>
			  <FORM METHOD="post" ACTION="getDetail.do">
			     <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i></button>
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getDetail">
			  </FORM>
		</td>
		<td>
			  <FORM METHOD="post" ACTION="getOne_For_Update.do">
			     <button type="submit" class="btn btn-success"><i class="fa fa-pencil"></i></button>
			     <input type="hidden" name="ret_id" value="${list.ret_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
			   <button type="submit" target="${list.ret_id}" class="btn btn-danger"><i class="fa fa-trash-o "></i></button>
		</td>
		</tr>
		</c:forEach>
</table>

	<a href="../RETURNS/ReturnList.jsp"><i class="glyphicon glyphicon-th-list"></i>　退貨單</a></br>
	<a href="javascript:" onclick="history.back(); "><i class="glyphicon glyphicon-arrow-left"></i>　回上頁</a>



		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		!window.jQuery
				&& document
						.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
	</script>
	<script src="<c:url value="../resources/js/bootstrap.min.js" />"></script>
	
	<script type="text/javascript">

	// ----------------------------刪除-------------------------------------------
	
	$('.btn-danger').on('click',function(){	
		var delbtn = $(this).parent().parent();
		var id = $(this).attr('target');
    	var url = "delete.do"; 
    $.ajax({
           type: "POST",
           url: url,
           data: {
        	   ret_id:id,
           },
           success: function(data)
           {
        	   delbtn.remove();
           }
         });
	})
	</script>
</body>
</html>