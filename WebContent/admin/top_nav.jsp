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

<!-- 
<ol class="breadcrumb" style="text-align: right">
<c:choose>
	<c:when test="${sessionScope.memId == null }">
		<li><a href="/RoseCinema/loginForm">로그인</a></li>
		<li><a href="/RoseCinema/inputForm">회원가입</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="/RoseCinema/logout">로그아웃</a></li>
	</c:otherwise>
</c:choose>
</ol>
 -->
 
<nav class="navbar navbar-default">
	<div role="navigation" class="navbar-header">
		<a class="navbar-brand" href="/RoseCinema"><strong>로즈 시네마</strong></a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li><a href="/RoseCinema/timetable/admin/list">상영시간표 관리</a></li>
		</ul>
	</div>
</nav>

</body>
</html>