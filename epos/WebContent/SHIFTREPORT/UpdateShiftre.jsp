<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改員工資料</title>
<style>
/* nav */
	.navbar-default{
		background: #E6F9AF;
		border-color:#E6F9AF;
		border-radius: 8px;
	}
/* background */
 	.main{ 
  		height: 800px;  
 		border-radius: 8px; 
 		background:	#A0DBB9; 
 	}
/*  title	 */
 	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #384E77;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
		
	.distance{
		margin: 30px;	
	}
	
	.form-horizontal .control-label {
	    text-align: right;
	}
</style>
</head>
<body>
		<div class="titlelist">修改</div>
	<div class="col-lg-12">
		<c:if test="${not empty errorMsgs}">
			<font color='red'>請修正以下錯誤:
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li>${message}</li>
					</c:forEach>
				</ul>
			</font>
		</c:if>
		
		<form method="post" action="updateShiftre.do" class="updateShi form-horizontal" role="form">
		<p class="distance">
			
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-2 control-label">日期:</label>
				<div class="col-lg-1">
					<input type="date" name="Date" value="${shiftreVO.date}" readonly="readonly">
				</div>
				<label class="col-lg-1 control-label">班別:</label>
				<div class="col-lg-1">
					<Select name="shift" class="form-control">
						<option value="${shiftreVO.shift}" selected="selected">${shiftreVO.shift}</option>
					</Select><br>
				</div>
				<label class="col-lg-1 control-label">員工編號:</label>
				<div class="col-lg-1">			
					<input type="text" name="emp_id" value="${shiftreVO.emp_id}">
				</div>
				<label class="col-lg-1 control-label">現金:</label>			
				<div class="col-lg-3">			
					<input type="text" name="cash" value="${shiftreVO.cash}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-2 control-label">禮卷:</label>
				<div class="col-lg-1">			
					<input type="text" name="coupon" value="${shiftreVO.coupon}">
				</div>
				<label class="col-lg-1 control-label">折讓:</label>
				<div class="col-lg-1">			
					<input type="text" name="discount" value="${shiftreVO.discount}">
				</div>
				<label class="col-lg-1 control-label">零用金:</label>
				<div class="col-lg-1">			
					<input type="text" name="coins" value="${shiftreVO.coins}">
				</div>
				<label class="col-lg-1 control-label">交易額:</label>
				<div class="col-lg-3">			
					<input type="text" name="deal_sum" value="${shiftreVO.deal_sum}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-2 control-label">交易成本:</label>
				<div class="col-lg-1">			
					<input type="text" name="deal_cost" value="${shiftreVO.deal_cost}">
				</div>
				<label class="col-lg-1 control-label">交易淨利:</label>
				<div class="col-lg-1">		
					<input type="text" name="deal_profit" value="${shiftreVO.deal_profit}">
				</div>
				<label class="col-lg-1 control-label">交易次數:</label>
				<div class="col-lg-1">			
					<input type="text" name="deal_num" value="${shiftreVO.deal_num}">
				</div>
				<label class="col-lg-1 control-label">班別小計:</label>
				<div class="col-lg-3">			
					<input type="text" name="shift_sum" value="${shiftreVO.shift_sum}">
				</div>
			</div>

			<p class="distance">			
			<div class="form-group">
				<div class="col-lg-1 col-lg-offset-5">
					<input type="button" value="送出修改" class="btn btn-theme02">
				</div>
				<div class="col-lg-5">
					<input type="reset" value="清除" class="btn btn-theme02">
				</div>
			</div>

		</form>
</div>
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->
	<script type="text/JavaScript">
		$(document).ready(function() {
			$(":button").on('click', function() {
				$.ajax({
					type : "post",
					url : "updateShiftre.do",
					data : $(".updateShi").serialize(),
					success : function(data) {
						$(".rul").html(data);

					}
				});
			});
		});
	</script>	

</body>
</html>