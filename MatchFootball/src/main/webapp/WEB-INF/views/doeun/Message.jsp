<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html style="transform: none;">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메세지</title>

<link
	href="https://fonts.googleapis.com/css?family=Libre+Franklin:100,200,300,400,500,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/selectric.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/Magnific-popup.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/myStyle.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/colors/blue.css"
	rel="stylesheet">
<link href="index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Pacifico|ZCOOL+XiaoWei&display=swap&subset=cyrillic"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	rel="stylesheet">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d91f3d18bd10e8cd72b2f2827dea9f7c&libraries=services"></script>

<style id="theia-sticky-sidebar-stylesheet-TSS">
.theiaStickySidebar:after {
	content: "";
	display: table;
	clear: both;
}
</style>
<script>
	$(function() {
		memberlist();
	});
	

	function memberlist() {
		$.ajax({
			url : "msg/ajax",
			type : 'post',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + "에러" + msg);
			},
			success : memberListResult
		});
	}//memberlist
	function memberListResult(data) {
		$("#toMsg").empty();
		$
				.each(
						data,
						function(idx, mag) {
							$('<tr>')
									.append(
											$(
													'<input type=\'hidden\' id=\'hidden_mno\'>')
													.val(mag.mno))
									.append($('<td>').html('<input type=\'checkbox\'>'))
									.append($('<td>').html(mag.s_date))
									.append($('<td>').html(mag.m_title))
									.append($('<td>').html(mag.send_id))
									.append(
											$(
													'<input type=\'hidden\' id=\'hidden_userId\'>')
													.val(mag.to_id))
									.append(
											$('<td>')
													.html(
															'<button type="button" class="btn btn-primary float-right send-message" id=\'resendMsg\'>답장하기</button>'))
									.appendTo($('#toMsg'));

						});

	};
</script>
</head>

<body>
	<div id="main" style="height: 850px">
		<div id="content">
			<div class="container">

				<div class="row has-sidebar">
					<jsp:include page="Mybar.jsp"></jsp:include>
					<div class="col-md-7 col-lg-8 col-xl-8"
						style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">
						<div class="page-header bordered">
							<input name="to_id" value="${msg.to_id}" type="text"
								style="display: none;">

							<h1 id="item-2">
								메세지<small>MESSAGE</small>
							</h1>
						</div>
						<div align="right">
							<a href="msg" id="받은 메일함"> 수신 쪽지함 |</a><a href="outmsg"
								id="보낸 메일함"> 발신 쪽지함 |</a><a href="#" id="용병초대"> 용병요청 </a>
						</div>
						<div class="row" style="width: auto">
							<div style="margin-top: 15px;">
								<a href="../message"
									class="btn btn-primary float-right send-message">메세지 보내기</a>
							</div>
							<div style="margin-top: 15px;">
								<table border="1" style="width: 100%">
									<tr>
										<td><input type="checkbox"></td>
										<th>날짜</th>
										<th>제목</th>
										<th>보낸 사람</th>
										<td colspan="2" align="right">답장하기
											&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tbody id=toMsg>
									</tbody>
								</table>
								<div align="center">
									<my:paging paging="${paging}" jsfunc="goPage" />
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="item-listing list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="btn btn-primary btn-circle" id="to-top"
		style="visibility: visible; opacity: 0.5;">
		<!-- 위로가기버튼 -->
		<i class="fa fa-angle-up"></i>
	</button>

	<!-- 	<div id="index-template" type="text/x-handlebars-template">
		<div class="item">

			{{else}}
			<div class="row" style="width: auto">
				<div class="col-md-3"></div>
				<div class="col-md-9" style="margin-top: 15px;">
					<a href="#" class="btn btn-primary float-right send-message"
						data-no={{revNo}}>메세지 보내기</a>
					<h3 class="item-title room-title" data-no={{roomNo}}>
						<a href="#"></a>
					</h3>
					<div class="item-location" style="margin-bottom: 0px">
						<i class="far fa-calendar-alt" style="color: #3b8ced;"></i>
						{{checkIn}} - {{checkOut}}
					</div>
					<div class="item-userName">: {{userName}}</div>
					<div class="item-description"
						style="margin-top: 10px; font-size: 17px">
						<i class="fas fa-arrow-right" style="color: #3b8ced;"></i> "
						{{content}} "
					</div>
					<div class="item-actions">{{createdDate}}</div>
				</div>
			</div>
			{{/if}}
		</div>
		{{/each}}
	</div> -->
	<script>
	function goPage(q) {
		location.href = "msg?page=" + q;
	}
	</script>
</body>

</html>