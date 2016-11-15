<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.promoting.model.*"%>
<%
	PromotingVO promVO = (PromotingVO) request.getAttribute("promVO");//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改促銷商品</title>
</head>
<body>

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

	<div class="titlelist">修改</div>
	<div class="col-lg-12">
		<FORM METHOD="post" ACTION="updateProm.do" name="upProForm"
			class="form-horizontal" role="form">
			<p>
			<div class="form-group">

				<label class="col-lg-1 col-lg-offset-2 control-label">促銷商品編號:</label>
				<div class="col-lg-2">
					<input type="text" name="pro_prod_id" size="20"
						value="${promVO.pro_prod_id}" readonly="readonly"
						style="color: gray" />
				</div>
				<label class="col-lg-1 control-label">促銷商品名稱:</label>
				<div class="col-lg-1">
					<input type="text" name="pro_prod_name" size="20"
						value="${promVO.pro_prod_name}" />
				</div>
				<label class="col-lg-1 control-label">促銷商品起始日期:</label>
				<div class="col-lg-4">
					<input type="date" name="pro_begin" size="20"
						value="${promVO.pro_begin}" readonly="readonly"
						style="color: gray" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-2 control-label">促銷商品截止日:</label>
				<div class="col-lg-2">
					<input type="date" name="pro_end" size="20"
						value="${promVO.pro_end}" />
				</div>
				<label class="col-lg-1 control-label">備註:</label>
				<div class="col-lg-6">
					<input type="text" name="pro_neirong" size="100"
						value="${promVO.pro_neirong}" />
				</div>

			</div>

			<p>
			<div class="form-group">
				<div class="col-lg-1 col-lg-offset-5">
					<input type="button" value="送出修改" name="c_promoting"
						class="btn btn-success">
				</div>
				<div class="col-lg-6">
					<input type="reset" value="清除" class="btn btn-success">
				</div>
			</div>
	</FORM>
	</div>


	<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
	<script>
		$(function() {
			$(":button").on('click', function() {
				$.ajax({
					type : "POST",
					url : "updateProm.do",
					data : $("form[name='upProForm']").serialize(),
					success : function(data) {
						$.ajax({
							"type" : "post",
							"url" : "allProm.do",
							"data" : {},
							"success" : function(data) {
								$(".result_content").html(data);
							},
						});
					},
				})
			})
		})
	</script>	
	

</body>
</html>