<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selectTicketForm</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	selectAllTicket();
	selectAllScreenID();
	

})

function addInsertTicketForm() {
	
}

function deleteTicket(inputData) {
	
	var data = inputData.id;
	$.ajax({
		url:"/RoseCinema/deleteTicket/" +data,
		type:"GET",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success:function(result) {
			alert(result);
		}
	})
}

/*  $('#ticketList').keydown(function(event) {
	if (event.which == 13) {s
		alert("SDfsdf");
		$.print( event );
	}
}); */

function updateThisData(inputData) {
/* 	alert(inputData.value);
	alert(inputData.id); */
/* 		if($(inputData)) {
			var $columnID = document.getElementById(inputData.getAttribute('id')).getAttribute('id');
			var $updateData = document.getElementById(inputData.getAttribute('id')).value;
			alert("columnID=" +$columnID+ "    updateData=" +$updateData);
		} */
		var data = inputData.id + inputData.value;
		var id = inputData.id;
			$.ajax({
				url:"/RoseCinema/updateThisData/" +data,
				type:"GET",
				data:"",
				cache:false,
				async:false,
				dataType:"JSON",
				
				success:function(result) {
					if(result) {
						alert(id);
						$("#"+id+"").append("<option value=\"1\">asdasdasd</option>");
					}
				}
			});

}

function selectLastTicketIDSEQ() {
	$.ajajx({
		url:"/RoseCinema/selectLastTicketIDSEQ",
		type:"POSt",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success:function(result) {
			
		}
	})
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
				$("select[name=screenID]").append("<option value=\""+value+"\">"+value+"</option>");
			});
			
		}
	});
}

function selectAllTicket() {
	$.ajax({
		url:"/RoseCinema/selectAllTicket",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",

		success:function(result) {
			$.each(result, function(key,value) {
				$ticketDate = new Date(value.ticketDate).toLocaleString();
				$buyDate	= new Date(value.buyDate).toLocaleDateString();
				$cancelDate	= new Date(value.cancelDate).toLocaleString();
			
				 $('#ticketListTable').append(
						 "<tr>"+
						 	"<td>"+
						 		"<button id=\""+value.ticketID+"\" onclick=\"deleteTicket(this)\">"+
								 value.ticketID +
								"</button>"+
						 	"</td>"+
						 	"<td><input id=\""+value.ticketID+"_no\"		 type=\"text\" value=\""+value.no       	+"\"readonly=\readonly\"></td>"+
						 	"<td>"+
						 		"<select id=\""+value.ticketID+"/SCREENID/\"  name=\"screenID\" onchange=\"updateThisData(this)\">"+
						 			"<option selected=\"selected\" value=\""+value.screenID+"\">"+
						 				value.screenID+""+
						 			"</option>"+
						 		"</select>"+
						 	"</td>"+
						 	"<td><input id=\""+value.ticketID+"_memberID_\"	 type=\"text\" value=\""+value.memberID 	+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_mcardID_\"	 type=\"text\" value=\""+value.mcardID 		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_couponID_\"	 type=\"text\" value=\""+value.couponID 	+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_movie_\"	 type=\"text\" value=\""+value.movie		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_theater_\" 	 type=\"text\" value=\""+value.theater		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_screen_\"	 type=\"text\" value=\""+value.screen		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_ticketDate_\"type=\"text\" value=\""+$ticketDate		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_count_\"	 type=\"text\" value=\""+value.count		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat1_\"	 type=\"text\" value=\""+value.seat1		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat2_\"	 type=\"text\" value=\""+value.seat2		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat3_\"	 type=\"text\" value=\""+value.seat3		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat4_\"	 type=\"text\" value=\""+value.seat4		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat5_\"	 type=\"text\" value=\""+value.seat5		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat6_\"	 type=\"text\" value=\""+value.seat6		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat7_\"	 type=\"text\" value=\""+value.seat7 		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_seat8_\"	 type=\"text\" value=\""+value.seat8 		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_buyDate_\"	 type=\"text\" value=\""+$buyDate			+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_buySum_\"	 type=\"text\" value=\""+value.buySum 		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_buyType_\"	 type=\"text\" value=\""+value.buyType 		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_phone_\"	 type=\"text\" value=\""+value.phone 		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 	"<td><input id=\""+value.ticketID+"_isCancel_\"	 type=\"text\" value=\""+value.isCancel 	+"\"onkeyup=\"updateThisData(this)\"></td>"+
							"<td><input id=\""+value.ticketID+"_cancelDate_\"type=\"text\" value=\""+$cancelDate		+"\"onkeyup=\"updateThisData(this)\"></td>"+
						 "</tr>");	 
			});
		}
	});
}
</script>
</head>
<body>
	<div>
		<button onclick="window.open('/RoseCinema/insertTicketForm', 'InsertTicketForm', 'width=300,height=300,location=no,status=no,scrollbars=yes')">InsertTicket</button>
	</div>
	<div>
	<form>
		<table id="ticketListTable" border="3">
			<tr>
				<td>TicketID</td>
				<td>No</td>
				<td>ScreenID</td>
				<td>MemberID</td>
				<td>McardID</td>
				<td>CouponID</td>
				<td>Movie</td>
				<td>Theater</td>
				<td>Screen</td>
				<td>TicketDate</td>
				<td>Count</td>
				<td>Seat1</td>
				<td>Seat2</td>
				<td>Seat3</td>
				<td>Seat4</td>
				<td>Seat5</td>
				<td>Seat6</td>
				<td>Seat7</td>
				<td>Seat8</td>
				<td>BuyDate</td>
				<td>BuySum</td>
				<td>BuyType</td>
				<td>Phone</td>
				<td>IsCancel</td>
				<td>CancelDate</td>
				<td>
				<button onclick="deleteTicket(this)"></button>
				<select form="">
					<option selected="selected" onclick="selectAllScreenID(this)">1</option>
				</select>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>