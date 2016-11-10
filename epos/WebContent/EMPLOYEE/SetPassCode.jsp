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
<jsp:useBean id="empSvc" scope="page" class="com.employee.model.EmpService" />
<form action="setPassCode.do" method="POST">

<b>選擇員工姓名:</b>
       <select size="1" name="emp_id">
         <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.emp_id}">${empVO.emp_name} ${empVO.emp_id}
         </c:forEach>   
       </select>
       




<h4>最大權限</h4>
<input type="checkbox" name="pass_code" value="ALL" >通行無阻<br>

<h4>員工維護</h4>
<input type="checkbox" name="pass_code" value="/getOneEmp.do" >依照員工編號查詢<br>
<input type="checkbox" name="pass_code" value="/getAllEmp.do" >查詢全部員工<br>
<input type="checkbox" name="pass_code" value="/insertEmp.do" >新增員工<br>
<input type="checkbox" name="pass_code" value="/getEmpByName.do" >依照員工姓名查詢  <br>
<input type="checkbox" name="pass_code" value="/updateDeleteEmp.do" >修改刪除員工<br>
<input type="checkbox" name="pass_code" value="/updateEmp.do" >修改員工<br>
<input type="checkbox" name="pass_code" value="/setPassCode.do" >權限設定<br>
<h4>進貨作業</h4>
<input type="checkbox" name="pass_code" value="/insertBOP.do" >新增進貨單<br>
<input type="checkbox" name="pass_code" value="/updateBOP.do" >修改進貨單  <br>
<input type="checkbox" name="pass_code" value="/getOneBopforDisplay.do" >依照進貨單編號查詢 <br>
<input type="checkbox" name="pass_code" value="/getAllBop.do" >查詢全部進貨單  <br>
<input type="checkbox" name="pass_code" value="/deleteDetailBOP.do" >刪除進貨單明細	<br>
<input type="checkbox" name="pass_code" value="/DetailUpdateDeleteBOP.do" >查詢刪除修改進貨單	<br>

<input type="submit" value="OK">
</form>
</body>
</html>