<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="java.util.*"%>
<%@ page import="com.promoting.model.*"%>
<%
	List<PromotingVO> list = (List<PromotingVO>)request.getAttribute("list");
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
<title>促銷商品清單</title>
</head>
<body>
<center>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
 
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>促銷品號</th>
		<th>促銷品名</th>
		<th>活動起始日</th>
		<th>活動截止日</th>
		<th>備註</th>
		<th>修改</th>
		<th>查詢</th>
	</tr>
	
	<c:forEach var="PromVO" items="${list}">	
		<tr align='center' valign='middle'>
			<td>${PromVO.pro_prod_id}</td>
			<td>${PromVO.pro_prod_name}</td>
			<td>${PromVO.pro_begin}</td>
			<td>${PromVO.pro_end}</td>
			<td>${PromVO.pro_neirong}</td>

        		<td>
<%-- 					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/PROMOTING/allForUpdateProm.do"> --%>
						<input type="button" value="修改"  target1="${PromVO.pro_prod_id}" target2="${PromVO.pro_begin}"> 
<%-- 						<input type="hidden" name="pro_prod_id" value="${PromVO.pro_prod_id}">  --%>
<%-- 						<input type="hidden" name="pro_begin" value="${PromVO.pro_begin}">  --%>
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 					</FORM> -->
				</td>
				<td>
<%-- 					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/PROMOTING/deleteProm.do"> --%>
						<input type="button" value="刪除" target1="${PromVO.pro_prod_id}" target2="${PromVO.pro_begin}"> 
<%-- 						<input type="hidden" name="pro_prod_id" value="${PromVO.pro_prod_id}">  --%>
<%-- 						<input type="hidden" name="pro_begin" value="${PromVO.pro_begin}">  --%>
<!-- 						<input type="hidden" name="action" value="delete"> -->
<!-- 					</FORM> -->
				</td>
	 	</tr>
	 </c:forEach>
</table>
</center>
<jsp:include page="/COMMON/footer_prom.jsp" />

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

	<script type="text/JavaScript">
	$(document).ready(function() {
		$(":button").on('click',function(){
			if($(this).val()=="刪除"){
				$.ajax({
					type : "post",
					url : "deleteProm.do",
					data : {
						pro_prod_id:$(this).attr('target1'),
						pro_begin:$(this).attr('target2')
					},
					success :function(data) {
						$(".result-context").html(data);
					}	
				});
			}else if($(this).val()=="修改"){
				$.ajax({
					type : "post",
					url : "allForUpdateProm.do",
					data : {
						pro_prod_id:$(this).attr('target1'),
						pro_begin:$(this).attr('target2')
					},
					success :function(data) {
						$(".result-context").html(data);
					}
				});
			}
		});
	});

	</script>	
</body>
</html>