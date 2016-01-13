<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ticket</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	selectMovieIDName();
	selectTheaterIDName();
	selectAllTimetable();
	$('#calender').datepicker();
})
function calender() {
	$
}
function selectTheaterIDName() {
	$.ajax({
		url:"/RoseCinema/selectTheaterIDName",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		success:function(result) {
			$.each(result, function(key,value) {
				$('#theaterList').append(
					"<tr>"+
						"<td><input type=\"radio\" name=\"theater\" id=\""+value.theater_id+"\" value=\""+value.theater_name+"\">"+value.theater_name+"</td>"+
					"</tr>"			
				);
			});
		}
	});
}
function selectMovieIDName() {
	$.ajax({
		url:"/RoseCinema/selectMovieIDName",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		success:function(result) {
			$.each(result, function(key,value) {
				$('#movieList').append(
					"<tr>"+
						"<td><input type=\"radio\" name=\"movie\" id=\""+value.movie_id+"\" value=\""+value.movie_name+"\">"+value.movie_name+"</td>"+
					"</tr>"		
				);
			});
		}
	});
}
function selectAllTimetable() {
	$.ajax({
		url:"/RoseCinema/selectAllTimetable",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		succes:function(result) {
	/* 		$.each(result, function(key, value) {
				
			}); */
			
			alert("#$!@#!@#@!");
		}
	});
}
/* }
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
						"<td><input type=\"radio\" name=\"movie\" value=\""+value+"\">"+value+"</td>"+
					"</tr>"
				);
			});
		}
	});
} */
/* function selectAllTheaterName() {
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
} */
</script>
</head>
<body>
	<div style="float: left;">
		<table id="movieList" style="table-layout: fixed;"></table>
		<tr>
			<td>
				<input type="radio" id="" name="" value="">
			</td>
		</tr>
	</div>
	<div style="float: left;">
		<table id="theaterList" style="table-layout: fixed;"></table>
	</div>
	<div style="float: left;">
		<table style="table-layout: fixed;">
			<tr>
				<td><input type="text" id="calender"></td>
			</tr>
		</table>
	</div>
</body>
</html>