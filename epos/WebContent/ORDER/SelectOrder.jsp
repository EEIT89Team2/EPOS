<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢訂單</title>
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

	<h1>訂單</h1>

	<form method="post" action="getOrderDate.do">

		<table border="1">
			<tr>
				<th>日期範圍(起)</th>
				<th>日期範圍(迄)</th>
			</tr>
			<tr>
				<td><input type="date" name="dateBegin" value="2016-09-14"></td>
				<td><input type="date" name="dateEnd" value="2016-10-16"></td>
			</tr>
		</table>
		<br> <input type="submit" value="送出" />
		 	<input type="hidden" name="action" value="SelectByDate">

	</form>

	<hr>
	<hr>
	<h3>查詢全部訂單</h3>
	<form method="post" action="getAllOrd.do">
		<input type="submit" value="查詢"> <input type="hidden"
			name="action" value="getAll">

	</form>

	<hr>
	<hr>
	<h3>依訂單編號查詢</h3>


	<form method="post" action="getByOrd_id.do">
		<table border="1">
			<tr>
				<th>訂單編號</th>
				<th>查詢</th>
			</tr>
			<tr>
				<td><input type="text" name="ord_id"></td>
				<td><input type="submit" value="送出"></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="getByOrd_id">
	</form>


	<hr>
	<hr>
	<h3>依商品編號查詢</h3>


	<form method="post" action="Order.do">
		<table border="1">
			<tr>
				<th>商品編號</th>
				<th>查詢</th>
			</tr>
			<tr>
				<td><input type="text" name="prod_id"></td>
				<td><input type="submit" value="送出"></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="getByProd_id">
	</form>


	<hr><hr>
	
	<h3>依訂單編號修改</h3>
	<form method="post" action="setOrdStatus.do">
		<table border="1">
			<tr>
				<td>訂單編號：</td>
				<td><input type="text" name="ord_id"></td>
			</tr>
			<tr>
				<td>修改狀態：</td>
				<td><input type="text" name="status"></td>
			</tr>
		</table>
		<input type="submit" value="修改">
		 <input type="hidden" name="action" value="setStatus">
	</form>

	<hr>
	<hr>
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

	<!-- <hr><hr> -->
	<!-- <h3>依訂單編號查詢</h3> -->
	<!-- <form method="post" action="VltListServlet.do" > -->
	<!-- <table border="1"> -->
	<!-- 	<tr> -->
	<!-- 		<th>訂單編號</th> -->
	<!-- 		<th>查詢</th> -->
	<!-- 	</tr> -->
	<!-- 	<tr> -->
	<!-- 		<td><input type="text" name="ord_id"></td> -->
	<!-- 		<td><input type="submit"  value="送出"></td> -->
	<!-- 	</tr> -->
	<!-- </table> -->
	<!-- <input type="hidden" name="action" value="getByOrd_id"> -->
	<!-- </form> -->


</body>
</html>