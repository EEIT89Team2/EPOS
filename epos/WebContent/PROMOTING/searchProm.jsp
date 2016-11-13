<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.promoting.model.*"%>
<%
	PromotingVO promVO = (PromotingVO) request.getAttribute("promVO");	//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>search</title>
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

				<div class="col-lg-6">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 查詢
						</h4>
						<ul>
							<li>
								<FORM METHOD="post" ACTION="namesProm.do" name="r_prom1">
									<b>輸入促銷商品編號 (如P00001):</b> 
									<input type="text" name="pro_prod_name" size="10"> 
									<input type="button" value="送出" class="r_prom1">
								</FORM>
							</li>
							
							<jsp:useBean id="PromSvc" scope="page" class="com.promoting.model.PromotingService" />
							
							<p>
							<li>
								<FORM METHOD="post" ACTION="datesProm.do" name="r_prom2">
									<b>選擇促銷日期區間:</b> <input type="date" name="pro_begin"> 
									<input type="date" name="pro_end"> 
									<input type="button" value="送出" class="r_prom2"> 
									<input type="hidden" name="action" value="getDates_For_Display">
								</FORM>
							</li>
							<p>
							<li>
								<FORM METHOD="post" ACTION="idsProm.do" name="r_prom3">
									<b>選擇促銷編號範圍:</b> <select size="1" name="pro_prod_id1">
										<c:forEach var="promVO" items="${PromSvc.all}">
											<option value="${promVO.pro_prod_id}">${promVO.pro_prod_id}
										</c:forEach>
									</select> <select size="1" name="pro_prod_id2">
										<c:forEach var="promVO" items="${PromSvc.all}">
											<option value="${promVO.pro_prod_id}">${promVO.pro_prod_id}
										</c:forEach>
									</select> 
									<input type="button" value="送出" class="r_prom3"> 
									<input type="hidden" name="action" value="getIds_For_Display">
								</FORM>
							</li>
						</ul>
						<%-- 查詢全部 --%>

<%-- 						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PROMOTING/allProm.do" name="r_prom4"> --%>
							<input type="button" value="查詢全部" class="r_prom4">
<!-- 						</FORM> -->
					</div>

				</div>
			
<script type="text/JavaScript">
	$(document).ready(function() {
				
// 查詢						
			$(":button").click(function() {
				if($(this).attr("class")=='r_prom1'){
					var r_prom1 = $("form[name='r_prom1']");
					$.ajax({
						"type" : r_prom1.attr("method"),
						"url" : r_prom1.attr("action"),
						"data" : r_prom1.serialize(),
						"success" : function(data) {
									$(".result-context").html(data);
									$("#result_prom").attr("class","active");
									$("#search_prom").removeAttr("class");
									$("#search").attr("class","tab-pane fade");
									$("#result").attr("class","tab-pane active");
						},
					});
				}else if($(this).attr("class")=='r_prom2'){
					var r_prom2 = $("form[name='r_prom2']");
					$.ajax({
						"type" : r_prom2.attr("method"),
						"url" : r_prom2.attr("action"),
						"data" : r_prom2.serialize(),
						"success" : function(data) {
									$(".result-context").html(data);
									$("#result_prom").attr("class","active");
									$("#search_prom").removeAttr("class");
									$("#search").attr("class","tab-pane fade");
									$("#result").attr("class","tab-pane active");
						},
					});
				}else if($(this).attr("class")=='r_prom3'){
					var r_prom3 = $("form[name='r_prom3']");
					$.ajax({
						"type" : r_prom3.attr("method"),
						"url" : r_prom3.attr("action"),
						"data" : r_prom3.serialize(),
						"success" : function(data) {
									$(".result-context").html(data);
									$("#result_prom").attr("class","active");
									$("#search_prom").removeAttr("class");
									$("#search").attr("class","tab-pane fade");
									$("#result").attr("class","tab-pane active");
						},
					});
				}else if($(this).attr("class")=='r_prom4'){
					$.ajax({
						"type" : "post",
						"url" : "allProm.do",
						"data" : {},
						"success" : function(data) {
									$(".result-context").html(data);
									$("#result_prom").attr("class","active");
									$("#search_prom").removeAttr("class");
									$("#search").attr("class","tab-pane fade");
									$("#result").attr("class","tab-pane active");
						},
					});
				}
			})

	})
</script>				
</body>
</html>