<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<title>영화관 안내, 장미극장 입니다.</title>

</head>

<jsp:include page="/top_nav.jsp"/>
<script type="text/javascript">
</script>

<!-- 
<ol class="breadcrumb">
  <li><a href="/RoseCinema">로즈 시네마</a></li>
  <li><a href="/RoseCinema/theaters/main">극장</a></li>
  <li class="active">${theater_name }</li>
</ol>
 -->
<!-- 극장 선택 -->
<jsp:include page="select_cities.jsp"/>


<!-- 영화관 정보 -->
<div class="col-xs-10">
<img src="http://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg"/>
<p>${theater_name }</p>
<p>${adress }</p>
<p>${phone }</p>
<p>${total_screen }관 / ${total_seats }석</p>
</div>

<jsp:include page="${view_type }.jsp"/>


</html>