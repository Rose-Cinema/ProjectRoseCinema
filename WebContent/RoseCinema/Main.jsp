<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rose Cinema</title>
<style type="text/css">
ul,ol {
	list-style: none;
	margin-top: 0;
	margin-bottom: 10px;
}
li {
	margin : 5px;
	border : 5px;
	float: left;
}
html,body{
	height: 100%;
}
body {
	margin: 0;
}
#footer{
	margin-top: -1;
	height: 1.9;
}
a {
	background: transparent;
}
a:FOCUS {
	outline: thin dotted; 
}
a:ACTIVE,
a:HOVER {
	outline: 0;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function showMenu(menuId) {
		$("#mainForm input[name=menuId]").val(menuId);
		if(arguments.length > 1) {
			for(var i=1; i<arguments.length; i++) {
				if (i==1) {
					$('form#mainForm').append("<input type='hidden' name='p' value='' " + arguments[i] + "' />'");
				} else {
					$('form#mainForm').append("<input type='hidden' name='p "+i+"' value='' " + arguments[i] + "' />'");
				}
			}
		}
		$('#mainForm').submit();
	}	
</script>
</head>
<body>
	<div class="navigation">
		<ul>
			<li><a href="" class="">HOME</a></li>
			<li><a href="/RoseCinema/showMovieMenu" class="">MOVIE</a></li>
			<li><a href="" class="">THEATER</a></li>
			<li><a href="" class="">LOGIN</a></li>
		</ul>
	</div>
	
	<form id="mainForm" method="get">
		<input type="hidden" name="menuId" value=""/>
	</form>
	
	<iframe src="theaterList.jsp" id="footerList" title="극장목록" frameborder="0" scrolling="no"></iframe>
	<div id="footer">
		<ul>
			<li><a>회사소개</a></li>
			<li><a>채용정보</a></li>
			<li><a>제휴/광고/부대사업 문의</a></li>
			<li><a>이용약관</a></li>
			<li><a>개인정보취급방침</a></li>
			<li><a href="/RoseCinema/showCenterMenu">고객센터</a></li>
		</ul>
	</div>
</body>
</html>