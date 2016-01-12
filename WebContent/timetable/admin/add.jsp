<%@ page contentType="text/html; charset=utf-8" %>

<title>상영 시간표 등록</title>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</head>

<html>
<div class="col-xs-12">
	<table class="table">
		<tr>
			<td>
				<h3>상영 시간표 등록</h3>
				<table class="table">
					<tr>
						<td><label id="theaters">극장 코드</label></td>
						<td colspan="3">
							<select class="form-control" id="theater_list">
								<option value="1">강남본점</option>
								<option value="2">강남점</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="screens">상영관 정보</label></td>
						<td colspan="3">
							<select class="form-control" id="screen_list">
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="movies">상영작</label></td>
						<td colspan="3">
							<select class="form-control" id="movie_list">
							</select>
						</td>
					</tr>
					<tr>
						<td><label id="date">날짜</label></td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td><label id="start_time">시작 시간</label></td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td><label id="end_time">종료 시간</label></td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td><label id="sale_type">판매 타입</label></td>
						<td colspan="3">
							<select class="form-control" id="saletype_list">
								<option value="1">조조</option>
								<option value="2">일반</option>
								<option value="3">심야</option>
							</select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<div style="text-align: right">
					<button type="button" class="btn btn-success">승인</button>
					<button type="button" class="btn btn-danger">취소</button>
				</div>
			</td>
		</tr>
	</table>
</div>
</html>