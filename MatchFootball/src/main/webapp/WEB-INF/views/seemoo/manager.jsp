<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>매니저관리페이지</title>

<script>
$(function(){
	managerList();
	managerUpdate();
});



function managerUpdate() {
	//업데이트 버튼 클릭
	$('main').on('click','#btnUpdate',function(){
		var userId = $(event.target).closest('tr').find('#hidden_userId').val();
		var author = $(event.target).closest('tr').find("#author").val();
		var result = confirm(userId +"를 "+ author +"로 수정 하시겠습니까?");
		if(result) {
			$.ajax({
				url:'../managerupdate',
				data : {id : userId, author: author},
				dataType:'json',
				error:function(xhr,status,msg){
					console.log("상태값 :" + status + " Http에러메시지 :"+msg);
				}, success: location.reload() 
			});
		}//if
	}); //업데이트 버튼 클릭
}//managerupdate


//사용자 목록 조회 요청
function managerList() {
	$.ajax({
		url:'../manager/ajax',
		//contentType:'application/json;charset=utf-8',
		dataType:'json',
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:managerListResult
	});
}//userList

//사용자 목록 조회 응답
function managerListResult(data) {
	$("#manager_main").empty();
	$.each(data,function(idx,item){
		$('<tr>')
		.append($('<td class="idnum">').html(item.id))    	//매니저아이디
		.append($('<td>').html(item.name))	    //매니저이름
		.append($('<td>').html(item.gender))    //매니저성별
		.append($('<td>').html(item.pnum))    	//매니저연락처
		.append($('<td>').html(item.email))    	//매니저이메일
		.append($('<td>').html(item.location1)) //매니저주소1
		.append($('<td>').html(					//매니저권한
				$('<select id="author" class=\'author\' name="author"> '+
				'<option selected value="">선택</option>'+
				'<option value="manager" name="manager">매니저</option>'+
				'<option value="stop" name="stop">매니저정지</option>'+
				'</select>').val(item.author)))
		.append($('<td>').html(item.point))    	//매니저포인트
		.append($('<td>').html('<button id=\'btnSelect\'class="btn btn-primary">상세조회</button>'))
		.append($('<td>').html('<button id=\'btnUpdate\'class="btn btn-success">권한수정</button>'))
		.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
		.append($('<input type=\'hidden\' id=\'author\'>').val(item.author))
		.appendTo('#manager_main');
	});//each
	$('#dataTable').DataTable();
}//managerListResult

</script>

<style>
.userProfileImg {
	width: 100%;
	display: inline;
	border-radius: 10px;
	float: left;
}

.userInfoTable {
	width: 50%;
	font-size: 25px;
}
.userInfoTable {
    font-size: 25px;
    width: auto;
}
</style>

</head>
<body>
	<!-- 매니저관리 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4">매니저관리</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath}/admin/applymanager">매니저신청 | 승인대기</a>
						<li class="breadcrumb-item active"></li>
						<a href="${pageContext.request.contextPath}/admin/stopmanager">정지된 매니저리스트</a></li>
						</li>
					</ol>
					
					<div class="card mb-4">
						<div class="card-body">
							 <a target="_blank" href="https://www.youtube.com/watch?v=hSEcM3McYyM">매니저 지원 영상</a>
							 <a>/</a>
							 <a target="_blank" href="https://www.kfa.or.kr/img_src/data_rule/2016futsal_laws.pdf">공식 경기규칙</a>
						</div>
					</div>
					
					<!-- 매니저현황 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 매니저 현황
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead align="center">
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th style="width: 40px;">성별</th>
											<th>지역</th>
											<th>매너점수</th>
											<th>포인트</th>
											<th>용병권한</th>
											<th style="width: 90px;">포인트</th>
											<th style="width: 80px;"></th>
											<th style="width: 80px;"></th>
										</tr>
									</thead>
									<tfoot align="center">
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>성별</th>
											<th>연락처</th>
											<th>E-mail</th>
											<th>지역</th>
											<th>권한</th>
											<th>포인트</th>
											<th></th>
											<th></th>
										</tr>
									</tfoot>
									<tbody style="text-align: center;" id="manager_main"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		
		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header" style="margin: auto;">
						<h2 id="name"></h2><a style="margin-top: 16px">님의 프로필</a>
					</div>
					
					<!-- Modal body -->
					<div class="modal-body">
						<table  align="center">
							<img class="userProfileImg" alt="유저이미지" id="img" src="${pageContext.request.contextPath}/images">
							<tr><th>아이디</th><td>:</td><td style="padding-left: 10px" id="id"></td></tr>
							<tr><th>이름</th>	<td>:</td><td style="padding-left: 10px" id="name"></td></tr>
							<tr><th>성별</th><td>:</td><td style="padding-left: 10px" id="gender"></td></tr>
							<tr><th>연락처</th><td>:</td><td style="padding-left: 10px" id="pnum"></td></tr>
							<tr><th>이메일</th><td>:</td><td style="padding-left: 10px" id="email"></td></tr>
							<tr><th>지역</th><td>:</td><td style="padding-left: 10px" id="location1"></td></tr>
							<tr><th>상세지역</th><td>:</td><td style="padding-left: 10px" id="location2"></td></tr>
							<tr><th>권한</th>	<td>:</td><td style="padding-left: 10px" id="author"></td></tr>
							<tr><th>포인트</th><td>:</td><td style="padding-left: 10px" id="point"></td></tr>
						</table>
					</div>
	
					<!-- Modal footer -->
					<div class="modal-footer">
						<button style="text-align: center;" type="button" class="btn btn-danger" data-dismiss="modal">종료</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$("#dataTable").on("click", "#btnSelect", function() {
			//event.stopPropagation();
  			var num = $(event.target).parent().parent().find('.idnum').text();
			modal = $('#myModal');
			$.ajax({
				url : "managerinfo?id=" + num,
				dataType : "json",
				success : function(result) {
					$('#img').attr("src",'${pageContext.request.contextPath}/images/'+result.img);
					$('#id').text(result.id);
					$('#name').text(result.name);
					$('#gender').text(result.gender);
					$('#pnum').text(result.pnum);
					$('#email').text(result.email);
					$('#location1').text(result.location1);
					$('#location2').text(result.location2);
					$('#author').text(result.author);
					$('#point').text(result.point);
					modal.modal('show');
				}
			})
		})
	</script>
	
</body>
</html>