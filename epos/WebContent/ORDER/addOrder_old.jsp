<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>addOrder</title>
<script>
//計算商品明細總金額
function count_total_prod_price(){
	//商品明細總金額=單價*數量
	var prod_price = document.getElementById("prod_price").value;//取得單價
	var prod_quantity = document.getElementById("prod_quantity").value;//取得數量
	
	document.getElementById("total_prod_price").value = prod_price*prod_quantity;
	
}

//計算實際金額
/*function count_total_price(){
	var total_price = "${OrderVO.total_price}";//由於第一次新增訂單時會回傳OrderVO，若還要新增第二筆訂單明細時，需由先取得目前資料庫中OrderVO中的總金額來計算
	var total_prod_price = document.getElementById("total_prod_price").value;
	
	if(total_price == "")//給初始值，不能拿空值來計算
		total_price = 0;
	
	total_price = parseFloat(total_price) +  parseFloat(total_prod_price);
	
	document.getElementById("total_price").value = total_price;
	
}*/

//計算應付金額(現金)
/*function countCash(){
	var cpon_dollar = document.getElementById("cpon_dollar").value;
	
	if(cpon_dollar == "")//給初始值，不能拿空值來計算
		cpon_dollar = 0;
	
	var total_price = document.getElementById("total_price").value;
	document.getElementById("cash").value = total_price - cpon_dollar;
}*/

</script>
</head>
<body>
<form action="Order.do" method="post" name=form><!-- 1.新增訂單 -->
		<input type="hidden" name="action_type" value="">
		<input	type="button" value="新增訂單" onclick="window.location.href ='addOrder.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="刪除本訂單"><!-- 2.刪除訂單 -->
		<hr>
		
		<h2>訂單主檔:</h2>
		訂單編號:<input type="text" id="ord_id" name="ord_id" value="${OrderVO.ord_id}" readOnly>
		訂單日期:<input type="date" id="ord_date" name="ord_date" value="${OrderVO.ord_date}"/>
 		發票號碼:<input type="text" id="invoice_id" name="invoice_id" value="${OrderVO.invoice_id}"/>
		統一編號:<input type="text" id="ord_um" name="ord_um" value="${OrderVO.ord_um}"/>
		<br>
<%-- 		會員ID:<input type="text" id="mem_id" name="mem_id" value="${OrderVO.mem_id}" readOnly/> --%>
		身分:<input type="text" id="discount" name="discount" value="${OrderVO.discount}"/>
		實際金額:<input type="text" id="total_price" name="total_price" value="${OrderVO.total_price}" readOnly />
		折價券金額:<input type="text" id="cpon_dollar" name="cpon_dollar" value="${OrderVO.cpon_dollar}" />
		應付金額(現金):<input type="text" id="cash" name="cash" value="${OrderVO.cash}" readOnly /><br>
<%-- 		狀態:<input type="text" id="status" name="status" value="${OrderVO.status}"/> --%>
<%-- 		備註:<input type="text" id="remark" name="remark" value="${OrderVO.remark}"/> --%>
		備註:<br>
		<textarea cols="50" rows="5" id="remark" name="remark"/>${OrderVO.remark}</textarea>
		<br>
		修改人員編號:<input type="text" id="key_id" name="key_id" value="${OrderVO.key_id}"/>
		建檔日期:<input type="date" id="key_date" name="key_date" value="${OrderVO.key_date}"/>
		班別:<input type="text" id="shift" name="shift" value="${OrderVO.shift}"/>
		<hr>
		
		<h2>新增/編輯訂單明細:</h2>
		商品ID:<input type="text" id="prod_id" name="prod_id" value="${DetailVOEdit.prod_id}" />
		商品名稱:<input type="text" id="prod_name" name="prod_name" value="${DetailVOEdit.prod_name}" />
		單價:<input type="text" id="prod_price" name="prod_price" value="${DetailVOEdit.prod_price}" onblur="count_total_prod_price();" />
		商品數量:<input type="text" id="prod_quantity" name="prod_quantity" value="${DetailVOEdit.prod_quantity}" onblur="count_total_prod_price()" />
		總價:<input type="text" id="total_prod_price" name="total_prod_price" value="${DetailVOEdit.prod_quantity * DetailVOEdit.prod_price}" readOnly />
			
			 <input	type="submit" value="新增" onclick="form.action_type.value = 'insert';"><!-- .新增單筆明細(servlet跑insert) -->
			 <input	type="submit" value="存檔" onclick="form.action_type.value = 'update';"><!-- .修改單筆明細(servlet跑update) -->
		<hr>
		<h2>訂單明細:</h2>
	<table border='1' bordercolor='#CCCCFF' width='800'>
		<tr>
			<th>訂單編號</th>
			<th>商品代碼</th>
			<th>商品名稱</th>
			<th>單價</th>
			<th>數量</th>
			<th>總價</th>
			<th>編輯</th>
			<th>刪除</th>
		</tr>
			<input type="hidden" name="selected_prod_id"><!-- 預設先放空值，隨著點到哪一筆編輯或刪除時，再把該筆的 prod_id放進來，動作放在編輯或刪除的onclick-->
			<c:forEach var="OrderDetailVO" items="${detail_list}">
			<tr align='center' valign='middle'>
				<td>${OrderDetailVO.ord_id}</td>
				<td>${OrderDetailVO.prod_id}</td>
				<td>${OrderDetailVO.prod_name}</td>
				<td>${OrderDetailVO.prod_price}</td>
				<td>${OrderDetailVO.prod_quantity}</td>
				<td>${OrderDetailVO.prod_quantity*OrderDetailVO.prod_price}</td>
				<td>
					<input type="submit" value="編輯" onclick="form.action_type.value = 'viewEdit';form.selected_prod_id.value = '${OrderDetailVO.prod_id}';"><!-- 3.點選單筆明細 -->
				</td>
				<td>
					<input type="submit" value="刪除" onclick="form.action_type.value = 'delete';form.selected_prod_id.value = '${OrderDetailVO.prod_id}';"><!-- 5.刪除單筆明細 -->
				</td>
			</tr>
			</c:forEach>
	</table>
	<hr>
</form>
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>