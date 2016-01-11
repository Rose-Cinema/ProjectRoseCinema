<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TicketForm</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function insertTicket(ticket) {
		$.ajax({
			url:"/RoseCinema/insertTicket",
			type:"POST",
			data:""
		})
	}
	
	function getModifyTicket(tickeT_id) {
		$.ajax({
			url:"/RoseCinema/selectTicketByNo",
			type:""
		})
	}
</script>
</head>
<body>
	<form action="/RoseCinema/insertTicket" method="post">
		<table border="3">
			<tr>
				<td>Ticket_Id</td>
				<td id="ticketID"></td>
			</tr>
			<tr>
				<td>No</td>
				<td id="No"></td>
			</tr>
			<tr>
				<td>SeatID</td>
				<td id="seatID"></td>
			</tr>
			<tr>
				<td>ScreenID</td>
				<td id="screenID"></td>
			</tr>
			<tr>
				<td>MemberID</td>
				<td id="memberID"></td>
			</tr>
			<tr>
				<td>McardID</td>
				<td id="mcardID"></td>
			</tr>
			<tr>
				<td>CouponID</td>
				<td id="coupon"></td>
			</tr>
			<tr>
				<td>Movie</td>
				<td id="movie"></td>
			</tr>
			<tr>
				<td>Theater</td>
				<td id="theater"></td>
			</tr>
			<tr>
				<td>Screen</td>
				<td id="screen"></td>
			</tr>
			<tr>
				<td>TicketDate</td>
				<td id="ticketDate"></td>
			</tr>
			<tr>
				<td>Count</td>
				<td id="count"></td>
			</tr>
			<tr>
				<td>Seat1</td>
				<td id="seat"></td>
			</tr>
			<tr>
				<td>Seat2</td>
				<td id="seat2"></td>
			</tr>
			<tr>
				<td>Seat3</td>
				<td id="seat3"></td>
			</tr>
			<tr>
				<td>Seat4</td>
				<td id="seat4"></td>
			</tr>
			<tr>
				<td>Seat5</td>
				<td id="seat5"></td>
			</tr>
			<tr>
				<td>Seat6</td>
				<td id="seat6"></td>
			</tr>
			<tr>
				<td>Seat7</td>
				<td id="seat7"></td>
			</tr>
			<tr>
				<td>Seat8</td>
				<td id="seat8"></td>
			</tr>
			<tr>
				<td>BuyDate</td>
				<td id="buyDate"></td>
			</tr>
			<tr>
				<td>BuySum</td>
				<td id="buySum"></td>
			</tr>
			<tr>
				<td>BuyType</td>
				<td id="buyType"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td id="phone"></td>
			</tr>
			<tr>
				<td>IsCancel</td>
				<td id="isCancel"></td>
			</tr>
			<tr>
				<td>CancelDate</td>
				<td id="cancelDate"></td>
			</tr>
		</table>
	</form>
</body>
</html>