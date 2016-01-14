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
	    	var contents = "<tr><td>";
			for( var i in result ){
				var date = ""+result[i];
				contents += "<button type='button' class='btn btn-default' onClick='return getTimetableData(\""+date+"\")'>"+date.substring(0,2)+"월 "+date.substring(2,4)+"일"+"</button>&nbsp;";
			}
			contents += "</td></tr>";
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
			if( timetable.length == 0 )
			{
				$('#timetables').append('<tr><td colspan="3">상영 정보가 없습니다.</td></tr>');
				return;
			}
			
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
	    	var contents = "<tr>";
	    	contents += "<td rowspan="+Object.keys(screens).length+">"+result.movie_name+"</td>";
			for( var s in screens ) {
		    	contents += "<td>"+s+"관</td>";
			    contents += "<td>";
		    	for ( var t in screens[s] ){
		    		var t_info = screens[s][t];
			    	contents += "<button type='button' class=";
			    	var button = "'btn btn-primary'";
			    	if( t_info.sale_type == 1 )
			    		button = "'btn btn-info'";
			    	else if( t_info.sale_type == 3 )
			    		button = "'btn btn-warning'"
			    	if( t_info.remain_seats <= 0 ){
			    		t_info.remain_seats = 0;
			    		button += " disabled=\"disabled\"";
			    	}
			    	contents += button;
			    	contents += " onClick='return sendTicketPage("+t_info.timetable_id+");'";
			    	contents += " title='잔여석 : "+t_info.remain_seats+"'";
			    	contents += ">";
		    		contents += t_info.start_time.substring(0,2)+"시 "+t_info.start_time.substring(2,4)+"분";
		    		contents += "</button>";
		    		contents += "&nbsp;";
		    	}
	    		contents += "</td>";
		    	contents += "</tr>";
			}
	    	$('#timetables').append(contents);
	    }
    });
}
function sendTicketPage(timetable_id){
	$(location).attr('href', '/RoseCinema/ticket/ticket.do?timetable_id='+timetable_id);
	//alert('예매 시스템 개발 중 : 문의 김준영');
	//console.log("click : "+timetable_id);
}
</script>

<div class="col-xs-10">
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a href="/RoseCinema/theaters/${theater_id }/timetable">상영 시간표</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/location">위치 안내</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/price">관람료 안내</a></li>
</ul>
</div>

<div class="col-xs-10">
</div>

<div class="col-xs-10">
	<table>
		<tbody id="select_date"></tbody>
	</table>
</div>


<div class="col-xs-10">
	<table class="table">
		<thead>
			<tr>
				<th scope="col" style="width: 25%;">상영작</th>
				<th scope="col" style="width: 25%;">상영관</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody id="timetables"></tbody>
	</table>
</div>

</html>