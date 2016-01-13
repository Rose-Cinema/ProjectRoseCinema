<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertTicketOptionForm</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<body>
<div>
<table>
	<tr>
		<td>영화선택</td>
		<td>극장선택</td>
		<td>좌석선택</td>
		<td>결제</td>
	</tr>
	<tr>
		<td id="movie">${moviename}</td>
		<td id="theater">${theatername }</td>
		<td id="seat"></td>
		<td id="buy"></td>
	</tr>

</table>
</div>
</body>
</html>