<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<title>영화관 안내, 장미극장 입니다.</title>

</head>

<%-- 부트스트랩, jquery --%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%-- 내부 스크립트 --%>
<script type="text/javascript">
</script>

<!-- 극장 선택 -->
<jsp:include page="select_cities.jsp"/>

<!-- 영화관 정보 -->
<div>
<p>극장 이름 : ${theater_name }</p>
<p>주소 : ${adress }</p>
<p>전화번호 : ${phone }</p>
<p>총 스크린 수 : ${total_screen }</p>
<p>총 좌석 수 : ${total_seats }</p>
</div>

<jsp:include page="${view_type }.jsp"/>


</html>