<%@ page contentType="text/html; charset=utf-8" %>
<!-- jstl -->
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- basic library -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<c:if test="${sessionScope.memId ne 'admin' }">
	
<div style="text-align: center">
	<p>로그인이 필요한 서비스 입니다.</p>
	<p><button type="button" class="btn btn-info" onClick="$(location).attr('href', '/RoseCinema');">홈으로</button></p>
</div>
	
</c:if>
<c:if test="${sessionScope.memId eq 'admin' }">
<ol class="breadcrumb" style="text-align: right">
	<li><a href="/RoseCinema">장미극장 돌아가기</a></li>
	<li><a href="/RoseCinema/logout">로그아웃</a></li>
</ol>
 
<nav class="navbar navbar-default">
	<div role="navigation" class="navbar-header">
		<a class="navbar-brand" href="/RoseCinema/admin"><strong>로즈 시네마 관리자 페이지</strong></a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">영화 관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/movie/movieupload.do">영화 정보 등록</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">티켓관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/ticket/admin.do">티켓 정보 관리</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">극장 관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/theaters/admin/edit/1">강남본점</a></li>
					<li><a href="/RoseCinema/theaters/admin/edit/2">강남점</a></li>
					<li><a href="/RoseCinema/timetable/admin/list">상영시간표 관리</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">이벤트 관리<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/event" >이벤트 등록</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
</c:if>
</body>
</html>