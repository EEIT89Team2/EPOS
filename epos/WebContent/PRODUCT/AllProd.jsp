<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>全部商品基本資料</title>
<style>

		/* 	表格標題 */
	.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td{
		background: #42858C;
		font-weight:bold;
		text-align: center;
	}
	
	/* 	表格內容偶數 */
	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
		background: #63CCCA;
		border:1px solid #556B2F;
		
	}
	/* 	表格內容單數 */
	.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
		background:white;
	}
	
	/* 	表格偶數滑鼠指向 */
	.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th{
		background-color: #397367;
	}
	
	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #99CCCC;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	p{
		margin: 30px;
	
	}
	
</style>
</head>
<body>
		<div class="titlelist">查詢結果</div>
			<div class="col-lg-12">		
			<p>
				<div class="titlelist">商品清單</div>
		<table border='2' bordercolor='#CCCCFF' width='1300' class="table table-bordered table-striped  table-hover">
		<thead>
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>廠商編號</th>
				<th>分類</th>
				<th>定價</th>
				<th>成本</th>
				<th>庫存</th>
				<th>安全庫存</th>
				<th>規格</th>
				<th>商品照片</th>
				<th>備註</th>
				<th>是否上架</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
		</thead>
		<c:forEach var="list" items="${list}" varStatus="count">
<!-- 		<form method="post" action="updateDeleteProd.do"> -->
			<tr align='center' valign='middle'>
				<td>${list.prod_id}</td>
				<td>${list.prod_name}</td>
				<td>${list.com_id}</td>
				<td>${list.prod_group}</td>
				<td>${list.prod_mkprice}</td>
				<td>${list.prod_cost}</td>
				<td>${list.prod_stock}</td>
				<td>${list.prod_q_safty}</td>
				<td>${list.prod_spec}</td>
				<td><img alt="尚無照片" src="data:image/gif;base64,${list.picture}"></td>
				<td>${list.remark}</td>
				<td>${list.status}</td>
				<td>
					<button type="button" class="btn btn-success" name="action" value="update" target="${list.prod_id}">
						<i class="fa fa-pencil"></i>
					</button>
				</td>
				<td>
					<button type="button" class="btn btn-danger" name="action" value="delete" target="${list.prod_id}">
						<i class="fa fa-trash-o"></i>
					</button>
				</td>
			</tr>
<!-- </form>	 -->
		
</c:forEach>
	</table>
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->	
	<script type="text/JavaScript">
	$(document).ready(function() {
		$("button").on('click',function(){
			if($(this).attr('value')=="delete"){
				$.ajax({
					type : "post",
					url : "updateDeleteProd.do",
					data : {
							prod_id:$(this).attr('target'),
							action:"delete"
							},
					success :function(data) {
						$(".result_content").html(data);
					}	
				});
			}else if($(this).attr('value')=="update"){
				$.ajax({
					type : "post",
					url : "updateDeleteProd.do",
					data : {
							prod_id:$(this).attr('target'),
							action:"update"
							},
					success :function(data) {
						$(".result_content").html(data);
					}
				});
			}
		});
	});

	</script>	

</body>
</html>