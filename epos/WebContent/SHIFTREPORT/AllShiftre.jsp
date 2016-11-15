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
		background: #FF99CC;
		font-weight:bold;
		text-align: center;
	}
	
	/* 	表格內容偶數 */
	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
		background:		#CCCCFF;
		border:1px solid #556B2F;
		
	}
	/* 	表格內容單數 */
	.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
		background:white;
	}
	
	/* 	表格偶數滑鼠指向 */
	.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th{
		background-color:#CCCCFF;
	}
	
	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #FF6666;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	.formlist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #FF6666;
		text-align: center;
		font-size: 23px;
		border-radius: 2px;
	}
	
	p{
		margin: 30px;	
	}
	
</style>
<title>全部班別報表</title>

</head>
<body>
<div class="titlelist">查詢結果</div>
<div class="col-lg-12">
<p>
				<div class="formlist">班別報表</div>
		<table border="2" bordercolor='#CCCCFF' width='800' class="table table-bordered table-striped  table-hover">
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
			<td class="numeric">${list.date}</td>
			<td class="numeric">${list.shift}</td>
			<td class="numeric">${list.emp_id}</td>
			<td class="numeric">${list.cash}</td>
			<td class="numeric">${list.coupon}</td>
			<td class="numeric">${list.discount}</td>
			<td class="numeric">${list.coins}</td>
			<td class="numeric">${list.deal_sum}</td>
			<td class="numeric">${list.deal_cost}</td>
			<td class="numeric">${list.deal_profit}</td>
			<td class="numeric">${list.deal_num}</td>
			<td class="numeric">${list.shift_sum}</td>
			<td class="numeric">
				<button type="button" class="btn btn-theme02" name="action" value="update" target1="${list.date}" target2="${list.shift}">
					<i class="fa fa-pencil"></i>
				</button>
	
			</td>
			<td class="numeric">
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