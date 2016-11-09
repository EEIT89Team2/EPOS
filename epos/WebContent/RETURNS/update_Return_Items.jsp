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
	
	.f{
		border: medium;
		border-color: black;
		margin-left:auto;
		margin-right:auto;
		text-align:left;
		background: #d1ecf5;
		
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

<form class="form-horizontal" METHOD="post" ACTION="update_Item.do" name="form1">
    <fieldset class="f" style='width:50%'>
      <div id="legend" class="">
        <legend class="title">退貨品資料修改</legend>
      </div>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">產品名稱：</label>
          <div class="controls">
            <input type="text" name="prod_name" size="40" value="<%=rtnItemsVO.getProd_name()%>" placeholder="iphone 6 16G 黑色" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">廠商代號：</label>
          <div class="controls">
            <input type="text" name="com_id" size="40" value="<%=rtnItemsVO.getCom_id()%>" placeholder="C00001" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">退貨數量：</label>
          <div class="controls">
            <input type="text" name="re_quantity" size="40" value="<%=rtnItemsVO.getRe_quantity()%>"  placeholder="1" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    

    <div class="control-group">

          <!-- Textarea -->
          <label class="control-label">備註：</label>
          <div class="controls">
            <div class="textarea">
                  <textarea type="" class="" name="remark" size="40" value="<%=rtnItemsVO.getProd_name()%>"> </textarea>
            </div>
          </div>
        </div>

    <div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
          	<input type="hidden" name="action" value="update">
          	<input type="hidden" name="prod_name" value="<%=rtnItemsVO.getProd_name()%>">
            <button type="submit" class="btn btn-info">送出</button>
          </div>　　　　　　 
        </div><a href="javascript:" onclick="history.back(); ">回上頁</a>
		
    </fieldset>
 </form>
<!-- <FORM METHOD="post" ACTION="update_Item.do" name="form1"> -->
<!-- <fieldset style='width:50%'> -->
<!-- 	<legend>退貨品資料修改</legend> -->
<!-- <table border="0"> -->
<!-- 	<tr> -->
<!-- 		<td>產品名稱:</td> -->
<%-- 		<td><input type="TEXT" name="prod_name" size="40" value="<%=rtnItemsVO.getProd_name()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>廠商代號:</td> -->
<%-- 		<td><input type="TEXT" name="com_id" size="40" value="<%=rtnItemsVO.getCom_id()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>退貨數量:</td> -->
<%-- 		<td><input type="TEXT" name="re_quantity" size="40" value="<%=rtnItemsVO.getRe_quantity()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>備註:</td> -->
<%-- 		<td><input type="TEXT" name="remark" size="40" value="<%=rtnItemsVO.getProd_name()%>" /></td> --%>
<!-- 	</tr> -->
<!-- </table> -->
<!-- </fieldset> -->
<!-- <br> -->
<!-- <input type="hidden" name="action" value="update"> -->
<%-- <input type="hidden" name="prod_name" value="<%=rtnItemsVO.getProd_name()%>"> --%>
<!-- <input type="submit" value="送出修改"></FORM> -->
</br>
	

</body>
</html>