<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢採購單</title>
</head>
<body>

<h3>查詢全部採購單</h3>
<form method="post" action="getAllPur.do" >
<input type="submit"  value="查詢">

</form>

<hr><hr>
<h3>依採購單編號查詢</h3>


<form method="post" action="getOnePurforDisplay.do" >
<table border="1">
	<tr>
		<th>採購單編號</th>
		<th>查詢</th>
	</tr>
	<tr>
		<td><input type="text" name="pur_id"></td>
		<td><input type="submit"  value="送出"></td>
	</tr>
</table>

</form>


	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 

</body>
</html>