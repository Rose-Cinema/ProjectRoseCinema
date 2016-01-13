<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ticket</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	selectAllMovieName();
	selectAllTheaterName();
})
function selectAllMovieName() {
	$.ajax({
		url:"/RoseCinema/selectAllMovieName",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		success:function(result) {
			$.each(result, function(key,value) {
				$('#movieList').append(
					"<tr>"+
						"<td><button id=\""+value+"\" height=\"auto\" style=\"word-break:brak-all;\">"+value+"</button></td>"+
					"</td>"
				);
			});
		}
	});
}
function selectAllTheaterName() {
	$.ajax({
		url:"/RoseCinema/selectAllTheaterName",
		type:"POST",
		date:"",
		cache:false,
		async:false,
		dataType:"JSON",
		success:function(result) {
			$.each(result, function(key,value) {
				$('#theaterList').append(
					"<tr>"+
						"<td><button id=\""+value+"\" height=\"auto\ style=\"word-break:brak-all;\">"+value+"</button></td>"+
					"</tr>"
				);
			});
		}
	});
}
</script>
</head>
<body>
	<div style="float: left;">
		<table id="movieList" style="table-layout: fixed;"></table>
	</div>
	<div style="float: left;">
		<table id="theaterList" style="table-layout: fixed;"></table>
	</div>
</body>
</html>