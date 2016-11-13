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

				<jsp:useBean id="DiscSvc" scope="page"
					class="com.discount.model.DiscountService" />

				<div class="col-lg-6">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 查詢
						</h4>
						<form METHOD="post" ACTION="disc.do" id="count"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">選擇折扣身份</label>
								<div class="col-sm-3">
									<select size="1" name="dis_id" class="form-control">
										<c:forEach var="discVO" items="${DiscSvc.all}">
											<option value="${discVO.dis_id}">${discVO.dis_id}
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4">
									<input type="button" value="以折扣身份查詢"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
						<form METHOD="post" ACTION="disc.do" id="pre"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">選擇折扣%數</label>
								<div class="col-sm-3">
									<select size="1" name="dis_id" class="form-control refresh">
										<c:forEach var="discVO" items="${DiscSvc.all}">
											<option value="${discVO.dis_id}">${discVO.dis_price}
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4">
									<input type="button" value="以折扣%數查詢"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
						<form METHOD="post" ACTION="allDisc.do" id="all"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">查詢全部</label>
								<div class="col-sm-3"></div>
								<div class="col-sm-4">
									<input type="button" value="查詢全部"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
					</div>
				</div>
	<script>
	$(document).ready(function() {
		$(":button").click(function() {
			if ("查詢全部" == $(this).val()) {
				var all = $("#all");
				$.ajax({
					"type" : all.attr("method"),
					"url" : all.attr("action"),
					"data" : all.serialize(),
					"success" : function(data) {
						$(".result-context").html(data);
						$("#result").attr("class","active");
						$("#search1").removeAttr("class");
						$("#search").attr("class","tab-pane fade");
						$("#resolution").attr("class","tab-pane active");
					},
				});
			} else if ("以折扣%數查詢" == $(this).val()) {
				var pre = $("#pre");
				$.ajax({
					"type" : pre.attr("method"),
					"url" : pre.attr("action"),
					"data" : pre.serialize(),
					"success" : function(data) {
						$(".result-context").html(data)
						$("#result").attr("class","active");
						$("#search1").removeAttr("class");
						$("#search").attr("class","tab-pane fade");
						$("#resolution").attr("class","tab-pane active");
					},
				});
			} else if ("以折扣身份查詢" == $(this).val()) {
				var count = $("#count");
				$.ajax({
					"type" : count.attr("method"),
					"url" : count.attr("action"),
					"data" : count.serialize(),
					"success" : function(data) {
						$(".result-context").html(data)
						$("#result").attr("class","active");
						$("#search1").removeAttr("class");
						$("#search").attr("class","tab-pane fade");
						$("#resolution").attr("class","tab-pane active");
					},
				});
			} else if ("送出新增" == $(this).val()) {
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
			}

		})

		
	})
	</script>				
</body>
</html>