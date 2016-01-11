<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InsertTicketForm</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	getNextTicketID();
	selectAllScreenID();
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
			alert(result);
			$('#TICKETID').val(result);
		}
	})
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
	


</script>
</head>
<body>
	<form action="/RoseCinema/insertTicket" method="post">
		<table id="insertTicketTable" border="3">
			<tr>
				<td>TICKETID</td>
				<td><input type="text" id="TICKETID"></td>
			</tr>
			<tr>
				<td>No</td>
				<td><input type="text" readonly="readonly"></td>
			</tr>
			<tr>
				<td>SCREENID</td>
				<td>
					<select id=SCREENID></select>
				</td>
			</tr>
			<tr>
				<td>MEMBERID</td>
				<td id="tdMEMBERID"></td>
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
				<td id="tdMOVIE"></td>
			</tr>
			<tr>
				<td>THEATER</td>
				<td id="tdTHEATER"></td>
			</tr>
			<tr>
				<td>SCREEN</td>
				<td id="tdSCREEN"></td>
			</tr>
			<tr>
				<td>TICKETDATE</td>
				<td id="tdTICKETDATE"></td>
			</tr>
			<tr>
				<td>COUNT</td>
				<td id="tdCOUNT"></td>
			</tr>
			<tr>
				<td>SEAT1</td>
				<td id="tdSEAT1"></td>
			</tr>
			<tr>
				<td>SEAT2</td>
				<td id="tdSEAT2"></td>
			</tr>
			<tr>
				<td>SEAT3</td>
				<td id="tdSEAT3"></td>
			</tr>
			<tr>
				<td>SEAT4</td>
				<td id="tdSEAT4"></td>
			</tr>
			<tr>
				<td>SEAT5</td>
				<td id="tdSEAT5"></td>
			</tr>
			<tr>
				<td>SEAT6</td>
				<td id="tdSEAT6"></td>
			</tr>
			<tr>
				<td>SEAT7</td>
				<td id="tdSEAT7"></td>
			</tr>
			<tr>
				<td>SEAT8</td>
				<td id="tdSEAT8"></td>
			</tr>
			<tr>
				<td>BUYDATE</td>
				<td id="tdBUYDATE"></td>
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
				<td id="tdISCANCEL"></td>
			</tr>
			<tr>
				<td>CANCELDATE</td>
				<td id="tdCANCELDATE"></td>
			</tr>
		</table>
	</form>
</body>
</html>