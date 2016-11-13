<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coupon.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>all</title>
</head>
<body>
	<jsp:useBean id="copSvc" scope="page" class="com.coupon.model.CouponService" />
<center>
 
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>折價券編號</th>
			<th>折價券名稱</th>
			<th>發行日期</th>
			<th>使用期限</th>
			<th>面額</th>
			<th>狀態</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
	
		<c:forEach var="copVO" items="${copSvc.all}">

			<tr align='center' valign='middle'>
				<td>${copVO.cpon_id}</td>
				<td>${copVO.cpon_name}</td>
				<td>${copVO.release_date}</td>
				<td>${copVO.cpon_period}</td>
				<td>${copVO.cpon_dollar}</td>
				<td>${copVO.status}</td>
				<td>
					<input type="button" value="修改" name='update' target="${copVO.cpon_id}"> 
				</td>
				<td>
					<input type="button" value="刪除" name='delete' target="${copVO.cpon_id}"> 
				</td>
			</tr>

		</c:forEach>
	</table>
	</center>
	<script>
		$(function() {
			$(':button').on('click', function() {		
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