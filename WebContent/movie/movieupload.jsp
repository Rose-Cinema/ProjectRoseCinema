<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>영화 업로드</title>
<html>
<head>
<jsp:include page="/admin/top_nav.jsp"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script>
		function readURL(input){
	  		if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$('#UploadedImg').html("<img id=img src=''>");
					$('#img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}  
	  
		}
		function readURL2(input){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$('#UploadedStil').html("<img id=stilcut src=''>");
					$('#stilcut').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}  
		  
		}
		function addFileRow(){ 
			var fo = document.testForm;  
			clearRows();
			
			var oTHead = fileTable.createTHead();
			var oRow, oCell;
			var strHTML;
			var fName;
			for(var i = 2; i <= fo.addText.value; i++)
			{ 
				fName = 'theFile0' + i;
				oRow = oTHead.insertRow() ;
				oCell = oRow.insertCell() ;
				oCell.style.align = "left";
				oCell.style.width = "550" ;
				var text = "<input type='file' class='input_textfield' name="+fName+">";
				//oCell.innerHTML = "<input type='file' class='input_textfield' name="+fName+">" ;
				oCell.innerHTML = text;
			}
		}
		function clearRows(){
			while( fileTable.rows.length != 0 )
			{
				fileTable.deleteRow(0) ;
			}
		} 
	</script>
</head>
<body>
	<font size="5"><b>Movie Upload Form</b></font>
	<p/>
	<form action="/RoseCinema/movie/movieinsert.do" name="testForm" enctype="multipart/form-data" method="post">
	<table border="0">
		<tr>
			<td>영화 제목</td>
			<td><input class="text" name="movie_name"/></td>
		</tr>
		<tr>
			<td>대표이미지</td>
			<div id="UploadedImg"></div>
			<td><input type="file" name="movie_image" onchange="readURL(this)"/></td>
		</tr>
		<tr>
			<td>개봉일 설정</td>
			<td><input type="date" name="opendate"/></td>
		</tr>
		<tr>
			<td>감독</td>
			<td><input type="text" name="director"/></td>
		</tr>
		<tr>
			<td>출연진</td>
			<td><input type="text" name="actor"/></td>
		</tr>
		<tr>
			<td>장르</td>
			<td>
				<select name="genre_id">
					<c:forEach var="a" items="${alist}">
						<option value="${a.genre_id}">${a.genre_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>등급</td>
			<td>
				<select name="grade_id">
					<c:forEach var="b" items="${bgrade}">
						<option value="${b.grade_id}">${b.grade_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>줄거리</td>
			<td>
				<textarea rows="5" cols="20" name="synopsis"></textarea>
			</td>
		</tr>
	</table>

	스틸컷
    <div id="UploadedStil">
	<table>
		<tr> 
			<td align="right"></td>
			<td colspan="3">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr> 
						<td>
							<select name="addText">
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4">04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
							</select>
							<a href="javascript:addFileRow()">추가</a>
						</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="file" name="theFile01" class="readURL2">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<table id="fileTable" align="left" height="10" border="0" cellpadding="0" cellspacing="0"></table>
						</td>
					</tr>  
				</table>
			</td>
		</tr>
	</table>
	동영상<br/>
	<input type="file" name="video" id="video" /><br />
    </div>
    <input type="submit" value="등록" /> 
    <input type="button" value="취소" onclick="window.location='/RoseCinema/movie/movielist.do'" />
</form>        
</body>
 
</html>