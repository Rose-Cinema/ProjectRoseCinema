<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InsertTicketForm</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	getNextTicketID();
})

function getNextTicketID() {
	$.ajax({
		url:"/RoseCinema/getNextTicketID",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success:function(result) {
			$('#TICKETID').val(result);
		}
	});
}
/*
function selectTheaterNameByScreenID(inputData) {
	var screen_id = inputData.value;
	$.ajax({
		url:"/RoseCinema/selectTheaterNameByScreenID/"+screen_id,
		type:"GET",
		date:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success:function(result) {
			$('#THEATER').val(result);
		}
	});
}
	
function insertTicket(ticket) {
		$.ajax({
			url:"/RoseCinema/insertTicket",
			type:"POST",
			data:"",
			cache:false,
			async:false,
			dataType:"JSON",
			
			success:function(result) {
				var next
			}
		});
	}
	
function selectAllScreenID() {
	$.ajax({
		url:"/RoseCinema/selectAllScreenID",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success:function(result) {
			$.each(result, function(key,value) {
				$("#SCREENID").append("<option value=\""+value+"\">"+value+"</option>");
			});
			
		}
	});
}

function selectAllMemberID() {
	$.ajax({
		url:"/RoseCinema/selectAllMemberID",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success:function(result) {
			$.each(result, function(key, value) {
				$("#MEMBERID").append("<option value=\""+value+"\">"+value+"</option>");
			});
		}
	});
} */


	


</script>
</head>
<body>
<a href="/RoseCinema/ticket/ticket.do">asd</a>
	<form action="/RoseCinema/ticket/insertTicket" method="post">
		<table id="insertTicketTable" border="3">
			<tr>
				<td>TICKETID</td>
				<td><input type="text" id="TICKETID" name="ticket_id"readonly="readonly"></td>
			</tr>
			<tr>
				<td>No</td>
				<td><input type="text" readonly="readonly" name="no"></td>
			</tr>
			<tr>
				<td>SCREENID</td>
				<td>
					<input type="text" readonly="readonly" name="screenID" value="${timeTable.screen_id }">
				</td>
			</tr>
			<tr>
				<td>MEMBERID</td>
				<td><input type="text" readonly="readonly" name="memberID"value="${memName }"></td>
			</tr>
			<tr>
				<td>MCARDID</td>
				<td id="tdMCARDID"></td>
			</tr>
			<tr>
				<td>COUPONID</td>
				<td id="tdCOUPONID"></td>
			</tr>
			<tr>
				<td>MOVIE</td>
				<td><input type="text" readonly="readonly" value="${movie }"></td>
			</tr>
			<tr>
				<td>THEATER</td>
				<td><input type="text" readonly="readonly" value="${timeTable.theater_id }"></td>
			</tr>
			<tr>
				<td>SCREEN</td>
				<td><input type="text" readonly="readonly" value="${screen }"></td>
			</tr>
			<tr>
				<td>TICKETDATE</td>
				<td><input type="text" readonly="readonly" value="${timeTable.date_info }"></td>
			</tr>
			<tbody>
			<tr>
				<td>COUNT</td>
				<td>
					<select id="count" onchange="">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
			</tr>
			</tbody>
			<tr id="seatList">
				<td>SEAT</td>
				<td>
					<select name="seat1">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat2">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat3">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat4">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat5">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat6">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat7">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
					<select name="seat8">
						<c:forEach var="seat" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
				</td>
	<%-- 			<td>
					<select>
						<c:forEach var="seat2" items="${seatList }">
							<option value="${seat.seat_id }">${seat.line_no }${seat.seat_no }</option>
						</c:forEach>
					</select>
				</td> --%>
				
			</tr>
			<tr>
				<td>BUYDATE</td>
				<td><input type="text" readonly="readonly" value="${timeTable.date_info }"></td>
			</tr>
			<tr>
				<td>BUYSUM</td>
				<td id="tdBUYSUM"></td>
			</tr>
			<tr>
				<td>BUYTYPE</td>
				<td id="tdBUYTYPE"></td>
			</tr>
			<tr>
				<td>PHONE</td>
				<td id="tdPHONE"></td>
			</tr>
			<tr>
				<td>ISCANCEL</td>
				<td><input type="text" readonly="readonly" value="0"></td>
			</tr>
			<tr>
				<td>CANCELDATE</td>
				<td id="tdCANCELDATE"></td>
			</tr>
		</table>
	</form>
</body>
</html>