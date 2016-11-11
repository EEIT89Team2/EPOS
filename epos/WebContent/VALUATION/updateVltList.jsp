<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.valuation.model.*"%>
<%@ page import="com.valuation_detail.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	 	ValuationVO vltListVO = (ValuationVO) request.getAttribute("Vlt_id");
 		Valuation_DetailVO vltDetailVO = (Valuation_DetailVO) request.getAttribute("Vlt_id");
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

	<Form METHOD="post" action="VltListServlet.do" name="form1">
		<h2>修改報價單</h2>
		<input type="submit" value="存檔">
		<table border="0">
			<tr>
				<td>報價單編號：</td>
				<td><input type="text" name="vlt_id" value="${vltVO.vlt_id}" readOnly /></td>
				<td>報價日期：</td>
				<td><input type="date" name="vlt_date" value="<%= (vltListVO==null)? "2016-10-14" : vltListVO.getVlt_date()%>" /></td>
				<td>交貨日期：</td>
				<td><input type="date" name="delivery_date" value="<%= (vltListVO==null)? "2016-10-20" : vltListVO.getDelivery_date()%>" /></td>
				<td>總金額：</td>
				<td><input type="text" name="total_price" value="<%= (vltListVO==null)? "60000" : vltListVO.getTotal_price()%>" /></td>
				<td>狀態：</td>
				<td><input type="text" name="status" value="<%= (vltListVO==null)? "Y" : vltListVO.getStatus()%>" /></td>
			</tr>
			<tr>
				<td>修改人員：</td>
				<td><input type="text" name="key_id" value="<%= (vltListVO==null)? "E00003" : vltListVO.getKey_id()%>" /></td>
				<td>修改日期：</td>
				<td><input type="date" name="key_date" value="<%= (vltListVO==null)? "2016-10-14" : vltListVO.getKey_date()%>" /></td>
				<td>有效日期：</td>
				<td><input type="date" name="exp_date" value="<%= (vltListVO==null)? "2016-10-25" : vltListVO.getExp_date()%>" /></td>
				<td>備註：</td>
				<td><input type="text" name="remark" value="<%= (vltListVO==null)? "無" : vltListVO.getRemark()%>" /></td>
			</tr>
		</table>
		<h2>修改報價單明細</h2>
		<input type="button" value="新增明細" id="addNewDetail">
		<table border="0" id="table1">
<% 			int a= 0; %> 
			<c:forEach var="Vlt_list" items="${Vlt_list}">
<% 			 a= a + 1; %> 			
			<tr>
				<td>商品編號：</td>
				<td><input type="text" name="prod_id<%=a%>" value="${Vlt_list.prod_id}" /></td>
				<td>商品名稱：</td>
				<td><input type="text" name="prod_name<%=a%>" value="${Vlt_list.prod_name}" /></td>
				<td>商品數量：</td>
				<td><input type="text" name="prod_quantity<%=a%>" value="${Vlt_list.prod_quantity}" /></td>
				<td>商品價格：</td>
				<td><input type="text" name="prod_price<%=a%>" value="${Vlt_list.prod_price}" /></td>
				<td><input type='button' value='刪除' class='btn btn-danger'></input></td>
			</tr>
			</c:forEach>
		</table>
		<br> <input type="hidden" name="action" value="update">
			<!-- <input type="hidden" name="count" value=""> -->
	</Form>

	<script src="../js/jquery-3.1.1.min.js"></script>
	<script>
		//var count = form1.count.value;
		
		//使用on綁定網頁上刪除按鈕，完成刪除動作
	    $("#table1").on('click','.btn-danger',function(){
		 		$(this).parents("tr").remove();	
				//count = count -1;
				//form1.count.value = count;
	    })
		$(function() {
			var a = <%=a+1%>;
			$("#addNewDetail")
					.click(
							function() {
								$("#table1")
										.append("<tr><td>商品編號：</td><td><input type='text' name='prod_id"+a+"'/></td>"
										+ "<td>商品名稱：</td><td><input type='text' name='prod_name"+a+"'/></td>"
										+ "<td>商品數量：</td><td><input type='text' name='prod_quantity"+a+"'/></td>"
										+ "<td>商品價格：</td><td><input type='text' name='prod_price"+a+"'/></td></tr>")
										//+ "<td><input type='button' value='刪除' class='btn btn-danger'></input></td></tr>")
								a = a + 1;
								//count = count +1;
								//form1.count.value = count;
							})
		})
	</script>
	
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>