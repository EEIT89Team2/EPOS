<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insertShiftre</title>
<style>
	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #FF6666;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	.formlist {
		font-family: '微軟正黑體';
		font-weight: bold;
		height: 35px;
		text-align: center;
		font-size: 23px;
		border-radius: 2px;
	}
		
	p{
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

		<!--錯誤表列 -->
		<c:if test="${not empty param.message}">
			<font color='red'>請修正以下錯誤:
				<ul>
					<c:forEach var="message" items="${param.message}">
						<li>${message}</li>
					</c:forEach>
				</ul>
			</font>
		</c:if>

<!-- 	<div class="form-group"> -->
<!--     	<label class="col-lg-1 control-label">廠商代號:</label> -->
<!--     	<div class="col-lg-6"> -->
<%--       		<input type="text" class="form-control" name="com_id" value="<%=rtnItemsVO.getCom_id()%>" disabled="disabled"/> --%>
<!--     	</div> -->
<!--   	</div>  -->


		<form method="post" action="insertShiftre.do" class="insertShift form-horizontal" role="form">

			<p>
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">日期:</label>
				<div class="col-lg-6">
					<input type="date" name="Date">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">班別:</label>
				<div class="col-lg-1">
					<Select name="shift" class="form-control">
						<option value="A">A</option>
						<option value="B">B</option>
					</Select>
				</div><div class="col-lg-5"></div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">員工編號:</label>
				<div class="col-lg-6">
					<input type="text" name="emp_id" value="E00001">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">現金:</label>
				<div class="col-lg-6">
					<input type="text" name="cash" value="2000">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">禮卷:</label>
				<div class="col-lg-6">
					<input type="text" name="coupon" value="0">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">折讓:</label>
				<div class="col-lg-6">
					<input type="text" name="discount" value="0">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">零用金:</label>
				<div class="col-lg-6">
					<input type="text" name="coins" value="1500">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">交易額:</label>
				<div class="col-lg-6">
					<input type="text" name="deal_sum" value="2000">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">交易成本:</label>
				<div class="col-lg-6">
					<input type="text" name="deal_cost" value="1000">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">交易淨利:</label>
				<div class="col-lg-6">
					<input type="text" name="deal_profit" value="1000">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">交易次數:</label>
				<div class="col-lg-6">
					<input type="text" name="deal_num" value="3">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">班別小計:</label>
				<div class="col-lg-6">
					<input type="text" name="shift_sum" value="2000">
				</div>
			</div>
			<p>
			<div class="form-group">
				<div class="col-lg-1 col-lg-offset-5">
					<input type="button" value="新增" name="insert_shift" class="btn btn-theme02">
				</div>
				<div class="col-lg-5">
					<input type="reset" value="清除" class="btn btn-theme02">
				</div>
			</div>

	</form>
	</div>
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
<script>
	$(":button").click(function() {
		if("新增"==$(this).val()){
			$.ajax({
				type : "post",
				url : "insertShiftre.do",
				data : $(".insertShift").serialize(),
				success : function(data) {
					$(".rul").html(data);
					$("#shi_new").removeAttr("class");
					$("#shi_rel").attr("class", "active");
					$("#new").attr("class", "tab-pane fade");
					$("#result").attr("class", "tab-pane active");
				}
			});
		}
	});
</script>				
</body>
</html>