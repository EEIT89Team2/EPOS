<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢詢價單</title>
</head>
<body>

<h3>查詢全部詢價單</h3>
<form method="post" action="getAllQuo.do" >
<input type="submit"  value="查詢">
<!-- <input type="hidden" name="action" value="getAllQuo"> -->

</form>

<hr><hr>
<h3>依詢價單編號查詢</h3>


<form method="post" action="getByQuo_id.do" >
<table border="1">
	<tr>
		<th>詢價單編號</th>
		<th>查詢</th>
	</tr>
	<tr>
		<td><input type="text" name="quo_id"></td>
		<td><input type="submit"  value="送出"></td>
	</tr>
</table>
<!-- <input type="hidden" name="action" value="getByQuo_id"> -->
</form>


<hr><hr>
<h3>依請購單編號查詢</h3>
<form method="post" action="getByReq_id.do" >
<table border="1">
	<tr>
		<th>請購單編號</th>
		<th>查詢</th>
	</tr>
	<tr>
		<td><input type="text" name="req_id"></td>
		<td><input type="submit"  value="送出"></td>
	</tr>
</table>
<!-- <input type="hidden" name="action" value="getByReq_id"> -->
</form>


	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>