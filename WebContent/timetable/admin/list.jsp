<%@ page contentType="text/html; charset=utf-8" %>

<title>상영 시간표 상세 정보</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	getPlayDatesAll();
	
});

function getPlayDatesAll(){
	$.ajax({
	    url: "/RoseCinema/timetable/dates",
	    type: 'GET',
	    success: function(result) {
	    	var contents = "<tr>";
			for( var i in result ){
				var date = ""+result[i];
				contents += "<td><button type='button' class='btn btn-default' onClick='return getTimetableList(\""+date+"\")'>"+date+"</button></td>";
			}
			contents += "</tr>";
    		$('#select_date').append(contents);
	    }
	});
}

function getTimetableList(){
	
}
</script>

<div>
	<table>
		<tbody id="select_date"></tbody>
	</table>
</div>

<div>
	<table>
		<tbody id="timetables"></tbody>
	</table>
</div>
