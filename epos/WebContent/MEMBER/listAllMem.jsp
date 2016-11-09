<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
	List<MemberVO> list =(List<MemberVO>) request.getAttribute("list");	//除了錯誤訊息是用VO或List送來外,其餘的查詢結果都是用List送來
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員清單</title>
</head>
<body>
<center>
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
 
<table border='1' bordercolor='#CCCCFF' width='1500'>
	<tr>
		<th>會員編號</th>
		<th>密碼</th>
		<th>姓名</th>
		<th>身分證</th>
		<th>生日</th>
		<th>連絡電話</th>
		<th>地址</th>
		<th>e-mail</th>
		<th>會員到期日</th>
		<th>建檔人員</th>
		<th>建檔日期</th>
		<th>統編</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<c:forEach var="memVO" items="${list}">	
		<tr align='center' valign='middle'>
			<td>${memVO.mem_id}</td>
			<td>${memVO.mem_pwd}</td>
			<td>${memVO.mem_name}</td>
			<td>${memVO.mem_idnum}</td>
			<td>${memVO.mem_bday}</td>
			<td>${memVO.mem_phone}</td>
			<td>${memVO.mem_addr}</td>
			<td>${memVO.mem_mail}</td>
			<td>${memVO.mem_due}</td>
			<td>${memVO.key_id}</td>
			<td>${memVO.key_date}</td>
			<td>${memVO.mem_um}</td>

        		<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/MEMBER/allForUpdateMem.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="mem_id" value="${memVO.mem_id}"> 
<!-- 						<input type="hidden" name="action" value="getOne_For_Update"> -->
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"		ACTION="<%=request.getContextPath()%>/MEMBER/deleteMem.do">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="mem_id" value="${memVO.mem_id}"> 
<!-- 						<input type="hidden" name="action" value="delete"> -->
					</FORM>
				</td>
	 	</tr>
	 </c:forEach>
</table>
</center>
	<jsp:include page="/COMMON/footer_mem.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>