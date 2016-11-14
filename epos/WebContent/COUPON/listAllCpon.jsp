<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coupon.model.*"%>
<%
	List<CouponVO> list =(List<CouponVO>) request.getAttribute("list");	//除了錯誤訊息是用VO或List送來外,其餘的查詢結果都是用List送來
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

		/* 	表格標題 */
	.table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > th, .table > caption + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > td, .table > thead:first-child > tr:first-child > td{
		background: #66CDAA;
		font-weight:bold;
		text-align: center;
	}
	
	/* 	表格內容偶數 */
	.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td{
		background:		#F0FFF0;
		border:1px solid #556B2F;
		
	}
	/* 	表格內容單數 */
	.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
		background:white;
	}
	
	/* 	表格偶數滑鼠指向 */
	.table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th{
		background-color:FFE4C4;
	}
	
	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: mediumseagreen;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	.formlist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: mediumseagreen;
		text-align: center;
		font-size: 23px;
		border-radius: 2px;
	}
	
	p{
		margin: 30px;
	
	}
	
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折價券清單</title>
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
 
<div class="titlelist">查詢結果</div>
<div class="col-lg-12">
 <p>
	<div class="formlist">折價券</div>
		<table border="2" bordercolor='#CCCCFF' width='800' class="table table-bordered table-striped  table-hover">
		<thead><tr>
			<th>折價券編號</th>
			<th>折價券名稱</th>
			<th>發行日期</th>
			<th>使用期限</th>
			<th>面額</th>
			<th>狀態</th>
			<th>修改</th>
			<th>刪除</th>
		</tr></thead>
	
		<c:forEach var="copVO" items="${list}">
<!-- 		<form method="post" action="updateAll.do"> -->
			<tr align='center' valign='middle'>
				<td>${copVO.cpon_id}</td>
				<td>${copVO.cpon_name}</td>
				<td>${copVO.release_date}</td>
				<td>${copVO.cpon_period}</td>
				<td>${copVO.cpon_dollar}</td>
				<td>${copVO.status}</td>
				<td>
<%-- 					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/COUPON/allForUpdateCpon.do"> --%>
					<button type="button" class="btn btn-success" name="update" target="${copVO.cpon_id}">
							<i class="fa fa-pencil"></i>
					</button>
<%-- 						<input type="hidden" name="cpon_id" value="${copVO.cpon_id}">  --%>
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 					</FORM> -->
				</td>
				<td>
<%-- 					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/COUPON/deleteCpon.do"> --%>
					<button type="button" class="btn btn-danger" name="delete" target="${copVO.cpon_id}">
						<i class="fa fa-trash-o"></i>
					</button>
<%-- 						<input type="hidden" name="cpon_id" value="${copVO.cpon_id}">  --%>
<!-- 						<input type="hidden" name="action" value="delete"> -->
<!-- 					</FORM> -->
				</td>
			</tr>
<!-- 			</form> -->
		</c:forEach>
	</table>
</div>


	<script>
		$(function() {
			$('button').on('click', function() {		
				if($(this).attr('name')=="delete"){
					$.ajax({
						type : "POST",
						url : "deleteCpon.do",
						data : {
							cpon_id:$(this).attr('target')
						},
						success : function(data) {
							$(".chg-content").html(data);
						}
					})
				}if($(this).attr('name')=="update"){
					$.ajax({
						type : "POST",
						url : "allForUpdateCpon.do",
						data : {
							cpon_id:$(this).attr('target')
						},
						success : function(data) {
							$(".chg-content").html(data);
						}
					})
				}	
			})
		})
	</script>
</body>
</html>