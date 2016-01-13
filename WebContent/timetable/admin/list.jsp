<%@ page contentType="text/html; charset=utf-8" %>

<title>상영 시간표 상세 정보</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$('#date_list').val(1);
	getPlayDatesAll();
	
});

function getPlayDatesAll(){
	$('#date_list').html("<option value='0'>날짜 선택</option>");
	$.ajax({
	    url: "/RoseCinema/timetable/dates",
	    type: 'GET',
	    success: function(result) {
			for( var i in result ){
				var date = ""+result[i];
				var index = Number(i)+1;
				$('#date_list').append("<option value='"+index+"''>"+date+"</option>");
			}
			$('#date_list').val(1);
			getTimetableData();
	    }
	});
}

function getTimetableData(){
	$('#timetables').html("");
	var theater_id = $('#theater_list').val();
	var date = $("#date_list option:selected").text();
	var timetable_url = timetable_url = "/RoseCinema/timetable/theater/"+theater_id+"/date/"+date;

	$.ajax({
	    url: timetable_url,
	    type: 'GET',
	    success: function(result) {
			var timetable = result;
			var movie = {};
			if( timetable.length == 0 )
			{
				$('#timetables').append('<tr><td>상영 정보가 없습니다.</td></tr>');
				return;
			}
			
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
			    	contents += " onClick='return getInfo("+t_info.timetable_id+");'";
			    	contents += ">";
		    		contents += t_info.start_time;
		    		contents += "</button>";
		    		//contents += "</td><td>";
		    		//contents += "잔여석 : "+t_info.remain_seats;
		    		contents += "</td></tr>";
		    	}
		    	$('#timetables').append(contents);
			}
	    }
    });
}

function getInfo(timetable_id){
	$(location).attr('href', '/RoseCinema/timetable/admin/info/'+timetable_id);
}

function addTimetable(){
	$(location).attr('href', '/RoseCinema/timetable/admin/add');
}

</script>

<div class="col-xs-8">
	<table class="table">
		<tr>
			<td>
				<select class="form-control" id="theater_list">
					<option value="0">극장 선택</option>
					<option value="1" selected>강남본점</option>
					<option value="2">강남점</option>
				</select>
			</td>
			<td>
				<select class="form-control" id="date_list"></select>
			</td>
			<td>
				<button type='button' class='btn btn-default' onClick="return getTimetableData();">조회</button>
				<button type='button' class='btn btn-success' onClick="return addTimetable();">새 정보 추가</button>
			</td>
		</tr>
	</table>
	
	<table>
		<tbody id="timetables"></tbody>
	</table>
</div>

<div>
</div>
