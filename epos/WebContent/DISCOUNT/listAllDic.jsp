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
						<td class="numeric">修改/確認</td>
						<td class="numeric">刪除</td>
					</tr>
					</thead>
					<c:forEach var="discVO" items="${list}">
						<tr align='center' valign='middle'>
							<td class="numeric">${discVO.dis_id}</td>
							<td class="numeric">
							<label>${discVO.dis_price}</label>
							<input type="text" name="dis_price" size="5" class="chg_price">
							</td>
							<td class="numeric">
								<button type="button" class="btn btn-success" onclick="editEvent(this)" ><i class="fa fa-pencil"></i></button>
								<button type="button" class="btn btn-primary" onclick="confirmEvent(this)" ><i class="fa fa-check"></i></button>
							</td>
							<td class="numeric">
                                    <button type="button" class="btn btn-danger"><i class="fa fa-trash-o" target="${discVO.dis_id}"></i></button>									
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

	</section> </section>

<script type="text/JavaScript">

	$(document).ready(function() {
		$('.btn-primary').hide();
		$('.chg_price').hide();
		
		$('.fa-trash-o').click(function() {
			var id = $(this).attr("target");
			$.ajax({
				"type" : "post",
				"url" : "deleteDisc.do",
				"data" : {
					dis_id : id
				},
				"success" : function(data) {
					$.ajax({
						"type" : "post",
						"url" : "allDisc.do",
						"data" : {},
						"success" : function(data) {
							$(".result-context").html(data);
							$("#result").attr("class", "active");
							$("#search1").removeAttr("class");
							$("#search").attr("class", "tab-pane fade");
							$("#resolution").attr("class", "tab-pane active");
						}
					});
				},
			});
		})

	})
	function editEvent(event) {
// 		console.log($(event).html());  //現在位置
// 		console.log($(event).parent().parent().find("td:eq(1) > label").html());  //要更改的位置
		var $label = $(event).parent().parent().find("td:eq(1) > label");
		var value = $label.html();
		var input = $(event).parent().parent().find("td:eq(1) input");
		input.val(value);
		$label.hide();
		input.show();		
		$(event).hide();
		$(event).parent().find("button:eq(1)").show();
	}
	

	function confirmEvent(event) {
		var id = $(event).parent().parent().find("td:eq(0)").html(); //id
		var inp = $(event).parent().parent().find(":text");
		var value =inp.val();

		var $label = $(event).parent().parent().find("td:eq(1) > label");
		$.ajax({
			"type" : "post",
			"url" : "updateDisc.do",
			"data" : {
				dis_id : id,
				dis_price : value
			},
			"success" : function() {
				//ajax
				$.ajax({
					"type" : "post",
					"url" : "alljson.do",
					"data" : {},
					"success" : function(data) {
						var sel = $('select[name="dis_id"]:eq(1)');
						sel.empty();
						$.each($.parseJSON(data), function() {
							var n = this.dis_id;
							var vp = this.dis_price;
							var opt = $("<option>");
							opt.append(vp);
							opt.val(n);
							sel.append(opt);
						})						
						
					}
				});
			}
		});
		inp.hide();
		$label.html(value);
		$label.show();
		$(event).hide();
		$(event).parent().find("button:eq(0)").show();
	}
</script>

</body>


</html>