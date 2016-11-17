<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.promoting.model.*"%>
<%
	PromotingVO promVO = (PromotingVO) request.getAttribute("promVO"); //若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新增促銷商品</title>
<style>
	.navbar-default .navbar-nav > li > a{
		color:#255957;
	}
	
	.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus{
 		background: #95BF8F;
 	}

	.navbar-default {
		background: #CCFFCC;
		border-color: #CCFF99;
		border-radius: 8px;
	}

 	.main{ 
  		height: 800px;  
 		border-radius: 8px; 
 		background:	#FFE4E1; 
 	}
 	
 	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #F7C548;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}

	.distance{
		margin: 20px;	
	}
	
	.btn-success {
    color: #fff;
    background-color: #e8c68a;
    border-color: #f3f3f3;
} 
</style>
</head>
<body>

	<div class="titlelist">新增</div>
	<div class="col-lg-12">

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

		<FORM METHOD="post" ACTION="insertProm.do" name="form1"
			class="form-horizontal" role="form">
			<p class="distance">
			<div class="form-group">

				<label class="col-lg-1 col-lg-offset-3 control-label">促銷商品編號:</label>
				<div class="col-lg-1">
					<input type="text" name="pro_prod_id" size="20" maxlength="15"
						value="<%=(promVO == null) ? "" : promVO.getPro_prod_id()%>" />
				</div>
				<label class="col-lg-1 control-label">促銷商品名稱:</label>
				<div class="col-lg-1">
					<input type="text" name="pro_prod_name" size="20"
						value="<%=(promVO == null) ? "" : promVO.getPro_prod_name()%>" />
				</div>
				<label class="col-lg-1 control-label">促銷商品起始日期:</label>
				<div class="col-lg-4">
					<input type="date" name="pro_begin" size="20"
						value="<%=(promVO == null) ? "" : promVO.getPro_begin()%>" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-3 control-label">促銷商品截止日:</label>
				<div class="col-lg-1">
					<input type="date" name="pro_end" size="20"
						value="<%=(promVO == null) ? "" : promVO.getPro_end()%>" />
				</div>
				<label class="col-lg-1 control-label">備註:</label>
				<div class="col-lg-6">
					<textarea name="pro_neirong" rows='5' cols="30"
						value="<%=(promVO == null) ? "" : promVO.getPro_neirong()%>">
					</textarea>
				</div>
			</div>
			<!-- 		<input type="hidden" name="action" value="insert">  -->
			<p class="distance">
			<div class="form-group">
				<div class="col-lg-1 col-lg-offset-5">
					<input type="button" value="送出新增" name="c_promoting" class="btn btn-success">
				</div>
				<div class="col-lg-5">
					<input type="reset" value="清除" class="btn btn-success">
				</div>
			</div>
		</FORM>
	</div>

	<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
	<script type="text/JavaScript">
		$(document).ready(function() {
//新增						
			$(":button[name='c_promoting']").click(function() {
				var insert = $("form[name='form1']");
				$.ajax({
						type : insert.attr("method"),
						url : insert.attr("action"),
						data : insert.serialize(),
						success : function(data) {
									$.ajax({
									type : "post",
									url : "allProm.do",
									data : {},
									success : function(data) {
										$(".result_content").html(data);
										$("#result_prom").attr("class","active");
										$("#insert_prom").removeAttr("class");
										$("#new_Pro").attr("class","tab-pane fade");
										$("#result_Pro").attr("class","tab-pane active");
										},
									});
								},
						});
				})
		})
	</script>
</body>
</html>