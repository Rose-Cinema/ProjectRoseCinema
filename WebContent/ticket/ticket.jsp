<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ticket</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$('#calender').datepicker();
})
function calender() {
	$
}

function checkMovie(selectData) {
	var movieid = selectData.id;
	var moviename = selectData.value
	$.ajax({
		url:"/RoseCinema/ticket/checkMovie/"+moviename,
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"String",
		success:function(result) {
			alert(result);
			$('#checkmovie').val("${moviename}");
		}
	});
}
/* function selectAllTimetable() {
	$.ajax({
		url:"/RoseCinema/timetable/timetselectAllTimetable",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		success:function(result) {
			$.each(result, function key,value)
		}
		
	})
} */

</script>
</head>
<body>
<div align="left" style="border: 1px; padding: 10px; width: 33%;">
<form action="/RoseCinema/ticket/checkMovie.do" method="post">
	<table>
		<thead><tr><td>MOVIE</td></tr></thead>
		<tbody>
			<tr id="movieList"></tr>
			<c:forEach var="movieList" items="${movieList }">
				<tr><td style="width: 33%;"><input  style="width: 33%;"type="radio" name="movie" id="${movieList.movie_id }" value="${movieList.movie_name }" onclick="checkMovie(this)">${movieList.movie_name }</td></tr>
			</c:forEach>
		</tbody>
	</table>
</form>
</div>
<div align="left" style="border: 1px; padding: 10px; width: 33%; margin-top: 1px;">
<form action="">
	<table>
		<thead><tr><td>THEATER</td></tr></thead>
		<tbody>
			<tr id="theaterList"></tr>
			<c:forEach var="theaterList" items="${theaterList }">
				<tr><td style="width: 33%;"><input style="width: 33%;" type="radio" name="theater" id="${theaterList.theater_id }" value="${theaterList.theater_name }">${theaterList.theater_name }</td></tr>
			</c:forEach>
		</tbody>
	</table>
</form>
</div>
<div align="left" style="border: 1px; padding: 10px; width: 33%;">
<form action="">
	<table>
		<thead><tr>시간<td></td></tr></thead>
		<tbody><tr id="timeTableList"></tr></tbody>
	</table>
</form>
</div>
<div>
<form action="">
<table>
	<tr>
		<td>영화선택</td>
		<td>극장선택</td>
		<td>좌석선택</td>
		<td>결제</td>
	</tr>
	<tr>
		<td id="movie"><input type="text" readonly="readonly" id="checkmovie">${moviename }</td>
		<td id="theater">${theatername }</td>
		<td id="seat"></td>
		<td id="buy"></td>
	</tr>

</table>
</form>
</div>
<!-- 		<table id="movieList"></table>
		<tr>
			<td>
				<input type="radio" id="" name="" value="">
			</td>
		</tr> -->

	
	<!-- 	<table id="theaterList"></table> -->
	
	
		<table style="table-layout: fixed;">
			<tr>
				<td><input type="text" id="calender"></td>
			</tr>
		</table>
	
	
	
	
</body>
<iframe src="/RoseCinema/ticket/goInsertTicketOptionForm">asds</iframe>
</html>