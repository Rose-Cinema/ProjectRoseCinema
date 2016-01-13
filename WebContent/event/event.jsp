<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/admin/top_nav.jsp"/>

<div style="text-align: center">
<h2>이벤트 등록</h2>
</div>

<body>
<form action="/RoseCinema/eventPro" method="post" enctype="multipart/form-data">

	<table border="1" align="center">
	<tr>
		<td>
			<font>이벤트 분류</font>
		</td>
		<td colspan="3" cellspacing="0" cellpadding="0">
		<select name="eventtype_id">
		    <option value="1">무대인사</option>
		    <option value="2">쿠폰</option>
		    <option value="3">솔로탈출</option>
	    </select>
	    </td>
	 </tr>
	 <tr>
	 	<td>시작날짜</td>
	 	<td>
			<input type="date" name="estart_date">
		</td>
		<td>종료날짜</td>
		<td>
			<input type="date" name="eend_date">
		</td>
	</tr>
	<tr>
		<td>이벤트명</td>
		<td colspan="3">
			<input type="text" name="event_name">
		</td>
	</tr>
	<tr>
		<td>리스트 이미지</td>
		<td colspan="3">
			<input type="file" name="event_image">
		</td>
	</tr>
	<tr>
		<td>포스터이미지</td>
		<td colspan="3">
			<input type="file" name="event_poster">
		</td>
	</tr>
	<tr>
		<td>쿠폰명</td> <!--DB 정보 출력 -->
		<td colspan="3">
			<select name="coupon_id">				
				<c:forEach var="couponDTO" items="${couponlist}">
					<option value="${couponDTO.coupon_id}">${couponDTO.coupon_name}</option>
				</c:forEach>
			</select>
			<a href="/RoseCinema/coupon" >쿠폰 생성</a>
		</td>
		
	</tr>
	<tr>
		<td>영화정보</td><!--DB 정보 출력 -->
		<td colspan="3">
		
			<select name="timetable">
				<c:forEach var="movieDTO" items="${timeTableInfo }">
					<option value="${movieDTO.timetable_id }" >날짜:${movieDTO.date_info}시작시간:${movieDTO.start_time}-${movieDTO.movie_name}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center"><input type="submit" value="이벤트 등록"/></td>
	</tr>
	</table>
</form>
</body>