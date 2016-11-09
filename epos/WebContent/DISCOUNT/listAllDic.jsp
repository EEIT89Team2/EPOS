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
<style>
.table > thead:first-child > tr:first-child > td {
	background:#575c67;
	text-align: center;
}

</style>
<script type="text/JavaScript">
$(document).ready(function() {
		$('.fa-trash-o').click(function() {
		var id = $(this).attr("target");
 				$.ajax({
					"type" : "post",
					"url" : "deleteDisc.do",
					"data" : {dis_id:id},
					"success" : function(data) {
						$.ajax({
							"type" : "post",
							"url" : "allDisc.do",
							"data" : {},
							"success" : function(data) {
								$(".result-context").html(data);
								$("#result").attr("class","active");
								$("#search1").removeAttr("class");
								$("#search").attr("class","tab-pane fade");
								$("#resolution").attr("class","tab-pane active");
							},
						});
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
					class="table table-bordered table-striped  table-hover">
					<thead>
					<tr>
						<td class="numeric">折扣身分</td>
						<td class="numeric">折扣%數</td>
						<td class="numeric">修改</td>
						<td class="numeric">刪除</td>
					</tr>
					</thead>
					<c:forEach var="discVO" items="${list}">
						<tr align='center' valign='middle'>
							<td class="numeric">${discVO.dis_id}</td>
							<td class="numeric">${discVO.dis_price}</td>

							<td class="numeric">
								<form METHOD="post"
									ACTION="allForUpdateDisc.do">
<!-- 									<input type="submit" value="修改">  -->
									<button type="button" class="btn btn-success"><i class="fa fa-pencil" target="${discVO.dis_id}"></i></button>
								</form>
							</td>
							<td class="numeric">
								<form METHOD="post" ACTION="deleteDisc.do" class="delete">
                                    <button type="button" class="btn btn-danger"><i class="fa fa-trash-o" target="${discVO.dis_id}"></i></button>									
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

	</section> </section>

</body>
</html>