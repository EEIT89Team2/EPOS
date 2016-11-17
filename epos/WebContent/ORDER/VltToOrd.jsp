<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.valuation.model.ValuationVO"%>
<%@ page import="com.valuation_detail.model.Valuation_DetailVO"%>
<%@ page import="com.product.model.ProdVO"%>

<%
	session.getAttribute("LoginOK");
	List detailList = (List)request.getAttribute("detailList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>報價單轉訂單</title>

</head>
<body>

	<h2>訂單</h2>
	<form method="post" action="../ORDER/addOrder.do">
		<table border="1">

			<c:forEach var="list" items="${list}" varStatus="count">
				<tr>
					<td>報價單號：<input type="text" name="vlt_id" value="${list.vlt_id}" readonly/></td>	
					<td>實際金額：<input type="text" value="${list.total_price}" readonly />
							   <input type="hidden" name="total_price_temp" value="${list.total_price}" />
							   <input type="hidden" name="cash" value="${list.total_price}" />
					<td>狀態：<input type="text" value="${list.status}" readonly /></td>
<%-- 					<td>交貨日期：<input type="date" name="delivery_date" value="${list.delivery_date}" /></td> --%>
<%-- 					<td>有效日期：<input type="date" name="exp_date" value="${list.exp_date}" /></td> --%>
				</tr>
				<tr>
					</td>
					<td>備註：<input type="text" value="${list.remark}" readonly /></td>			
					<td>修改人員：<input type="text" value="${LoginOK.emp_id}"  /></td>
					<td>建檔日期：<input type="date" name="key_date" value="${list.key_date}"  /></td>
					<td>班別：<input type="text" value="${SHIFT}" readonly /></td>
					<input type="hidden" name="ord_um" value="" />
					<input type="hidden" name="cpon_id" value="" />
					<input type="hidden" name="cpon_dollar" value="" />
					
				</tr>
			</c:forEach>
		</table>

		<h2>訂單明細</h2>
		<table border="1">
			<tr>
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>商品數量</th>
					<th>商品價格</th>
				</tr>
		
			<%for(int i=0;i<detailList.size();i++){ 
				Valuation_DetailVO valuation_DetailVO = (Valuation_DetailVO)detailList.get(i);
				ProdVO prodVO = (ProdVO)valuation_DetailVO.getProdVO();
				
			%>
<%-- 			<c:forEach var="list" items="${detailList}" varStatus="count"> --%>			
				<tr>
					<td><input type="text" name="prod_id<%=i+1%>" value="<%=prodVO.getProd_id()%>"
						readonly /></td>
					<td><input type="text" name="prod_name<%=i+1%>" value="<%=valuation_DetailVO.getProd_name()%>" readonly /></td>
					<td><input type="text" name="prod_quantity<%=i+1%>" value="<%=valuation_DetailVO.getProd_quantity()%>"
						readonly /></td>
					<td><input type="text" name="prod_price<%=i+1%>" value="<%=valuation_DetailVO.getProd_price()%>"
						readonly /></td>

				</tr>
<%-- 			</c:forEach> --%>
			<%} %>
		</table>
					


		<center>
			<table>
				<tr>
					<td><input type="button" name="action" value="返回"
						onclick="history.back();"></td>
					<td><input type="submit" value="結帳"></td>
				</tr>
			</table>
		</center>

	</form>
</body>
</html>