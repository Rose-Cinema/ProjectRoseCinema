<%@ page contentType="text/html; charset=utf-8" %>
<html>

<script type="text/javascript">
$(document).ready(function(){
	
	getPlayDates();
	getTimetableData();
	
});

function getPlayDates(){

	$.ajax({
	    url: "/RoseCinema/timetable/dates/${theater_id}",
	    type: 'GET',
	    success: function(result) {
	    	var contents = "<tr>";
			for( var i in result ){
				var date = ""+result[i];
				contents += "<td><button type='button' class='btn btn-default' onClick='return getTimetableData(\""+date+"\")'>"+date+"</button></td>";
			}
			contents += "</tr>";
    		$('#select_date').append(contents);
	    }
	});
	
}

function getTimetableData(date){
	$('#timetables').html("");
	var timetable_url = "/RoseCinema/timetable/theater/${theater_id}";
	if( date != null && date != undefined )
		timetable_url = "/RoseCinema/timetable/theater/${theater_id}/date/"+date;

	$.ajax({
	    url: timetable_url,
	    type: 'GET',
	    success: function(result) {
			var timetable = result;
			var movie = {};
			for( var i in timetable ){
				var movie_id = timetable[i].movie_id;
				var screen_id = timetable[i].screen_id;
				
				if( movie[movie_id] == null || movie[movie_id] == undefined )
					movie[movie_id]={};
				if( movie[movie_id][screen_id] == null || movie[movie_id][screen_id] == undefined )
					movie[movie_id][screen_id]=[];
				movie[movie_id][screen_id].push(timetable[i]);
			}
			
			for( var m in movie ){
				addCells(m, movie[m]);
			}
	    }
    });
}

function addCells(movie_id, screens){
	$.ajax({
	    url: "/RoseCinema/movie/"+movie_id,
	    type: 'GET',
	    success: function(result) {
	    	$('#timetables').append('<tr><td>'+result.movie_name+'</td></tr>');
			for( var s in screens ) {
		    	$('#timetables').append('<tr><td>'+s+'관</td></tr>');
		    	var contents = "";
		    	for ( var t in screens[s] ){
		    		var t_info = screens[s][t];
			    	contents += "<tr><td>";
			    	contents += "<button type='button' class=";
			    	var button = "'btn btn-primary'";
			    	if( t_info.sale_type == 1 )
			    		button = "'btn btn-info'";
			    	else if( t_info.sale_type == 3 )
			    		button = "'btn btn-warning'"
			    	if( t_info.remain_seats <= 0 ){
			    		t_info.remain_seats = 0;
			    		button += " disabled=disabled";
			    	}
			    	contents += button;
			    	contents += " onClick='return sendTicketPage("+t_info.timetable_id+");'";
			    	contents += ">";
		    		contents += t_info.start_time;
		    		contents += "</button>";
		    		contents += "</td><td>";
		    		contents += "잔여석 : "+t_info.remain_seats;
		    		contents += "</td></tr>";
		    	}
		    	$('#timetables').append(contents);
			}
	    }
    });
}

function sendTicketPage(timetable_id){
	console.log("click : "+timetable_id);
}
</script>

<div class="col-xs-12">
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a href="/RoseCinema/theaters/${theater_id }/timetable">상영 시간표</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/location">위치 안내</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/price">관람료 안내</a></li>
</ul>
</div>

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

</html>