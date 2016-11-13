<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insertDic</title>
</head>
<body>
				<div class="col-lg-4">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 新增
						</h4>
						<!--錯誤表列 -->
<%-- 						<c:if test="${not empty errorMsgs}"> --%>
<!-- 							<font color='red'>請修正以下錯誤: -->
<!-- 								<ul> -->
<%-- 									<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 										<li>${message}</li> --%>
<%-- 									</c:forEach> --%>
<!-- 								</ul> -->
<!-- 							</font> -->
<%-- 						</c:if> --%>
						<form class="form-inline" METHOD="post" ACTION="insertDisc.do"
							id="insert">
							<div class="form-group">
								<input type=text class="form-control" name="dis_id"
									placeholder="折扣身分" size="10">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="dis_price"
									placeholder="折扣%數" size="10">
							</div>
							<input type="button" value="送出新增" class="btn btn-theme03">
						</form>
					</div>
				</div>
				
<script type="text/JavaScript">
$(document).ready(function() {
//新增	
	$(":button[value='送出新增']").click(function() {

		var insert = $("#insert");
		$.ajax({
			"type" : insert.attr("method"),
			"url" : insert.attr("action"),
			"data" : insert.serialize(),
			"success" : function(data) {
				$.ajax({
					"type" : "post",
					"url" : "allDisc.do",
					"data" : {},
					"success" : function(data) {
						$(".result-context").html(data);
						$("#result").attr("class","active");
						$("#import").removeAttr("class");
						$("#new").attr("class","tab-pane fade");
						$("#resolution").attr("class","tab-pane active");
					},
				});
			},
		});
	})
})
</script>
</body>
</html>