<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>shiftCharts</title>
</head>
<body>
	<button type="button" class="btn btn-primary" onclick="testEvent(this)">
		<i class="fa fa-check"></i>
	</button>
	
	<select size="1"class="form-control refresh">

	</select>
	
	<div class="charts"></div>
</body>
<script>
// 	$(document).ready(function() {
		
		function testEvent(event) {

				$.ajax({
					"type" : "post",
					"url" : "alljson.do",
					"data" : {},
					"success" : function(data) {
						var sel = $('select');
					$.each($.parseJSON(data), function() {
							var Date = this.Date;
							var String = this.Shift;
							var deal_sum = this.deal_sum;
							var discount = this.discount;
							var shift_sum = this.shift_sum;
							var opt = $("<option>");
							opt.append(Date);
							sel.append(opt);
						})
					}
				});

		}	
// 	});
</script>	
</html>