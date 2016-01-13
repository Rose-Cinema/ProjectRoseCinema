<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="resource/jquery.bxslider.min.js"></script>
<link href="resource/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript">

$(document).ready(function(){
	  $('.imagebox').bxSlider({
	  auto: true,
	  autoControls: true
	  });
	});

</script>
<body>
<ul class="imagebox">
  <li><img src="resource/daeho00.jpg" /></li>
  <li><img src="resource/daeho01.jpg" /></li>
  <li><img src="resource/daeho02.jpg" /></li>
  <li><img src="resource/daeho03.jpg" /></li>
 
</ul>

</body>