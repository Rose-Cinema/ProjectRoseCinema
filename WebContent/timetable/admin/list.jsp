<%@ page contentType="text/html; charset=utf-8" %>

<title>상영 시간표 상세 정보</title>

<jsp:include page="/admin/top_nav.jsp"/>
<script type="text/javascript">
</script>

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
				$('#date_list').append("<option value='"+date+"''>"+date.substring(0,2)+"월 "+date.substring(2,4)+"일"+"</option>");
				if( i == 0 ){
					$('#date_list').val(date);
				}
			}
			getTimetableData();
	    }
	});
}

function getTimetableData(){
	$('#timetables').html("");
	var theater_id = $('#theater_list').val();
	var date = $("#date_list").val();
	var timetable_url = timetable_url = "/RoseCinema/timetable/theater/"+theater_id+"/date/"+date;

	$.ajax({
	    url: timetable_url,
	    type: 'GET',
	    success: function(result) {
			var timetable = result;
			var movie = {};
			if( timetable.length == 0 )
			{
				$('#timetables').append('<tr><td colspan="3">상영 정보가 없습니다.</td></tr>');
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
			    	contents += button;
			    	contents += " onClick='return getInfo("+t_info.timetable_id+");'";
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

function getInfo(timetable_id){
	$(location).attr('href', '/RoseCinema/timetable/admin/info/'+timetable_id);
}

function addTimetable(){
	$(location).attr('href', '/RoseCinema/timetable/admin/add');
}

</script>

<div class="page-header">
	<h2>상영시간표 관리</h2>
</div>

<div class="col-xs-10">
	<table class="table">
		<thead>
			<tr class="success">
	    		<th colspan="3"><h4>새로 등록하기</h4></th>
	    	</tr>
		</thead>
		<tr>
			<td>
				<button type='button' class='btn btn-success' onClick="return addTimetable();"><b>새 정보 추가</b></button>
			</td>
		</tr>
	</table>
</div>

<div class="col-xs-10">
	<table class="table">
		<thead>
			<tr class="success">
	    		<th colspan="3"><h4>극장 및 시간 선택</h4></th>
	    	</tr>
		</thead>
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
			</td>
		</tr>
	</table>
	
	<table class="table">
		<thead>
			<tr class="success">
	    		<th colspan="3"><h4>상영 시간표</h4></th>
	    	</tr>
			<tr>
				<th scope="col" style="width: 25%;">상영작</th>
				<th scope="col" style="width: 25%;">상영관</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody id="timetables"></tbody>
	</table>
</div>

<div>
</div>
