<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>全部商品基本資料</title>

</head>
<body>

		<table border="2">
		<tr>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>廠商編號</th>
			<th>分類</th>
			<th>定價</th>
			<th>成本</th>
			<th>庫存</th>
			<th>安全庫存</th>
			<th>規格</th>
			<th>商品照片</th>
			<th>備註</th>
			<th>是否上架</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		
<c:forEach var="list" items="${list}" varStatus="count">
		<form method="post" action="updateDeleteProd.do">
		<tr>
			<td>${list.prod_id}</td>
			<td>${list.prod_name}</td>
			<td>${list.com_id}</td>
			<td>${list.prod_group}</td>
			<td>${list.prod_mkprice}</td>
			<td>${list.prod_cost}</td>
			<td>${list.prod_stock}</td>
			<td>${list.prod_q_safty}</td>
			<td>${list.prod_spec}</td>
			<td><img alt="尚無照片" src="data:image/gif;base64,${list.picture}"></td>
			<td>${list.remark}</td>
			<td>${list.status}</td>
			<td><input type="button" name="action" value="update" target="${list.prod_id}" ></td>
			<td><input type="button" name="action" value="delete" class="delete" target="${list.prod_id}"></td>
		</tr>
</form>	
		
</c:forEach>
	</table>
	
	<script type="text/JavaScript">
	$(document).ready(function() {
		$(":button").on('click',function(){
			if($(this).attr('value')=="delete"){
				$.ajax({
					type : "post",
					url : "updateDeleteProd.do",
					data : {
							prod_id:$(this).attr('target'),
							action:"delete"
							},
					success :function(data) {
						$("#rul").html(data);
						$("#chg_result").attr("class","active");
						$("#result").attr("class","tab-pane active");
					}	
				});
			}else if($(this).attr('value')=="update"){
				$.ajax({
					type : "post",
					url : "updateDeleteProd.do",
					data : {
							prod_id:$(this).attr('target'),
							action:"update"
							},
					success :function(data) {
						$("#rul").html(data);
					}
				});
			}
		});
	});

	</script>	

</body>
</html>