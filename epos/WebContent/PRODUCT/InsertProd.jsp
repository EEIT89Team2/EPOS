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
<style>
	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #99CCCC;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	.distance{
		margin: 30px;	
	}
	
	.btn-theme02{
		float:center			
	}	
</style>
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
	
	<div class="titlelist">新增商品</div>
	<div class="col-lg-12">
	<p class="distance">
		<form method="post" action="insertProd.do" enctype="multipart/form-data" id="create_prod" class="form-horizontal" role="form">
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">商品名稱:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_name" value="LG 液晶電視 23吋">
				</div>	
			</div>	
			<div class="form-group">	
				<label class="col-lg-1 col-lg-offset-5 control-label">廠商編號:</label>
				<div class="col-lg-6">
					<input type="text" name="com_id" value="C00001">
				</div>	
			</div>	
			<div class="form-group">	
				<label class="col-lg-1 col-lg-offset-5 control-label">分類:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_group" value="家電">
				</div>	
			</div>	
			<div class="form-group">	
				<label class="col-lg-1 col-lg-offset-5 control-label">定價:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_mkprice" value="6999">
				</div>	
			</div>	
			<div class="form-group">	
				<label class="col-lg-1 col-lg-offset-5 control-label">成本:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_cost" value="4000">
				</div>	
			</div>	
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">庫存:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_stock" value="3">
				</div>	
			</div>	
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">安全庫存:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_q_safty" value="1">
				</div>	
			</div>	
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">規格:</label>
				<div class="col-lg-6">
					<input type="text" name="prod_spec" value="Full HD">
				</div>	
			</div>	
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">商品照片:</label>
				<div class="col-lg-6">
					<input type="file" name="picture"> 
				</div>	
			</div>	
			<div class="form-group">
				<label class="col-lg-1 col-lg-offset-5 control-label">備註:</label>
				<div class="col-lg-6">
					<input type="text" name="remark" value="檔期促銷"> 
				</div>	
			</div>	
			<div class="form-group">
				<div class="col-lg-1  col-lg-offset-5">
					<input type="submit" value="新增" class="btn btn-warning"> 
				</div>
				<div class="col-lg-6">
					<input type="reset" value="清除" class="btn btn-warning">
				</div>	
				<input type="hidden" name="status" value="Y">
			</div>	
		</form>
	</div>
	<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->	
<script type="text/JavaScript">

	$(document).ready(function() {

		$("#create_prod").on('submit', (function(e) {
			e.preventDefault();
			//序列化表单   
			var serializeData = $(this).serialize();
			var create_prod = $("#create_prod");

			$(this).ajaxSubmit({
				type : 'POST',
				url : create_prod.attr("action"),
				data : serializeData,

				//attention!!!   
				contentType : false,
				cache : false,
				processData : false,
				success : function() {
					$.ajax({
						type : "post",
						url : "getAllProd.do",
						data : {},
						success : function(data) {
							$(".result_content").html(data);
							$("#chg_new").removeAttr("class");
							$("#chg_result").attr("class", "active");
							$("#new_Prod").attr("class", "tab-pane fade");
							$("#result_Prod").attr("class", "tab-pane active");
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