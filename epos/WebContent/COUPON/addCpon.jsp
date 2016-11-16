<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.coupon.model.*"%>
<%
CouponVO copVO = (CouponVO) request.getAttribute("copVO");	//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新增折價券</title>
<style>
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

p {
	margin: 30px;
}

.form-horizontal .control-label {
	text-align: right;
}
</style>
</head>
<body>

	<div class="titlelist">新增</div>
		<div class="col-lg-12">
<%-- 錯誤表列 --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font color='red'>請修正以下錯誤: -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li>${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<!-- 	</font> -->
<%-- </c:if> --%>
							
	<FORM METHOD="post" ACTION="insertCpon.do" name="form1" class="form-horizontal" role="form">
		<p>
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">折價券名稱:</label>
				<div class="col-lg-6">
					<input type="text" name="cpon_name" size="20"
						value="<%=(copVO == null) ? "新年" : copVO.getCpon_name()%>" />
				</div>
			</div>
			<div class="form-group">	
				<label class="col-lg-1 col-lg-offset-5 control-label">發行日期:</label>
				<div class="col-lg-6">
					<input type="date" name="release_date" size="20" value="<%= (copVO==null)? "" : copVO.getRelease_date()%>" />
				</div>
			</div>
			<div class="form-group">	
				<label class="col-lg-1 col-lg-offset-5 control-label">使用期限:</label>
				<div class="col-lg-6">
					<input type="date" name="cpon_period" size="20" value="<%= (copVO==null)? "" : copVO.getCpon_period()%>" />
				</div>
			</div>
			<div class="form-group">		
				<label class="col-lg-1 col-lg-offset-5 control-label">面額:</label>
				<div class="col-lg-6">	
					<input type="text" name="cpon_dollar" size="20" value="<%= (copVO==null)? "100" : copVO.getCpon_dollar()%>" />
				</div>
			</div>
			<div class="form-group">		
				<label class="col-lg-1 col-lg-offset-5 control-label">狀態:</label>
				<div class="col-lg-6">
					已出貨<input type="radio" name="status"  value="Y" />
					庫存<input type="radio" name="status"  value="N"/>
				</div>
			</div>
				<p>
				<div class="form-group">
					<div class="col-lg-1 col-lg-offset-5">
						<input type="button" value="送出新增" name="c_promoting" class="btn btn-theme03">
					</div>
					<div class="col-lg-5">
						<input type="reset" value="清除" class="btn btn-theme03">
					</div>
				</div>
	</FORM>
</div>				
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
	<script>
		$(function() {
			$(':button').on('click', function() {
				if("送出新增"==$(this).val()){
					var form1 = $("form[name='form1']");
					$.ajax({
						type : "POST",
						url : form1.attr('action'),
						data : form1.serialize(),
						success : function(data) {
							$(".chg_content").html(data);
						}
					})
				}
			})
		})
	</script>	
</body>
</html>