<%@ page contentType="text/html; charset=utf-8" %>

<jsp:include page="/top_nav.jsp"/>

<div style="text-align: center">
	<p>로그인이 필요합니다.</p>
	<p><button type="button" class="btn btn-info" onClick="window.open('/RoseCinema/loginForm', 'login', 'width = 280, height = 250'); return false;">로그인</button></p>
</div>