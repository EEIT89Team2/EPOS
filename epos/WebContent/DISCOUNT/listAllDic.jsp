<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.discount.model.*"%>
<%
	List<DiscountVO> list = (List<DiscountVO>) request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/JavaScript">
$(document).ready(function() {
		$('input[value="刪除"]').click(function() {

 				$.ajax({
					"type" : "post",
					"url" : "deleteDisc.do",
					"data" : $(this).serialize(),
					"success" : function(data) {
						$("#sub-content").html(data)
					},
				});

		})
})
</script>
<title>折扣清單</title>
</head>
<body>
	<section id="container"> <section class="wrapper">
	<div class="row mt">
		<div class="col-lg-7">
			<div class="showback">
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

				<table border='1' bordercolor='#CCCCFF' width='800'
					class="table table-bordered table-condensed  table-hover">
					<tr>
						<th class="numeric">折扣身分</th>
						<th class="numeric">折扣%數</th>
						<th class="numeric">修改</th>
						<th class="numeric">刪除</th>
					</tr>

					<c:forEach var="discVO" items="${list}">
						<tr align='center' valign='middle'>
							<td class="numeric">${discVO.dis_id}</td>
							<td class="numeric">${discVO.dis_price}</td>

							<td class="numeric">
								<form METHOD="post"
									ACTION="allForUpdateDisc.do">
									<input type="submit" value="修改"> 
									<input type="hidden" name="dis_id" value="${discVO.dis_id}">
								</form>
							</td>
							<td class="numeric">
								<form METHOD="post" ACTION="deleteDisc.do" class="delete">
									<input type="button" value="刪除" class="btn btn-primary btn-xs">
<!--                                     <button type="button" class="btn btn-primary btn-xs"><i class="fa fa-trash-o"></i></button>									 -->
									<input type="hidden" name="dis_id" value="${discVO.dis_id}">
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</section> </section>

</body>
</html>