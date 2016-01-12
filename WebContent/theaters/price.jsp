<%@ page contentType="text/html; charset=utf-8" %>
<html>


<div class="col-xs-12">
<ul class="nav nav-tabs">
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/timetable">상영 시간표</a></li>
	<li role="presentation"><a href="/RoseCinema/theaters/${theater_id }/location">위치 안내</a></li>
	<li role="presentation" class="active"><a href="/RoseCinema/theaters/${theater_id }/price">관람료 안내</a></li>
</ul>
</div>


<div>
	<table class="table" >
		<thead>
			<tr>
				<th scope="col" style="width: 20%;">구분</th>
				<th scope="col" style="width: 20%;">상영시간</th>
				<th scope="col" style="width: 20%;">성인</th>
				<th scope="col" style="width: 20%;">청소년</th>
				<th scope="col" style="width: 20%;">우대</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td rowspan="3">월요일~목요일</td>
				<td>조조</td>
				<td>6,000</td>
				<td>6,000</td>
				<td>5,000</td>
			</tr>
			<tr>
				<td>일반(2회~24시이전)</td>
				<td>9,000</td>
				<td>8,000</td>
				<td>5,000</td>
			</tr>
			<tr>
				<td>심야(24시~)</td>
				<td>8,000</td>
				<td>8,000</td>
				<td>5,000</td>
			</tr>
			<tr>
				<td rowspan="3">금요일~일요일<br />
				공휴일</td>
				<td>조조</td>
				<td>6,000</td>
				<td>6,000</td>
				<td>5,000</td>
			</tr>
			<tr>
				<td>일반(2회~24시이전)</td>
				<td>10,000</td>
				<td>8,000</td>
				<td>5,000</td>
			</tr>
			<tr>
				<td>심야(24시~)</td>
				<td>8,000</td>
				<td>8,000</td>
				<td>5,000</td>
			</tr>
			<tr>
				<td rowspan="2">월요일~목요일<br />
				&nbsp;(3D)</td>
				<td>조조</td>
				<td>8,000</td>
				<td>8,000</td>
				<td>8,000</td>
			</tr>
			<tr>
				<td>일반(2회차~)</td>
				<td>11,000</td>
				<td>9,000</td>
				<td>8,000</td>
			</tr>
			<tr>
				<td rowspan="2">금요일~일요일<br />
				공휴일<br />
				(3D)</td>
				<td>조조</td>
				<td>8,000</td>
				<td>8,000</td>
				<td>8,000</td>
			</tr>
			<tr>
				<td>일반(2회차~)</td>
				<td>12,000</td>
				<td>10,000</td>
				<td>8,000</td>
			</tr>
		</tbody>
	</table>
</div>
<div>
	<table class="table">
		<thead>
		    <tr class="active">
	    		<th colspan="2"><h4>할인 안내</h4></th>
	    	</tr>
	    </thead>
	    <tr>
	        <td><strong>경로우대</strong></td>
	        <td><small>만 65세 이상을 증명할 수 있는 신분증 제시</small></td>
	    </tr>
	    <tr>
	        <td><strong>학생할인</strong></td>
	        <td><small>만18세 이하를 증명할 수 있는 신분증 제시<em>(만 4세이상 ~ 만 18세 이하의 학생 또는 청소년(어린이)에 한함)</em></small></td>
	    </tr>
	    <tr>
	        <td><strong>국가유공자할인</strong></td>
	        <td><small>국가 유공상이자 1급 ~3급에 한해 동반 1인 적용</small></td>
	    </tr>
	    <tr>
	        <td><strong>장애우대할인</strong></td>
	        <td><small>현장에서 복지카드를 소지한 장애인<em>(장애 1~3등급 : 동반 1인까지 적용/ 4~6등급 : 본인만 적용)</em></small></td>
	    </tr>
	    <tr>
	        <td><strong>심야할인</strong></td>
	        <td><small>극장별 심야 할인 이벤트는 각 극장에 문의</small></td>
	    </tr>
	</table>
</div>


</html>