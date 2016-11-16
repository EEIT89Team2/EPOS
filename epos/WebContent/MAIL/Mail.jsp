<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">

	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<!---------------------收件者信箱 -------------------- -->

	<form method="post" action="email.do" name="form2">
<div align="center">
	<tr>
<!-- <td>Client:<input type="text" name="uesr" size="10"></td> -->
<!-- <td>Password:<input type="password" name="pass" size="10"></td> -->
<td>收件者信箱:<input type="text" name="addres" size="20"></td>  
<td>標題:<input type="text" name="from" size="10"></td>  
<td>主旨:<input type="text" name="subject" size="10"></td>  
	</tr>
<input type="submit" value="寄送單一會員" name="howMany">
<input type="submit" value="寄送全部會員" name="howMany">
<input type="submit" value="寄送優惠訊息" name="howMany">
<br><br>
內容:
<div align="center">
<textarea cols="50" rows="9" name="text">
</textarea>
</div>
<div align="center">
<input type="date" name="s_ord_date" value="2016-09-14">
<input type="date" name="e_ord_date" value="2016-10-16">
	<input type="submit" value="查詢未下訂單會員" name="howMany">	
<table border='1' width='500'>	
	<tr align='center' valign='middle'>
		<th>會員編號.信箱</th>
		 
	</tr>
	<c:forEach var="list" items="${list1}">	
		<tr align='center' valign='middle'>
		<td>${list.key} , ${list.value.mem_mail}</td>
		</tr>		
	 </c:forEach>	
</div>		
	</table>
</div>
	</form>
	 <a href="<c:out value='${pageContext.request.contextPath}' />/MAIL/Mail.jsp">回上頁</a>
<!-----------------------寄送全部會員--------------- -->
<table border='1' width='500'>	
	<form method="post" action="allMail.do" >
	<div>
	<br><br> 	
	<input type="submit" value="查詢全部會員" >
	<tr>
		<th>會員編號</th>
		<th>信箱</th>
	</tr>
	<br>
	<c:forEach var="list" items="${list}">	
		<tr align='center' valign='middle'>
		<td>${list.mem_id}</td>
		<td>${list.mem_mail}</td>
		</tr>		
	 </c:forEach>
	</div>
	</form>
	</table>
	 <a href="<c:out value='${pageContext.request.contextPath}' />/MAIL/Mail.jsp">回上頁</a>

<!-----------------------查詢會員信箱--------------- -->

<!-- <table border='1' width='500'>	 -->
<!-- 	<form method="post" action="noOrdMail.do" > -->
<!-- 	<div> -->
<!-- 	<br><br>  -->
<!-- 	<input type="date" id="s_ord_date" name="s_ord_date" value="2016-09-15"/> -->
<!-- 	<input type="date" id="e_ord_date" name="e_ord_date" value="2016-10-02"/>		 -->
<!-- 	<input type="submit" value="查詢未下訂單會員" name="howMany"> -->
<!-- 	<tr> -->
<!-- 		<th>會員編號.信箱</th> -->
<!-- <!-- 		<th>訂單日期</th> --> 
<!-- 	</tr> -->
<!-- 	<br> -->
<%-- 	<c:forEach var="list" items="${list1}">	 --%>
<!-- 		<tr align='center' valign='middle'> -->
<%-- 		<td>${list.key} , ${list.value.mem_mail}</td> --%>
<!-- 		</tr>		 -->
<%-- 	 </c:forEach> --%>
<!-- 	</div> -->
<!-- 	</form> -->
<!-- 	</table> -->
<%-- 	 <a href="<c:out value='${pageContext.request.contextPath}' />/MAIL/Mail.jsp">回上頁</a> --%>

</body>
</html>