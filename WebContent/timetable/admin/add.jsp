<%@ page contentType="text/html; charset=utf-8" %>

<title>상영 시간표 등록</title>

<head>

<jsp:include page="/admin/top_nav.jsp"/>
<script type="text/javascript">
</script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$('#datepicker_year').datetimepicker({
		format: 'YYYY',
		locale: 'ko',
		sideBySide: true
	});
	$('#datepicker_date').datetimepicker({
		format: 'MMDD',
		locale: 'ko',
		sideBySide: true
	});
	$('#datepicker_sdate').datetimepicker({
		format: 'HHmm',
		locale: 'ko',
		sideBySide: true
	});
	$('#datepicker_edate').datetimepicker({
		format: 'HHmm',
		locale: 'ko',
		sideBySide: true
	});
	
	getScreens();
	getMovieList();
});

function getScreens(){
	$('#screen_list').html("<option value='0''>상영관 선택</option>");
	$.ajax({
	    url: "/RoseCinema/screen/theater/"+$('#theater_list').val(),
	    type: 'GET',
	    success: function(result) {
			result.forEach( function(element, index){
	    		$('#screen_list').append("<option value='"+element.screen_id+"''>["+element.screen_id+"] "+element.screen_name+"</option>");
			});
	    }
	});
}

function getMovieList(){
	$('#movie_list').html("<option value='0''>영화 선택</option>");
	$.ajax({
	    url: "/RoseCinema/movies",
	    type: 'GET',
	    success: function(result) {
			result.forEach( function(element, index){
	    		$('#movie_list').append("<option value='"+element.movie_id+"''>["+element.movie_id+"] "+element.movie_name+"</option>");
			});
	    }
	});
}

function addTimetable(){
	var data = {};
	data.theater_id = $('#theater_list').val();
	data.movie_id = $('#movie_list').val();
	data.screen_id = $('#screen_list').val();
	data.year_info = $('#year_info').val();
	data.date_info = $('#date_info').val();
	data.start_time = $('#start_time').val();
	data.end_time = $('#end_time').val();
	data.sale_type = $('#saletype_list').val();
	
	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    url: "/RoseCinema/timetables",
	    type: 'POST',
	    data : JSON.stringify(data),
		dataType : 'json',
	    success: function(result) {
	    	console.log(result);

	    	backList();
	    }
	});
}

function backList(){
	$(location).attr('href', '/RoseCinema/timetable/admin/list');
}

</script>
</head>

<html>
<div class="col-xs-10">
	<table class="table">
		<tr>
			<td>
				<h3>상영 시간표 등록</h3>
				<table class="table">
					<tr>
						<td><label id="theaters">극장 코드</label></td>
						<td colspan="3">
							<select class="form-control" id="theater_list">
								<option value="1" selected>강남본점</option>
								<option value="2">강남점</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="screens">상영관 정보</label></td>
						<td colspan="3">
							<select class="form-control" id="screen_list">
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="movies">상영작</label></td>
						<td colspan="3">
							<select class="form-control" id="movie_list">
							</select>
						</td>
					</tr>
					<tr>
						<td><label>연도</label></td>
						<td colspan="3">
							<div class='input-group date' id='datepicker_year'>
			                    <input type='text' class="form-control" id='year_info'/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
		                </td>
					</tr>
					<tr>
						<td><label>날짜</label></td>
						<td colspan="3">
							<div class='input-group date' id='datepicker_date'>
			                    <input type='text' class="form-control" id='date_info'/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
		                </td>
					</tr>
					<tr>
						<td><label>시작 시간</label></td>
						<td colspan="3">
							<div class='input-group date' id='datepicker_sdate'>
			                    <input type='text' class="form-control" id='start_time'/>
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
		                </td>
					</tr>
					<tr>
						<td><label>종료 시간</label></td>
						<td colspan="3">
							<div class='input-group date' id='datepicker_edate'>
			                    <input type='text' class="form-control" id='end_time' />
			                    <span class="input-group-addon">
			                        <span class="glyphicon glyphicon-calendar"></span>
			                    </span>
			                </div>
		                </td>
					</tr>
					<tr>
						<td><label id="sale_type">판매 타입</label></td>
						<td colspan="3">
							<select class="form-control" id="saletype_list">
								<option value="1">조조</option>
								<option value="2">일반</option>
								<option value="3">심야</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<div style="text-align: right">
					<button type="button" class="btn btn-success" onClick="return addTimetable();">추가</button>
					<button type="button" class="btn btn-warning" onClick="return backList();">돌아가기</button>
				</div>
			</td>
		</tr>
	</table>
</div>
</html>