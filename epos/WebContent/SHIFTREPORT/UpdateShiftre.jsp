<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�ק���u���</title>
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
		font-family: '�L�n������';
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
		<div class="titlelist">�ק�</div>
	<div class="col-lg-12">
		<c:if test="${not empty errorMsgs}">
			<font color='red'>�Эץ��H�U���~:
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
				<label class="col-lg-1 col-lg-offset-2 control-label">���:</label>
				<div class="col-lg-1">
					<input type="date" name="Date" value="${shiftreVO.date}" readonly="readonly">
				</div>
				<label class="col-lg-1 control-label">�Z�O:</label>
				<div class="col-lg-1">
					<Select name="shift" class="form-control">
						<option value="${shiftreVO.shift}" selected="selected">${shiftreVO.shift}</option>
					</Select><br>
				</div>
				<label class="col-lg-1 control-label">���u�s��:</label>
				<div class="col-lg-1">			
					<input type="text" name="emp_id" value="${shiftreVO.emp_id}">
				</div>
				<label class="col-lg-1 control-label">�{��:</label>			
				<div class="col-lg-3">			
					<input type="text" name="cash" value="${shiftreVO.cash}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-2 control-label">§��:</label>
				<div class="col-lg-1">			
					<input type="text" name="coupon" value="${shiftreVO.coupon}">
				</div>
				<label class="col-lg-1 control-label">����:</label>
				<div class="col-lg-1">			
					<input type="text" name="discount" value="${shiftreVO.discount}">
				</div>
				<label class="col-lg-1 control-label">�s�Ϊ�:</label>
				<div class="col-lg-1">			
					<input type="text" name="coins" value="${shiftreVO.coins}">
				</div>
				<label class="col-lg-1 control-label">����B:</label>
				<div class="col-lg-3">			
					<input type="text" name="deal_sum" value="${shiftreVO.deal_sum}">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-2 control-label">�������:</label>
				<div class="col-lg-1">			
					<input type="text" name="deal_cost" value="${shiftreVO.deal_cost}">
				</div>
				<label class="col-lg-1 control-label">����b�Q:</label>
				<div class="col-lg-1">		
					<input type="text" name="deal_profit" value="${shiftreVO.deal_profit}">
				</div>
				<label class="col-lg-1 control-label">�������:</label>
				<div class="col-lg-1">			
					<input type="text" name="deal_num" value="${shiftreVO.deal_num}">
				</div>
				<label class="col-lg-1 control-label">�Z�O�p�p:</label>
				<div class="col-lg-3">			
					<input type="text" name="shift_sum" value="${shiftreVO.shift_sum}">
				</div>
			</div>

			<p class="distance">			
			<div class="form-group">
				<div class="col-lg-1 col-lg-offset-5">
					<input type="button" value="�e�X�ק�" class="btn btn-theme02">
				</div>
				<div class="col-lg-5">
					<input type="reset" value="�M��" class="btn btn-theme02">
				</div>
			</div>

		</form>
</div>
<!-- --------------------------------------------------------------�{���}�l�B---------------------------------------------------------- -->
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