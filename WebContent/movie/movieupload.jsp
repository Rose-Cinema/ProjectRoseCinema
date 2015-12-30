<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
		var text = " <img id=\"img\" src="+fName+" alt=\"stilcut\" width=\"220px\" height=\"270px\" /></br>" 
					+ "<input type='file' class='input_textfield' name="+fName+">";
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
</script>
</head>
<body>
	<font size="5"><b>Movie Upload Form</b></font>
	<p/>
	<form action="movie/insert.do" >
	<table>
		<tr>
			<td>��ȭ ����</td>
			<td><input class="text" id="movie_name"/></td>
		</tr>
		<tr>
			<td>��ǥ�̹���</td>
			<div id="UploadedImg"></div>
			<td><input type="file" id="movie_image" onchange="readURL(this)"/></td>
		</tr>
		<tr>
			<td>������ ����</td>
			<td><input type="text" id="open_date"/></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" id="director"/></td>
		</tr>
		<tr>
			<td>�⿬��</td>
			<td><input type="text" id="actor"/></td>
		</tr>
		<tr>
			<td>�帣</td>
			<td>
			<select >
				<c:forEach var="a" items="${alist}">
					<option>${a.genre_name}</option>
				</c:forEach>
				
			</select>
			
			</td>
		</tr>
	</table>
	</form>
	<td>��ƿ��</td>
    <div id="UploadedStil">
      
    <form name="testForm">
	<table>
	<tr> 
		<td align="right"></td>
		<td colspan="3">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr> 
			<td><select name="addText">
				<option value="1">01</option>
				<option value="2">02</option>
				<option value="3">03</option>
				<option value="4">04</option>
				<option value="5">05</option>
				<option value="6">06</option>
				<option value="7">07</option>
				<option value="8">08</option>
				<option value="9">09</option>
				<option value="10">10</option></select>
			<a href="javascript:addFileRow()">�߰�</a></td>
			<td colspan="2"></td>
		</tr>
		
		
		<tr><td colspan="3">
		<img id="stilcut" src="" alt="stilcut" width="220px" height="270px" /></br>
		<input type="file" name="UploadedStil" class="readURL2">
		</td></tr>
		<tr><td colspan="3"><table id="fileTable" align="left" height="10" border="0" cellpadding="0" cellspacing="0"></table></td></tr>  
		
		</table>
		</td>
	</tr>
</table>

<td>������<br/>
			  <file id="video" />
			  <input type="file" name="video" id="video" /></td>

</form>
    </div>
    
     
        <td>
        <input type="submit" value="���" /> <input type="button" value="���" onclick="window.location='movielist.jsp'" />
        </td>
</body>
 
</html>