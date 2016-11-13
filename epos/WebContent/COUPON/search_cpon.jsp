<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>searchCpon</title>
</head>
<body>
<!-- 錯誤表列 -->
<%-- 				<c:if test="${not empty errorMsgs}"> --%>
<!-- 					<font color='red'>請修正以下錯誤 -->
<!-- 						<ul> -->
<%-- 							<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 								<li>${message}</li> --%>
<%-- 							</c:forEach> --%>
<!-- 						</ul> -->
<!-- 					</font> -->
<%-- 				</c:if> --%>

				<h3>查詢</h3>

				查詢單筆
				<ul>
					<li>
						<FORM METHOD="post" ACTION="coupon.do" class="search_1">
							<b>輸入折價券編號 (如CPa00001):</b> 
							<input type="text" name="cpon_id" size="10"> 
							<input type="button" value="送出" id="search_1">
							<input type="hidden" name="action" value="getOne_For_Display">
						</FORM>
					</li>
					
					<jsp:useBean id="copSvc" scope="page" class="com.coupon.model.CouponService" />
					
					<li>
						<FORM METHOD="post" ACTION="coupon.do" class="search_2">
							<b>選擇折價券編號:</b> <select size="1" name="cpon_id">
								<c:forEach var="copVO" items="${copSvc.all}">
									<option value="${copVO.cpon_id}">${copVO.cpon_id}
								</c:forEach>
							</select> 
							<input type="button" value="送出" id="search_2">
							<input type="hidden" name="action" value="getOne_For_Display">
						</FORM>
					</li>
<%--查詢多筆 --%>
					<p>
					<li>
						<FORM METHOD="post" ACTION="namesCpon.do" class="search_3">
							<b>選擇折價券名稱:</b> <select size="1" name="cpon_name">
								<c:forEach var="copVO" items="${copSvc.groupNam}">
									<option value="${copVO.cpon_name}">${copVO.cpon_name}
								</c:forEach>
							</select> 
							<input type="button" value="送出" id="search_3">
							<input type="hidden" name="action" value="getNames_For_Display">
						</FORM>
					</li>
					<p>
					<li>
						<FORM METHOD="post" ACTION="dollarCpon.do" class="search_4">
							<b>選擇折價券金額:</b> <select size="1" name="cpon_dollar">
								<c:forEach var="copVO" items="${copSvc.groupDol}">
									<option value="${copVO.cpon_dollar}">${copVO.cpon_dollar}
								</c:forEach>
							</select> 
							<input type="button" value="送出" id="search_4">
							<input type="hidden" name="action" value="getDollar_For_Display">
						</FORM>
					</li>
					<p>
					<li>
						<FORM METHOD="post" ACTION="datesCpon.do" class="search_5">
							<b>選擇折價券日期區間:</b> <input type="date" name="release_date">
							<input type="date" name="cpon_period"> 
							<input type="button" value="送出" id="search_5">
							<input type="hidden" name="action" value="getDates_For_Display">
						</FORM>
					</li>
				</ul>
<!--查詢全部 -->
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/COUPON/allCpon.do">
					<input type="button" value="查詢全部" id="search_6">
						<input type="hidden" name="action" value="getAll_For_Display">
				</FORM>
	<script>
		$(function() {
			$(':button').on('click', function() {		
				if($(this).attr('id')=="search_1"){
					var search_1 = $(".search_1");
					$.ajax({
						type : "POST",
						url : search_1.attr('action'),
						data : search_1.serialize(),
						success : function(data) {
							$(".chg-content").html(data);
						}
					})
				}else if($(this).attr('id')=="search_2"){
					var search_2 = $(".search_2");
	 				$.ajax({
	 					type : "POST",
	 					url : search_2.attr('action'),
	 					data : search_2.serialize(),
	 					success : function(data) {
	 						$(".chg-content").html(data);
	 					}
	 				})	
				}else if($(this).attr('id')=="search_3"){
					var search_3 = $(".search_3");
	 				$.ajax({
	 					type : "POST",
	 					url : search_3.attr('action'),
	 					data : search_3.serialize(),
	 					success : function(data) {
	 						$(".chg-content").html(data);
	 					}
	 				})	
				}else if($(this).attr('id')=="search_4"){
					var search_4 = $(".search_4");
	 				$.ajax({
	 					type : "POST",
	 					url : search_4.attr('action'),
	 					data : search_4.serialize(),
	 					success : function(data) {
	 						$(".chg-content").html(data);
	 					}
	 				})	
				}else if($(this).attr('id')=="search_5"){
					var search_5 = $(".search_5");
	 				$.ajax({
	 					type : "POST",
	 					url : search_5.attr('action'),
	 					data : search_5.serialize(),
	 					success : function(data) {
	 						$(".chg-content").html(data);
	 					}
	 				})	
				}else if($(this).attr('id')=="search_6"){
					var search_6 = $(".search_6");
	 				$.ajax({
	 					type : "POST",
	 					url : "allCpon.do",
	 					data : {},
	 					success : function(data) {
	 						$(".chg-content").html(data);
	 					}
	 				})	
				}	
			});
						
		})
	</script>				
</body>
</html>