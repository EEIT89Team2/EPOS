<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>修改商品資料</title>
</head>
<body>
<h2>修改商品資料</h2>
	<section id="container"> <section class="wrapper">
	<div class="row mt">
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form method="post" action="updateProd.do" enctype="multipart/form-data" class="upd_prod">

商品編號<input type="text" name="prod_id" value="${prodVO.prod_id}" readonly="readonly" style="color: gray;" ><br>
商品名稱        <input type="text" name="prod_name" value="${prodVO.prod_name}"><br>
廠商編號        <input type="text" name="com_id" value="${prodVO.com_id}"><br>
分類        <input type="text" name="prod_group"value="${prodVO.prod_group}"><br>
定價    <input type="text" name="prod_mkprice" value="${prodVO.prod_mkprice}"><br>
成本        <input type="text" name="prod_cost" value="${prodVO.prod_cost}"><br>
庫存        <input type="text" name="prod_stock" value="${prodVO.prod_stock}"><br>
安全庫存        <input type="text" name="prod_q_safty" value="${prodVO.prod_q_safty}"><br>
規格        <input type="text" name="prod_spec" value="${prodVO.prod_spec}"><br>

商品照片<img alt="尚無名片" src="data:image/gif;base64,${prodVO.picture}">
<input type="hidden" name="picture" value="${prodVO.picture}">
<input  type="file" name="newPicture"><br>
備註    <input type="text" name="remark" value="${prodVO.remark}"><br>
是否上架<input type="text" name="status" value="${prodVO.status}"><br>
<input type="submit" value="修改">

</form>
	</div>

	</section> </section>
	
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
	<script type="text/JavaScript">

		
		$(".upd_prod").on('submit',function(e){
		   	e.preventDefault();
		   	var serializeData = $(this).serialize();

		    $(this).ajaxSubmit({
					type : "post",
					url : "updateProd.do",
					data : serializeData,
			        contentType: false,      
			        cache: false,             
			        processData:false, 
					success :function(data) {
						$("#rul").html(data);
					}	
				});

		});
		

	</script>
</html>