<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	var c = document.getElementById("myCanvas");
	var ctx = c.getContext("2d");
	ctx.fillStyle = "#FF0000";
	ctx.fillRect(0,0,150,75);
});


</script>
<style type="text/css">
html,body,div,dl,dt,ul,ol,li {margin: 0;padding: 0;font-size: 12px;}
#main{
width: 100%;
}
#main ul li{
	width: 100%;
	position: relative;
	list-style: none;
}
#main ul li img{
	width: 100%;
}
#nav ul{width:1000px;margin:0 auto;text-align:center;}
#nav ul li{float:left;line-height:35px;position:relative;width:16%;}
#nav ul li.cate a{font-size:11px;letter-spacing:2px;}
#nav ul li .sub{position:absolute;display:none;text-align:center;width:100%;}
#nav ul li .sub ul{display:table;width:100%;}
#nav ul li .sub ul li{clear:both;line-height:20px;width:100%;}
#nav ul li .sub ul li a{font-size:11px;}
#nav ul{width:1000px;margin:0 auto;text-align:center;}
#nav ul li{float:left;line-height:35px;position:relative;width:16%;}
#nav ul li.cate a{font-size:11px;letter-spacing:2px;}
#nav ul li .sub{position:absolute;display:none;text-align:center;width:100%;}
#nav ul li .sub ul{display:table;width:100%;}
#nav ul li .sub ul li{clear:both;line-height:20px;width:100%;}
#nav ul li .sub ul li a{font-size:11px;}
#main{width:100%;}
#main ul li{width:100%;position:relative;}
#main ul li img{width:100%;}
#main .scroll_down{width:100%;position:absolute;top:0;}
#main .scroll_down img{display:block;margin:0 auto;width:100px;}
</style>
<title>Ticketing</title>
</head>
<body>
<canvas id="myCanvas" width="200" height="100" style="border: 1px solid #c3c3c3;">

</canvas>
<div id=nav>
	<ul>
		<li class="cate">LOOKBOOK</li>
	</ul>
</div>
<div id="main">
    <ul>
    	<li><video class="video-js vjs-default-skin" loop="" poster="/img/main_1.jpg" preload="metadata" style="margin:0 auto; width:100%;padding:0;" autoplay="" data-setup="{}"><source src="http://stylenanda.cafe24.com/web/design5/150701_KKXXmain.mp4" type="video/mp4"></source></video></li>
    	<li><video class="video-js vjs-default-skin" loop="" poster="/img/main_1.jpg" preload="metadata" style="margin:0 auto; width:100%;padding:0;" autoplay="" data-setup="{}"><source src="http://mvod.megabox.co.kr/encodeFile/3550/2015/12/29/f58a34ffef51922505fc0128b2390f55_W.mp4" type="video/mp4"></source></video></li>
    	<li><video class="video-js vjs-default-skin" loop="" poster="/img/main_1.jpg" preload="metadata" style="margin:0 auto; width:100%;padding:0;" autoplay="" data-setup="{}"><source src="http://mvod.megabox.co.kr/encodeFile/3550/2015/12/29/271170660f3bb051fd3c36600543f10f_W.mp4" type="video/mp4"></source></video></li>
        <li><img src="http://nandaglobal.cafe24.com/web/design5/main_2.jpg" width="100%"/></li>
        <li><img src="http://nandaglobal.cafe24.com/web/design5/main_3.jpg" width="100%"/></li>
    </ul>
</div>
    

    
</body>
</html>