<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.returns.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<% 
	RtnListVO rtnListVO = (RtnListVO) request.getAttribute("RtnListVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="../resources/css/bootstrap.css" />"
	rel="stylesheet">
<!--external css-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap-theme.min.css" rel="stylesheet">
<title>退貨單資料修改</title>


<style type="text/css">
	
	legend{
		background: #d47f9b;
	}
	
	a{
		margin-left: 30px;
	}
	
/* 	body{ */
/* 		background: lavenderblush; */
/* 	} */


</style>
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

<FORM METHOD="post" ACTION="update.do" name="form1">
<fieldset>
	<legend>退貨單資料修改</legend>
<from class="form-horizontal">
	<div class="form-group">
    	<label class="col-sm-4 control-label">退貨單編號:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="ret_id" value="<%=rtnListVO.getRet_id()%>" disabled="disabled"/>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-4 control-label">退貨日期:</label>
    	<div class="col-sm-5">
      		<input type="date" class="form-control" name="ret_date" value="<%=rtnListVO.getRet_date()%>"/>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-4 control-label">廠商編號:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="com_id" value="<%=rtnListVO.getCom_id()%>"/>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-4 control-label">廠商名稱:</label>
    	<div class="col-sm-5">
      	<input type="text" class="form-control" name="com_name" value="<%=rtnListVO.getCom_name()%>"/>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-4 control-label">修改人員:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="key_id" value="<%=rtnListVO.getKey_id()%>"/>
   		 </div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-4 control-label">修改日期:</label>
    	<div class="col-sm-5">
      		<input type="date" class="form-control" name="key_date" value="<%=rtnListVO.getKey_date()%>"/>
    	</div>
  	</div>
  	<div class="form-group">
    	<label class="col-sm-4 control-label">狀　　態:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="status" value="<%=rtnListVO.getStatus()%>"/>
    	</div>
  	</div>
  	<div class="form-group">
   		<label class="col-sm-4 control-label">備　　註:</label>
    	<div class="col-sm-5">
      		<input type="text" class="form-control" name="remark" value="<%=rtnListVO.getRemark()%>"/>
    	</div>
  	</div>
  	<div class="form-group">
    <div class="col-sm-offset-6">
    　　　　<input type="hidden" name="action" value="update">
      <input type="hidden" name="ret_id" value="<%=rtnListVO.getRet_id()%>">
      <button type="submit" class="btn btn-default">送　出</button>
    </div>
  </div>
</from>
</fieldset>
  </FORM>

	<a href="../RETURNS/ReturnList.jsp"><i class="glyphicon glyphicon-th-list"></i>　退貨單</a></br>
	<a href="javascript:" onclick="history.back(); "><i class="glyphicon glyphicon-arrow-left"></i>　回上頁</a>

</body>
</html>