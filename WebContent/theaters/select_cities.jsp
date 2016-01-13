<%@ page contentType="text/html; charset=utf-8" %>
<html>

<script type="text/javascript">
$(document).ready(function(){

	var theaters = new Array( "#theater1", "#theater2" );
	var theater_id = ${theater_id};
	for( var i in theaters ){
		if( i == theater_id -1 )
			$(theaters[i]).addClass("active");
		else
			$(theaters[i]).removeClass();
	}
	
});
</script>

<ul class="nav nav-pills">
  <li id="theater1" role="presentation"><a href="/RoseCinema/theaters/1/timetable">장미극장 강남점</a></li>
  <li id="theater2" role="presentation"><a href="/RoseCinema/theaters/2/timetable">장미극장 서초점</a></li>
</ul>

</html>