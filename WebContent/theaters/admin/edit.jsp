<%@ page contentType="text/html; charset=utf-8" %>

<title>극장 상세 정보</title>

<head>
<jsp:include page="/admin/top_nav.jsp"/>
<script type="text/javascript">
var is_add = false;
$(document).ready(function(){
	getScreens();
	
	$('#screen_modal').on('hidden.bs.modal', function (e) {
		is_add = false;
		$('#dialog_screen_id').val('');
		$('#dialog_screen_name').val('');
		$('#dialog_screen_type').val(0);
		$('#dialog_screen_seats').val('');
		$('#dialog_screen_name').attr('readonly', false); 
		$('#dialog_screen_type').attr('disabled', false); 
		$('#dialog_screen_seats').attr('readonly', false); 
		$('#buttons').html("");
	});
});

function closeModal(){
	$('#screen_modal').modal('hide');
}

function getScreens(){
	$('#screen_list').html("<option value='0''>상영관 선택</option>");
	$.ajax({
	    url: "/RoseCinema/screen/theater/"+${theater_id},
	    type: 'GET',
	    success: function(result) {
			result.forEach( function(element, index){
	    		$('#screen_list').append("<option value='"+element.screen_id+"''>["+element.screen_id+"] "+element.screen_name+"</option>");
			});
	    }
	});
}

function addImage(){

	var formObject = $("#theater_image")[0];
	var formData = new FormData(formObject);

	$.ajax( {
		type : "POST",
		url : "/RoseCinema/theaters/admin/upload_image/"+${theater_id},
		data : formData,
		cache : false,
		contentType: false,
		processData: false,
		mimeType:"multipart/form-data",
		success : function(result){
			alert("극장 이미지가 수정되었습니다.");
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus);
		} 
	} );
}

function screenInfo(){
	
	var screen_id = $('#screen_list').val();
	if( screen_id == 0 ){
		return;
	}
	
	$('#dialog_screen_name').attr('readonly', true); 
	$('#dialog_screen_type').attr('disabled', true); 
	$('#dialog_screen_seats').attr('readonly', true); 

	$.ajax( {
		type : "GET",
		url : "/RoseCinema/screen/"+screen_id,
		success : function(result){
			
			$('#dialog_screen_id').val(result.screen_id);
			$('#dialog_screen_name').val(result.screen_name);
			$('#dialog_screen_type').val(result.screen_type);
			$('#dialog_screen_seats').val(result.seat_cnt);

			$('#buttons').append('<button type="button" class="btn btn-danger" onClick="deleteScreen();">삭제</button>');
			$('#buttons').append('<button type="button" class="btn btn-primary" onClick="closeModal();">확인</button>');
		    $('#screen_modal').modal();
		}
	} );
}

function deleteScreen(){
	$.ajax( {
		type : "DELETE",
		url : "/RoseCinema/screen/"+$('#dialog_screen_id').val(),
		success : function(result){
			console.log(result);
			getScreens();
			$('#total_screen').val(Number($('#total_screen').val())-1);
			$('#total_seats').val(Number($('#total_seats').val())-Number($('#dialog_screen_seats').val()));
			$('#screen_modal').modal('hide');
		}
	});
}

function openAddModal(){
	console.log(is_add);
	$('#buttons').append('<button type="button" class="btn btn-primary" onClick="addScreen();">확인</button>');
    $('#screen_modal').modal();
}

function addScreen(){

	var data = {};
	data.theater_id = ${theater_id};
	data.screen_name = $('#dialog_screen_name').val();
	data.screen_type = $('#dialog_screen_type').val();
	data.seat_cnt = $('#dialog_screen_seats').val();
	
	$.ajax( {
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
		type : "POST",
		url : "/RoseCinema/screen",
	    data : JSON.stringify(data),
		dataType : 'json',
		success : function(result){
			console.log(result);
			getScreens();
			$('#total_screen').val(Number($('#total_screen').val())+1);
			$('#total_seats').val(Number($('#total_seats').val())+Number(data.seat_cnt));
			closeModal();
		}
	});

}

function save(){

	var data = {};
	data.theater_name = $('#theater_name').val();
	data.area_id = 1;
	data.adress = $('#adress').val();
	data.phone = $('#phone').val();
	data.location_x = $('#location_x').val();
	data.location_y = $('#location_y').val();

	$.ajax({
	    headers: { 
	        'Accept': 'application/json',
	        'Content-Type': 'application/json' 
	    },
	    url: "/RoseCinema/theaters",
	    type: 'PUT',
	    data : JSON.stringify(data),
		dataType : 'json',
	    success: function(result) {
	    	console.log(result);
	    	
	    	$(location).attr('href', "/RoseCinema/theaters/admin/edit/${theater_id}");
	    }
	});
}


</script>
</head>

<div class="page-header">
	<h2>극장 관리<small>${theater_name}</small></h2>
</div>


<html>
<div class="col-xs-12">
	<table class="table">
		<tr>
			<td>
				<h3>기본 정보</h3>
				<table class="table">
					<tr>
						<td style="width: 25%;"><label for="theater_name">극장 이름</label></td>
						<td colspan="2"><input type="text" id="theater_name" class="form-control" value="${theater_name}" readonly></td>
					</tr>
					<!-- 
					<tr>
						<td><label for="area_id">지역 코드</label></td>
						<td colspan="2"><select id="area_id" class="form-control" ></select></td>
					</tr>
					 -->
					<tr>
						<td style="width: 25%;"><label for="adress">극장 주소</label></td>
						<td colspan="2"><input type="text" id="adress" class="form-control" value="${adress}"></td>
					</tr>
					<tr>
						<td style="width: 25%;"><label for="phone">전화 번호</label></td>
						<td colspan="2"><input type="text" id="phone" class="form-control" value="${phone}"></td>
					</tr>
					<tr>
						<td style="width: 25%;"><label for="location">위치 정보</label></td>
						<td style="width: 37%;"><input type="text" id="location_x" class="form-control" value="${location_x}"></td>
						<td style="width: 38%;"><input type="text" id="location_y" class="form-control" value="${location_y}"></td>
					</tr>
					<tr>
						<td rowspan="2" style="width: 25%;"><label for="location">극장 이미지</label></td>
						<td colspan="2">
							<div class="thumbnail">
								<img src="/RoseCinema/theaters/image/${theater_id }.jpg">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<form id="theater_image">
								<input type="file" id="img_file" name="img_file" accept="image/jpeg">
							</form>
						</td>
						<td>
							<button type="button" class="btn btn-primary" onClick="return addImage();">새로 등록</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<h3>상영관 정보</h3>
				<table class="table">
					<tr>
						<td style="width: 25%;"><label for="theater_name">상영관 리스트</label></td>
						<td style="width: 37%;">
							<select class="form-control" id="screen_list">
							</select>
						</td>
						<td style="width: 38%;">
							<button type="button" class="btn btn-info" onClick="return screenInfo();">상세 정보</button>
							<button type="button" class="btn btn-primary" onClick="is_add = true;return openAddModal();">상영관 정보 등록</button>
						</td>
					</tr>
					<tr>
						<td style="width: 25%;"><label for="total_screen">총 상영관 수</label></td>
						<td colspan="2"><input type="text" id="total_screen" class="form-control" value="${total_screen}" readonly></td>
					</tr>
					<tr>
						<td style="width: 25%;"><label for="total_seats">총 좌석 수</label></td>
						<td colspan="2"><input type="text" id="total_seats" class="form-control" value="${total_seats}" readonly></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			<td>
				<div style="text-align: right">
					<button type="button" class="btn btn-success" onClick="return save();">확인</button>
				</div>
			</td>
		</tr>
	</table>
</div>

<%-- 상영관 정보 조회 --%>
<div class="modal fade" id="screen_modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"	aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="ModalLabel">상영관 정보</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="dialog_screen_id" class="control-label">상영관 ID</label>
						<input type="number" name="dialog_screen_id" id="dialog_screen_id" class="form-control" disabled>
					</div>
					<div class="form-group">
						<label for="dialog_screen_name" class="control-label">상영관 이름</label>
						<input type="text" name="dialog_screen_name" id="dialog_screen_name" class="form-control">
					</div>
					<div class="form-group">
						<label for="dialog_screen_type" class="control-label">상영관 타입</label>
						<select name="dialog_screen_type" id="dialog_screen_type" class="form-control">
							<option value="0">상영관 타입 선택</option>
							<option value="1">일반</option>
							<option value="2">3D</option>
							<option value="3">4D</option>
							<option value="4">IMAX</option>
						</select>
					</div>
					<div class="form-group">
						<label for="dialog_screen_seats" class="control-label">좌석 수</label>
						<input type="number" name="dialog_screen_seats" id="dialog_screen_seats" class="form-control">
					</div>
        		</form>
			</div>
			<div class="modal-footer" id="buttons">
			</div>
		</div>
	</div>
</div>


</html>