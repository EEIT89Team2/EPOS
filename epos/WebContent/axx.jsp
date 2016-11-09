<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.returns.model.*"%>

<%
 	 ReturnItemsService rtnItemSvc = new ReturnItemsService();
     List<RtnItemsVO> list = rtnItemSvc.getAll();
     pageContext.setAttribute("list",list);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
<link href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/lineicons/style.css">
<!-- Custom styles for this template -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet">
<title>Insert title here</title>
<style>
    
.titledetail{
/*     	margin-top:auto; */
    	font-family: '微軟正黑體';
    	font-weight: bold;
    	color: white;
     	height: 35px;
     	background: #2B74C6;
     	font-size: 23px;
     	border-radius:2px;
    
}
</style>
</head>
<body>

<section id="container"> <section class="wrapper">
<!-- -----------------------------------------------------------查詢----------------------------------------------------------- -->
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- <font color='red'>請修正以下錯誤: -->
<!-- <ul> -->
<%-- 	<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 		<li>${message}</li> --%>
<%-- 	</c:forEach> --%>
<!-- </ul> -->
<!-- </font> -->
<%-- </c:if> --%>
	<div class="row mt">
	<div id="add" class="main">
	<div class="tab-content">
		<nav class="alert alert-info">
			<div>
		    	<a href="#add"><span class="glyphicon glyphicon-file"></span>新增</a>　　　
		    	<a href="#" onclick="window.open('RETURNS/searchItem.jsp', 'Yahoo', config='height=500,width=500')"><span class="glyphicon glyphicon-search"></span>查詢</a>　　　
		    	<a href="#"><span class="glyphicon glyphicon-pencil"></span>修改</a>　　　
		    	<a href="#"><span class="glyphicon glyphicon-remove"></span>刪除</a>　　　
		    	<a href="#"><span class="glyphicon glyphicon-print"></span>列印</a>　　　
		    	<a id="sub" href="#"><span class="glyphicon glyphicon-ok-sign">送出</span></a>　

		    </div>
		    
    	</nav>
    	</div>
		
			<FORM id="itemsform" METHOD="post" ACTION="insert_Item.do" class="form-inline">	
			
					<div class="form-group">
    					<label for="exampleInputName2">　商品名稱：</label>
    					<input type="text" name="prod_name" class="form-control">
  					</div>　　
  					<div class="form-group">
    					<label for="exampleInputName2">廠商代號：</label>
    					<input type="text" name="com_id" class="form-control" placeholder="C0001">
  					</div>　　
  					<div class="form-group">
    					<label for="exampleInputEmail2">退貨數量：</label>
    					<input type="text" name="re_quantity" class="form-control" placeholder="50">
  					</div>　　
  					<div class="form-group">
    					<label for="exampleInputName2">備註：</label>
    					<input type="text" name="remark" class="form-control">
  					</div>
			</FORM>
		
	</div>		
		
			
	
	
<!--   <fieldset style='width:800px'> -->
<!-- 	<legend>查詢</legend> -->
<!-- 	<table> -->
<!-- 	 <tr> -->
<!-- 	 <form action="getName_Item.do" method="post"> -->
<!-- 	 	<td style="text-align:right;">商品名稱</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type='text' name='prod_name'/> -->
<!-- 	 		<input type="submit" value="查詢"> -->
<!-- 	 		<input type="hidden" name="action" value="getName"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	 <form action="getComId.do" method="post"> -->
<!-- 	 	<td style="text-align:right;">廠商代號</td> -->
<!-- 	 	<td style="text-align:left;"> -->
<!-- 	 		<input type='text' name='com_id'/> -->
<!-- 	 		<input type="submit" value="查詢"> -->
<!-- 	 		<input type="hidden" name="action" value="getComId"> -->
<!-- 	 	</td> -->
<!-- 	 </form> -->
<!-- 	 </tr> -->
<!-- 	</table> -->
<!--   </fieldset> -->


<!-- -----------------------------------------------------------表格----------------------------------------------------------- -->
<div>
<div class="titledetail">退貨品</div>
<table id="table1" class="table table-bordered table-striped table-hover" >
<thead>
<tr>
	<td align='center'>商品名稱</td><td align='center'>廠商代號</td><td align='center'>退貨數量</td><td align='center'>備註</td><td align='center'>修改</td><td align='center'>刪除</td>
</tr>
</thead>
<c:forEach var="RtnItemsVO" items="${list}">
		<tr class="table2" align='center' valign='middle'>
			<td>${RtnItemsVO.prod_name}</td>
			<td>${RtnItemsVO.com_id}</td>
			<td>${RtnItemsVO.re_quantity}</td>
			<td>${RtnItemsVO.remark}</td>
		<td>

			  <FORM METHOD="post" ACTION="getOne_For_Update_Item.do">
			     <button type="submit" class="btn btn-success"><i class="fa fa-pencil"></i></button>
			     <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
		</td>
		<td>
<!-- 			  <FORM id="del" METHOD="post" ACTION="delete_Item.do"> -->
			    <button type="submit" target="${RtnItemsVO.prod_name}" class="btn btn-danger"><i class="fa fa-trash-o "></i></button>
<%-- 			    <input type="hidden" name="prod_name" value="${RtnItemsVO.prod_name}"> --%>
<!-- 			    <input type="hidden" name="action"value="delete"> -->
<!-- 			  </FORM> -->
		</td>
		</tr>
	
</c:forEach>

</table>
</div>
</div>
	</section> </section>

<script src="resources/js/gen_validatorv4.js" type="text/javascript"></script>
<script src="resources/js/jquery-1.12.3.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
<script type="text/JavaScript">
	
	$(function () {
		
//-------------------------------------新增---------------------------------------------
		$('#add').on('click',function(){
		var url = "Return_Items.jsp"; 
		    $.ajax({
		           type: "GET",
		           url: url,
		           success: function(data)
		           {
		               $("#main-content").html(data); 
		           }
		         });
			})	
		

		$('#sub').on('click',function(){
	    var url = "RETURNS/insert_Item.do"; 
	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#itemsform").serialize(), 
	           success: function(data)
	           {
	               $("#main-content").html(data); 
	           }
	         });
		})
//-------------------------------------刪除---------------------------------------------
		$('.btn-danger').on('click',function(){	
			var id = $(this).attr('target');
	    	var url = "RETURNS/delete_Item.do"; 
	    $.ajax({
	           type: "POST",
	           url: url,
	           data: {prod_name:id},
	           success: function(data)
	           {
	        	   $("#main-content").html(data); 
	           }
	         });
		})
		
		$('#table1').DataTable();
		
		
	})
	
	


					
	</script>
</body>
</html>