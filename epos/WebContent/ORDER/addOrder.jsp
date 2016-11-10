<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.order_detail.model.*"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<%
	 	OrderVO orderVO = (OrderVO) request.getAttribute("ord_id");
		Order_DetailVO ord_detail  = (Order_DetailVO) request.getAttribute("ord_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

	<Form METHOD="post" action="addOrder.do" name="form1">
		<h2>新增訂單</h2>
		<input type="submit" value="新增">
		<table border="0">
			<tr>
				<td>訂單編號：</td>
				<td><input type="text" name="ord_id" readOnly /></td>
				<td>訂單日期：</td>
				<td><input type="date" name="ord_date" value="<%= (orderVO==null)? "2016-10-14" : orderVO.getOrd_date()%>" /></td>
				<td>發票號碼：</td>
				<td><input type="text" name="invoice_id" value="<%= (orderVO==null)? "RX53003006" : orderVO.getInvoice_id()%>" /></td>
				<td>統一編號：</td>
				<td><input type="text" name="ord_um" value="<%= (orderVO==null)? "" : orderVO.getOrd_um()%>" /></td>
				<td>身分：</td>
				<td><input type="text" name="discount" value="<%= (orderVO==null)? "一般" : orderVO.getDiscount()%>" /></td>
			</tr>
			<tr>
				<td>實際金額：</td>
				<td><input type="text" name="total_price" value="<%= (orderVO==null)? "57800" : orderVO.getTotal_price()%>" /></td>
				<td>折價券金額：</td>
				<td><input type="text" name="cpon_dollar" value="<%= (orderVO==null)? "500" : orderVO.getCpon_dollar()%>" /></td>
				<td>應付金額(現金)：</td>
				<td><input type="text" name="cash" value="<%= (orderVO==null)? "57300" : orderVO.getCash()%>" /></td>
			</tr>
			<tr>
			<td>修改人員編號：</td>
				<td><input type="text" name="key_id" value="<%= (orderVO==null)? "E00003" : orderVO.getKey_id()%>" /></td>
				<td>建檔日期：</td>
				<td><input type="date" name="key_date" value="<%= (orderVO==null)? "2016-10-14" : orderVO.getKey_date()%>" /></td>
				<td>班別：</td>
				<td><input type="text" name="shift" value="<%= (orderVO==null)? "A" : orderVO.getShift()%>" /></td>
			</tr>
			<tr>
			<td>備註：</td>
				<td><textarea cols="30" rows="5" name="remark" value="<%= (orderVO==null)? "無" : orderVO.getRemark()%>" /></textarea></td>
			</tr>
		</table>
		<h2>新增訂單明細</h2>
		<input type="button" value="新增明細" id="addNewDetail">
		<table border="0" id="table1">
			<tr>
				<td>商品編號：</td>
				<td><input type="text" name="prod_id1" value="<%= (ord_detail==null)? "P00001" : ord_detail.getProdVO().getProd_id()%>" /></td>
				<td>商品名稱：</td>
				<td><input type="text" name="prod_name1" value="<%= (ord_detail==null)? "iphone 6 16G 黑色" : ord_detail.getProd_name()%>" /></td>
				<td>商品數量：</td>
				<td><input type="text" name="prod_quantity1" value="<%= (ord_detail==null)? "2" : ord_detail.getProd_quantity()%>" /></td>
				<td>商品價格：</td>
				<td><input type="text" name="prod_price1" value="<%= (ord_detail==null)? "20000" : ord_detail.getProd_price()%>" /></td>
				<td><input type='button' value='刪除' class='btn btn-danger'></input></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert">
	</Form>

<!-- 	<script src="../js/jquery-3.1.1.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script> 
!window.jQuery && document.write("<script src='<c:url value='../resources/js/jquery-3.1.1.min.js'/>'><\/script>")
 </script>
	<script>
		//練習五使用on綁定網頁上刪除按鈕，完成刪除動作
	    $("#table1").on('click','.btn-danger',function(){
		 		 $(this).parents("tr").remove();		 
	    })
		$(function() {
			var a = 2;
			$("#addNewDetail")
					.click(
							function() {
								$("#table1")
										.append("<tr><td>商品編號：</td><td><input type='text' name='prod_id"+a+"'/></td>"
										+ "<td>商品名稱：</td><td><input type='text' name='prod_name"+a+"'/></td>"
										+ "<td>商品數量：</td><td><input type='text' name='prod_quantity"+a+"'/></td>"
										+ "<td>商品價格：</td><td><input type='text' name='prod_price"+a+"'/></td>"
										+ "<td><input type='button' value='刪除' class='btn btn-danger'></input></td></tr>")
								a = a + 1;
							})
		})
	</script>
	
	<hr><hr>
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
<%-- 	<a href="<c:out value='${pageContext.request.contextPath}'/>/Index4">回首頁</a> --%>
</body>
</html>