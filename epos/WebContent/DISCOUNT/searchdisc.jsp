<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap-theme.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	.divser{
		font-size: 20px;
		background: #5bc0de;
		font-family: 微軟正黑體;
		font-weight:bold;
		text-align: center;
		color:white;
	}

</style>

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
	<jsp:useBean id="DiscSvc" scope="page" class="com.discount.model.DiscountService" />

	<div class="divser">查詢</div>
	<div style="height: 20px"></div>
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
									<input type="submit" value="以折扣身份查詢"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
						<form METHOD="post" ACTION="disc.do" id="pre"
							class="form-horizontal style-form">
							<div class="form-group">
								<label class="col-sm-5 col-sm-3 control-label">選擇折扣%數</label>
								<div class="col-sm-3">
									<select size="1" name="dis_id" class="form-control">
										<c:forEach var="discVO" items="${DiscSvc.all}">
											<option value="${discVO.dis_id}">${discVO.dis_price}
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4">
									<input type="submit" value="以折扣%數查詢"
										class="btn btn-round btn-theme03">
								</div>
							</div>
						</form>
	 
</body>
</html>