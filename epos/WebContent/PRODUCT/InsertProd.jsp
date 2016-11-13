<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>InsertProd</title>
</head>
<body>
<!-- 				錯誤表列 -->
	<c:if test="${not empty param.message}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${param.message}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
		<p>新增商品</p>
	<form method="post" action="insertProd.do"
		enctype="multipart/form-data" id="create_prod">
		商品名稱<input type="text" name="prod_name" value="LG 液晶電視 23吋"><br>
		廠商編號<input type="text" name="com_id" value="C00001"><br>
		分類 <input type="text" name="prod_group" value="家電"><br>
		定價<input type="text" name="prod_mkprice" value="6999"><br>
		成本<input type="text" name="prod_cost" value="4000"><br>
		庫存<input type="text" name="prod_stock" value="3"><br>
		安全庫存<input type="text" name="prod_q_safty" value="1"><br>
		規格<input type="text" name="prod_spec" value="Full HD"><br>
		商品照片<input type="file" name="picture"><br> 備註<input
			type="text" name="remark" value="檔期促銷"><br> <input
			type="submit" value="新增"> <input type="hidden"
			name="status" value="Y">
	</form>
<script type="text/JavaScript">
$(document).ready(function() {
	
		$("#create_prod").on('submit',(function(e) {
		   	e.preventDefault();
		   	//序列化表单   
		      var serializeData = $(this).serialize();
		      var create_prod = $("#create_prod");

		      $(this).ajaxSubmit({
		    	  
		           type:'POST',
		           url: create_prod.attr("action"),
// 		           dataType: 'json', 
		           data: serializeData,            
   
		           //attention!!!   
		           contentType: false,      
		           cache: false,             
		           processData:false,      
		           success:function(){
		        	   $.ajax({
							"type" : "post",
							"url" : "getAllProd.do",
							"data" : {},
							"success" : function(data) {
					        	   $("#rul").html(data);
									$("#chg_new").removeAttr("class");
									$("#chg_result").attr("class","active");
									$("#new").attr("class","tab-pane fade");
									$("#result").attr("class","tab-pane active");
							},
						});
		           }
// 		           beforeSubmit: function() {
		           		//上传图片之前的处理   
// 		           },
// 		           uploadProgress: function (event, position, total, percentComplete){ 
// 		               //在这里控制进度条   
// 		           },
// 		           error:function(data){
// 		               alert('上传图片出错');
// 		        	   $("#rul").html(data);
// 						$("#chg_new").removeAttr("class");
// 						$("#chg_result").attr("class","active");
// 						$("#new").attr("class","tab-pane fade");
// 						$("#result").attr("class","tab-pane active");
// 		           }
		       })
		   }))
})
</script>
</body>
</html>