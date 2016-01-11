<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/ticket/main.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" >
$(document).ready(function() {
	AjaxTicketList();
});
function AjaxTicketList() {
	$.ajax({
		url:"/RoseCinema/ticket",
		type:"POST",
		data:"",
		cache:false,
		async:false,
		dataType:"JSON",
		
		success : function(result) {
			$.each(result, function(key, value) {
				$("#result").append( "<p>" + "ticket_id :" + value.ticket_id + "</p>");
			}); 
		}
	});
}
</script>
</head>
<body>

Test Main<p/>
<a href="/RoseCinema/goInsertTicketForm.do">Insert Ticket</a><p/>
<a href="/RoseCinema/goDeleteTicketForm.do">Delete Ticket</a><p/>
<a href="/RoseCinema/goUpdateTicketForm.do">Update Ticket</a><p/>
<a href="/RoseCinema/goSelectTicketForm.do">Select Ticket</a><p/>
<div id="ajaxList">

</div>
<input type="button" value="리스트" onClick="AjaxTicketList()">
<a href="/RoseCinema/ticket">gogogogo</a>

<div id="result">

</div>




dtg
</body>
</html>