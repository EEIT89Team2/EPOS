<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO");	//若輸入錯誤可以傳回包含錯誤的VO,有些對的就不用重打了
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增會員</title>
</head>
<body>
<center>
	<h3>會員資料:</h3>
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
 
	<FORM METHOD="post" ACTION="insertMemb.do" name="form1">
		<table border="0">

<!-- 			<tr> -->
<!-- 				<td>會員編號:</td> -->
<!-- 				<td><input type="text" name="mem_id" size="20" -->
<%-- 					value="<%=(memVO == null) ? "M00001" : memVO.getMem_id()%>" /></td> --%>
<!-- 			</tr> -->
			<tr>
				<td>密碼:</td>
				<td><input type="text" name="mem_pwd" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_pwd()%>" /></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><input type="text" name="mem_name" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_name()%>" /></td>
			</tr>
			<tr>
				<td>身分證:</td>
				<td><input type="text" name="mem_idnum" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_idnum()%>" /></td>
			</tr>
			<tr>
				<td>生日:</td>
				<td><input type="date" name="mem_bday" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_bday()%>" /></td>
			</tr>
			<tr>
				<td>連絡電話:</td>
				<td><input type="text" name="mem_phone" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_phone()%>" /></td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input type="text" name="mem_addr" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_addr()%>" /></td>
			</tr>
			<tr>
				<td>e-mail:</td>
				<td><input type="text" name="mem_mail" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_mail()%>" /></td>
			</tr>
			<tr>
				<td>會員到期日:</td>
				<td><input type="date" name="mem_due" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_due()%>" /></td>
			</tr>
			<tr>
				<td>建檔人員:</td>
				<td><input type="text" name="key_id" size="20"
					value="<%=(memVO == null) ? "" : memVO.getKey_id()%>" /></td>
			</tr>
			<tr>
				<td>統編:</td>
				<td><input type="text" name="mem_um" size="20"
					value="<%=(memVO == null) ? "" : memVO.getMem_um()%>" /></td>
			</tr>

		</table>

		<br>
<!-- 	 <input type="hidden" name="action" value="insert">  -->
	 <input type="submit" value="送出新增">
	</FORM>
</center>	
	<jsp:include page="/COMMON/footer_mem.jsp" />
	<a href="../index.jsp">回首頁</a>
	<a href="javascript:" onclick="history.back(); ">回上頁</a> 
</body>
</html>