<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

		/* 	表格標題 */
	.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td{
		background: #bd3cb6;
		font-weight:bold;
		text-align: center;
	}
	
	/* 	表格內容偶數 */
	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
		background:		#DAFFEF;
		border:1px solid #DAE0CE;
		
	}
	/* 	表格內容單數 */
	.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
		background:white;
	}
	
	/* 	表格偶數滑鼠指向 */
	.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th{
		background-color:#D5E2BC;
	}
	
/* nav */
	.navbar-default{
		background: #E6F9AF;
		border-color:#E6F9AF;
		border-radius: 8px;
	}
/* background */
 	.main{ 
  		height: 800px;  
 		border-radius: 8px; 
 		background:	#A0DBB9; 
 	}
/*  title	 */
 	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #384E77;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	p{
		margin: 30px;	
	}
	
	.btn-theme02 {
    color: #fff;
    background-color: #229abd;
    border-color: #31535d;
}
	
</style>
<title>全部班別報表</title>

</head>
<body>
<div class="titlelist">查詢結果</div>
<div class="col-lg-12">
<p>
				<div class="titlelist">班別報表</div>
		<table id="allshif" border="2" bordercolor='#CCCCFF' class="table table-bordered table-striped  table-hover">
		<thead><tr>
			<th class="numeric">日期</th>
			<th class="numeric">班別</th>
			<th class="numeric">員工編號</th>
			<th class="numeric">現金</th>
			<th class="numeric">禮卷</th>
			<th class="numeric">折讓</th>
			<th class="numeric">零用金</th>
			<th class="numeric">交易額</th>
			<th class="numeric">交易成本</th>
			<th class="numeric">交易淨利</th>
			<th class="numeric">交易次數</th>
			<th class="numeric">班別小計</th>
			<th class="numeric">修改</th>
			<th class="numeric">刪除</th>
		</tr></thead>
		
<c:forEach var="list" items="${list}" varStatus="count">
<!-- 		<form method="post" action="updateDeleteShiftre.do"> -->
		<tr align='center' valign='middle'>
			<td class="numeric" data-title="日期">${list.date}</td>
			<td class="numeric" data-title="班別">${list.shift}</td>
			<td class="numeric" data-title="員工編號">${list.emp_id}</td>
			<td class="numeric" data-title="現金">${list.cash}</td>
			<td class="numeric" data-title="禮卷">${list.coupon}</td>
			<td class="numeric" data-title="折讓">${list.discount}</td>
			<td class="numeric" data-title="零用金">${list.coins}</td>
			<td class="numeric" data-title="交易額">${list.deal_sum}</td>
			<td class="numeric" data-title="交易成本">${list.deal_cost}</td>
			<td class="numeric" data-title="交易淨利">${list.deal_profit}</td>
			<td class="numeric" data-title="交易次數">${list.deal_num}</td>
			<td class="numeric" data-title="班別小計">${list.shift_sum}</td>
			<td class="numeric" data-title="修改">
				<button type="button" class="btn btn-theme02" name="action" value="update" target1="${list.date}" target2="${list.shift}">
					<i class="fa fa-pencil"></i>
				</button>
	
			</td>
			<td class="numeric" data-title="刪除">
<%-- 				<input type="button" name="action" value="delete" target1="${list.date}" target2="${list.shift}"> --%>
				<button type="button" class="btn btn-danger">
					<i class="fa fa-trash-o" action="delete" target1="${list.date}" target2="${list.shift}"></i>
				</button>
			</td>
					<%-- 			<input type="hidden" name="Date" value="${list.date}"> --%>
<%-- 			<input type="hidden" name="shift" value="${list.shift}"> --%>
			
		</tr>
		
<!-- 		</form> -->
<%-- 		${count.index} --%>
</c:forEach>
	</table>
</div>
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
		
	<script type="text/JavaScript">
	
	
	
	$(document).ready(function() {
		
	$("#allshif").dataTable();
		
		
		$('.fa-trash-o').click(function() {
			var date = $(this).attr("target1");
			var shift = $(this).attr("target2");
			$.ajax({
				type : "post",
				url : "updateDeleteShiftre.do",
				data : {
					Date : date,
					shift : shift,
					action : "delete"
				},
				success : function(data) {
					$(".rul").html(data);
				}
			});

		})
		
		$("button").on('click',function(){

			if($(this).val()=="update"){
				$.ajax({
					type : "post",
					url : "updateDeleteShiftre.do",
					data : {
							Date:$(this).attr('target1'),
							shift:$(this).attr('target2'),
							action:"update"
							},
					success :function(data) {
						$(".rul").html(data);
					}
				});
			}
		});
	});
	
	</script>	
	
</body>
</html>