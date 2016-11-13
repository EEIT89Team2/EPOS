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
</head>
<body>
<div class="col-lg-4">
					<div class="form-panel">
						<h4 class="mb">
							<i class="fa fa-angle-right"></i> 新增
						</h4>
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
						<form method="post" action="insertShiftre.do" class="insertShift">
							<p>新增班別報表</p>
							日期<input type="date" name="Date"><br> 
							班別<Select name="shift">
								<option value="A">A</option>
								<option value="B">B</option>
							</Select><br> 
							員工編號 <input type="text" name="emp_id" value="E00001"><br>
							現金<input type="text" name="cash" value="2000"><br>
							禮卷<input type="text" name="coupon" value="0"><br> 
							折讓<input type="text" name="discount" value="0"><br> 
							零用金<input type="text" name="coins" value="1500"><br> 
							交易額<input type="text" name="deal_sum" value="2000"><br> 
							交易成本<input type="text" name="deal_cost" value="1000"><br> 
							交易淨利<input type="text" name="deal_profit" value="1000"><br>
							交易次數<input type="text" name="deal_num" value="3"><br>
							班別小計<input type="text" name="shift_sum" value="2000"><br>
							<input type="button" value="新增" name="insert_shift">
						</form>
					</div>
				</div>
<script>

	$(":button").click(function() {
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

	});
</script>				
</body>
</html>