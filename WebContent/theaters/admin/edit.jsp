<%@ page contentType="text/html; charset=utf-8" %>

<title>극장 상세 정보</title>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</head>

<div class="page-header">
	<h1>극장 관리<small>극장 상세 정보</small></h1>
	<p>극장의 정보를 수정하거나 삭제합니다.</p>
</div>


<html>
<div class="col-xs-12">
	<table class="table">
		<tr>
			<td>
				<h3>기본 정보</h3>
				<table class="table">
					<tr>
						<td><label for="theater_name">극장 이름</label></td>
						<td colspan="3"><input type="text" id="theater_name" class="form-control" value="${theater_name}"></td>
					</tr>
					<tr>
						<td><label for="area_id">지역 코드</label></td>
						<td colspan="3"><select id="area_id" class="form-control" ></select></td>
					</tr>
					<tr>
						<td><label for="adress">극장 주소</label></td>
						<td colspan="2"><input type="text" id="adress" class="form-control" value="${adress}"></td>
						<td></td>
					</tr>
					<tr>
						<td><label for="phone">전화 번호</label></td>
						<td colspan="3"><input type="text" id="phone" class="form-control" value="${phone}"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
</html>