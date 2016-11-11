<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.returns.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<% 
	RtnItemsVO rtnItemsVO = (RtnItemsVO) request.getAttribute("RtnItemsVO");
%>

<%-- <jsp:useBean id="rtnItemsSvc" scope="page" class="com.returns.model.ReturnItemsService" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <link href="<c:url value="../resources/css/bootstrap.css" />" rel="stylesheet"> --%>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap-theme.min.css" rel="stylesheet">
<style type="text/css">
	
	body { 
 		background: aliceblue; 
 	}
 	
 	a{
		margin-left: 30px;
	} 


</style>
<title>退貨品資料修改</title>
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

<form METHOD="post" ACTION="update_Item.do" name="form1">
    <fieldset style="height: 50%">
        <legend>退貨品資料修改</legend>
<from class="form-horizontal">
	<div class="form-group">
    	<label class="col-sm-4 control-label">產品名稱:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="prod_name" value="<%=rtnItemsVO.getProd_name()%>"/>
    	</div>
  	</div>
	<div class="form-group">
    	<label class="col-sm-4 control-label">廠商代號:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="com_id" value="<%=rtnItemsVO.getCom_id()%>"/>
    	</div>
  	</div>  	
	<div class="form-group">
    	<label class="col-sm-4 control-label">退貨數量:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="re_quantity" value="<%=rtnItemsVO.getRe_quantity()%>"/>
    	</div>
  	</div> 
    <div class="form-group">
          <label class="col-sm-4 control-label">備註：</label>
			<div class="col-sm-5">
            <div class="textarea">
                  <textarea name="remark"> </textarea>
            </div>
          </div>
    </div>
  	<div class="form-group">
    	<div class="col-sm-offset-6">
    　　　　		<input type="hidden" name="action" value="update">
    		<input type="hidden" name="prod_name" value="<%=rtnItemsVO.getProd_name()%>">
      		<button type="submit" class="btn btn-default">送　出</button>
    	</div>
  	</div>
	</from>
   </fieldset>
 </form>
 
 	<a href="../RETURNS/Return_Items.jsp"><i class="glyphicon glyphicon-th-list"></i>　退貨品</a></br>
	<a href="javascript:" onclick="history.back(); "><i class="glyphicon glyphicon-arrow-left"></i>　回上頁</a>
	

</body>
</html>