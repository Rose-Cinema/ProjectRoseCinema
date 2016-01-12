<%@ page contentType="text/html; charset=utf-8" %>
<html>

<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({
	    url: '/RoseCinema/timetable/theater/${theater_id}',
	    type: 'GET',
	    success: function(result) {
			var timetable = result;
			var theater = {};
			var screen = [];
			for( var i in timetable ){
				console.log(timetable[i]);
			}
	    }
    });
	
});
</script>

<div class="col-xs-12">
<ul class="nav nav-tabs">
	<li role="presentation" class="active"><a href="/RoseCinema/theaters/${theater_id }/timetable">상영 시간표</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/location">위치 안내</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/price">관람료 안내</a></li>
</ul>
</div>



</html>