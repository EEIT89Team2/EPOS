<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update</title>
</head>
<body>

<form action="Order.do" method="post">
		訂單編號:<input type="text" id="ord_id" name="ord_id" />
		訂單日期:<input type="date" id="ord_date" name="ord_date" value="2016-10-03"/>
		發票號碼:<input type="text" id="invoice_id" name="invoice_id" value="RX53003011"/>
		統一編號:<input type="text" id="ord_um" name="ord_um" value="04121001"/>
		<br>
		商品ID:<input type="text" id="prod_id" name="prod_id" value="P00002"/>
		商品名稱:<input type="text" id="prod_name" name="prod_name" value="iphone 6 32G 黑色"/>
		商品數量:<input type="text" id="prod_quantity" name="prod_quantity" value="3"/>
		總價:<input type="text" id="prod_price" name="prod_price" value="99999"/>
		<br>
		身分:<input type="text" id="discount" name="discount" value="員工"/>
		實際金額:<input type="text" id="total_price" name="total_price" value="99999"/>
		折價券金額:<input type="text" id="cpon_dollor" name="cpon_dollor" value="4999"/>
		現金:<input type="text" id="cash" name="cash" value="95000"/>
		狀態:<input type="text" id="status" name="status" value="N"/>
		備註:<input type="text" id="remark" name="remark" value="哈哈"/>
		班別:<input type="text" id="shift" name="shift" value="A"/><br>
		修改人員編號:<input type="text" id="key_id" name="key_id" value="E00003"/>
		建檔日期:<input type="date" id="key_date" name="key_date" value="2016-10-03"/>
		<br>
		<input type="hidden" name="action" value="update">
		 <input	type="submit" value="修改" />


	</form>	

	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>