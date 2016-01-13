<%@ page contentType="text/html; charset=utf-8" %>
<!-- jstl -->
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!-- basic library -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<ol class="breadcrumb" style="text-align: right">
<c:choose>
	<c:when test="${sessionScope.memId == null }">
		<li><a onClick="window.open('/RoseCinema/loginForm', 'login', 'width = 280, height = 250'); return false">로그인</a></li>
		<li><a href="/RoseCinema/inputForm">회원가입</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="/RoseCinema/logout">로그아웃</a></li>
	</c:otherwise>
</c:choose>
</ol>

<nav class="navbar navbar-default">
	<div role="navigation" class="navbar-header">
		<a class="navbar-brand" href="/RoseCinema"><strong>로즈 시네마</strong></a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li><a href="/RoseCinema/movie/movielist.do">영화</a></li>
			<li><a href="/RoseCinema">예매</a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">극장<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/theaters/main">로즈 극장</a></li>
					<li><a href="/RoseCinema/screens/special">특별관</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">이벤트<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/eventMain">이벤트</a></li>
				</ul>
			</li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/RoseCinema/mypageForm">내 정보</a></li>
					<li><a href="/RoseCinema/gradehistoryForm">멤버쉽 등급</a></li>
					<li><a href="/RoseCinema/meminfoForm">멤버쉽 포인트</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>

</body>
</html>