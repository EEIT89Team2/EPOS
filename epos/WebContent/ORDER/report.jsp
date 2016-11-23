<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script type="text/javascript">
    
	$(function () {
	    
	    var processed_json = new Array();   
	    $.getJSON("getdateprice.do",{}, function(data) {

// 	    	$.each($.parseJSON(data), function() {
// 					var n = this.ord_date;
// 					var vp = this.total_price;
// 					var opt = $("<option>");
// 	    			opt.append(vp);
// 	    			opt.val(n);
// 	    			sel.append(opt);
// 	    	})
	
// 	        // Populate series
	        for (i = 0; i < data.total_price.length; i++){
	            processed_json.push([data.total_price[i].key, parseInt(data.total_price[i].value)]);
	        }
	     
	        // draw chart
	        $('#container').highcharts({
	        chart: {
	            type: "column"
	        },
	        title: {
	            text: "Student data"
	        },
	        xAxis: {
	            allowDecimals: false,
	            title: {
	                text: "Branch of studies"
	            }
	        },
	        yAxis: {
	            title: {
	                text: "Number of students"
	            }
	        },
	        series: [{
	            data: processed_json
	        }]
	    }); 
	});
});
</script>
<title>折線圖</title>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<form action="getdatprice.do">
	
</form>
</body>
</html>