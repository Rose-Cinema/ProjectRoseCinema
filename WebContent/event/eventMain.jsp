<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>






<nav class="navbar navbar-default navbar-static-top">
  <div class="container">
   	<ul class="nav navbar-nav">
			<li><a href="/RoseCinema/eventMain">전체</a></li>
			<li><a href="/RoseCinema/">로즈시네마 이벤트</a></li>
			<li><a href="/RoseCinema/">영화예매</a></li>
			<li><a href="/RoseCinema/">극장 안내</a></li>
			<li><a href="/RoseCinema/">무대인사</a></li>
			<li><a href="/RoseCinema/">당첨자 발표</a></li>
	</ul>
  </div>
</nav>

	<iframe name="top" width=1100 height=1000 src="./eventList" frameborder="0"> 




<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>

<div class="sub_depth2">
	<ul>
		<li><a href="" class="active">진행중 이벤트</a></li>
		<li><a href="">종료된 이벤트</a></li>
	</ul>	
</div>
<div>
<h1>RoseCinema <small>로즈시네마</small></h1>

</div>




<form action="/RoseCinema/" method="post">
	<table border="1">
		<tr>
			<td><a href="/RoseCinema/">진행중 이벤트</a></td>
			<td><a href="/RoseCinema/">종료된 이벤트</a></td>
		</tr>
		
	</table>
</form>
