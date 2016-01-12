<%@ page contentType="text/html; charset=utf-8" %>
<html>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?v=3.exp&region=KR">
</script>
 <script> 
function initialize() {
	var myLatlng = new google.maps.LatLng('${location_y}', '${location_x}');
	var mapOptions = {
		zoom : 17,
		center : myLatlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(
			document.getElementById('map_canvas'), mapOptions);
	
	var marker = new google.maps.Marker({
		position : myLatlng,
		map : map,
		title : "${theater_name}"
	});
	var infowindow = new google.maps.InfoWindow({
		content : "<p><b>${theater_name}</b></p>"
			+"<p>${adress}</p>"
			+"<p>${phone}</p>",
		maxWidth : 300
	});

	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
}
</script> 

<div class="col-xs-12">
<ul class="nav nav-tabs">
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/timetable">상영 시간표</a></li>
	<li role="presentation" class="active"><a href="/RoseCinema/theaters/${theater_id }/location">위치 안내</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/price">관람료 안내</a></li>
</ul>
</div>

<body onload="initialize()"> 
 <div id="map_canvas"style="width:500px; height:300px;"></div> 
</body>

<address>
  <strong>${theater_name}</strong><br>
  ${adress}<br>
  ${phone}
</address>

</html>