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
<title>�h�f�~��ƭק�</title>
</head>
<body>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
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
        <legend class="title">�h�f�~��ƭק�</legend>
      </div>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">���~�W�١G</label>
          <div class="controls">
            <input type="text" name="prod_name" size="40" value="<%=rtnItemsVO.getProd_name()%>" placeholder="iphone 6 16G �¦�" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">�t�ӥN���G</label>
          <div class="controls">
            <input type="text" name="com_id" size="40" value="<%=rtnItemsVO.getCom_id()%>" placeholder="C00001" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">�h�f�ƶq�G</label>
          <div class="controls">
            <input type="text" name="re_quantity" size="40" value="<%=rtnItemsVO.getRe_quantity()%>"  placeholder="1" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    

    <div class="control-group">

          <!-- Textarea -->
          <label class="control-label">�Ƶ��G</label>
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
            <button type="submit" class="btn btn-info">�e�X</button>
          </div>�@�@�@�@�@�@ 
        </div><a href="javascript:" onclick="history.back(); ">�^�W��</a>
		
    </fieldset>
 </form>
<!-- <FORM METHOD="post" ACTION="update_Item.do" name="form1"> -->
<!-- <fieldset style='width:50%'> -->
<!-- 	<legend>�h�f�~��ƭק�</legend> -->
<!-- <table border="0"> -->
<!-- 	<tr> -->
<!-- 		<td>���~�W��:</td> -->
<%-- 		<td><input type="TEXT" name="prod_name" size="40" value="<%=rtnItemsVO.getProd_name()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�t�ӥN��:</td> -->
<%-- 		<td><input type="TEXT" name="com_id" size="40" value="<%=rtnItemsVO.getCom_id()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�h�f�ƶq:</td> -->
<%-- 		<td><input type="TEXT" name="re_quantity" size="40" value="<%=rtnItemsVO.getRe_quantity()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>�Ƶ�:</td> -->
<%-- 		<td><input type="TEXT" name="remark" size="40" value="<%=rtnItemsVO.getProd_name()%>" /></td> --%>
<!-- 	</tr> -->
<!-- </table> -->
<!-- </fieldset> -->
<!-- <br> -->
<!-- <input type="hidden" name="action" value="update"> -->
<%-- <input type="hidden" name="prod_name" value="<%=rtnItemsVO.getProd_name()%>"> --%>
<!-- <input type="submit" value="�e�X�ק�"></FORM> -->
</br>
	

</body>
</html>