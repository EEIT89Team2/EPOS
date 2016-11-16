<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insertDic</title>
<style>
	.titlelist {
		font-family: '微軟正黑體';
		font-weight: bold;
		color: white;
		height: 35px;
		background: #F4A460;
		padding-left: 10px;
		font-size: 23px;
		border-radius: 2px;
	}
	
	p{
		margin: 30px;	
	}
	
	.btn-theme02{
		float:center			
	}	
</style>
</head>
<body>
		<div class="titlelist">新增</div>
				<div class="col-lg-12">
						<!--錯誤表列 -->
<%-- 						<c:if test="${not empty errorMsgs}"> --%>
<!-- 							<font color='red'>請修正以下錯誤: -->
<!-- 								<ul> -->
<%-- 									<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 										<li>${message}</li> --%>
<%-- 									</c:forEach> --%>
<!-- 								</ul> -->
<!-- 							</font> -->
<%-- 						</c:if> --%>
					<form class="form-inline" METHOD="post" ACTION="insertDisc.do" id="insert">
							<center>
								<p>
								<div class="form-group">
									<label for="dis_id">　折扣身分：</label>
									<input type=text class="form-control" name="dis_id" size="10" id="dis_id" >
								</div>
								<p>
								<div class="form-group">
									<label for="dis_price">　折扣%數：</label>
									<input type="text" class="form-control" name="dis_price" placeholder="1.0" maxlength="4" size="10" id="dis_price">
								</div>
								<p>
								<div class="veri_id"></div><div class="veri_price"></div>
								<div class="form-group">
									<div class="col-lg-6">
										<input type="button" value="送出新增" class="btn btn-warning">
									</div>	
									<div class="col-lg-5 col-lg-offset-1">
										<input type="reset" value="清除" class="btn btn-warning">
									</div>
								</div>
							</center>
					</form>
				</div>
<!-- --------------------------------------------------------------程式開始處---------------------------------------------------------- -->				
<script type="text/JavaScript">
$(document).ready(function() {
// ----------------------------------------	新增----------------------------------------		
	$(":button[value='送出新增']").click(function() {

		var insert = $("#insert");
		$.ajax({
			"type" : insert.attr("method"),
			"url" : insert.attr("action"),
			"data" : insert.serialize(),
			"success" : function(data) {
				$.ajax({
					"type" : "post",
					"url" : "allDisc.do",
					"data" : {},
					"success" : function(data) {
						$(".result_content").html(data);
						$("#result").attr("class","active");
						$("#import").removeAttr("class");
						$("#new_Dic").attr("class","tab-pane fade");
						$("#resolution_Dic").attr("class","tab-pane active");
					},
				});
			},
		});
	})
	
// ----------------------------------------	驗證----------------------------------------	
    $('#dis_id').blur(function(){
    	var rule1= /^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$/;
    	if(rule1.test($(this).val())){
    		$(".veri_id").text('')
//     		$(this).attr("border-color","")
    	}else if($(this).val().length==0){
    		$(".veri_id").text('折扣身分:請勿空白')
//     		$(this).css("border-color","red")
    	}else{
    		$(".veri_id").text('折扣身分:只能是中、英文字母、數字和_ , 且長度必須在1到10之間,且之間不可有空白')
//     		$(this).css("border-color","red")
    	}focus(function(){
//     		$(this).removeAttr("border-color")
//     		$(this).attr("border-color","")
        	})

    })
    
      $('#dis_price').blur(function(){
    	var rule1= /^[0-9.]{1,4}$/;
    	if(rule1.test($(this).val())){
    		$(".veri_price").text('')
//     		$(this).attr("border-color","")
    	}else if($(this).val().length==0){
    		$(".veri_price").text('折扣%數:請勿空白')
//     		$(this).css("border-color","red")
    	}else if(($(this).val()<0.01)||($(this).val()>1)){
    		$(".veri_price").text('折扣%數:數值必須在1到0.01之間')
//     		$(this).css("border-color","red")
    	}else{
    		$(".veri_price").text('折扣%數:只能是數字 ,且數值必須在1到0.01之間')
//     		$(this).css("border-color","red")
    	}focus(function(){
//     		$(this).removeAttr("border-color")
//     		$(this).attr("border-color","")
        	})

    })
	
})
</script>
</body>
</html>