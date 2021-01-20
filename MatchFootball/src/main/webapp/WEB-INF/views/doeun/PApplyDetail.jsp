<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인매치 신청내역</title>

<link rel="shortcut icon" href="/heunheuntrip/img/favicon.ico">
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
<link href="../../../lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../../lib/aos/aos.css" rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review.css">
<link
	href="https://fonts.googleapis.com/css?family=Pacifico|ZCOOL+XiaoWei&display=swap&subset=cyrillic"
	rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d91f3d18bd10e8cd72b2f2827dea9f7c&libraries=services"></script>

</head>

<style>
.mb50 {
	margin-bottom: 10px !important;
}

.text-success {
	color: #d3d3d3 !important;
}

.main-title {
	margin-bottom: 15px;
	line-height: 34px;
	color: #777777;
}
</style>
<script>
	function goPage(q) {
		location.href = "matching?page=" + q;
	}
	$(function() {
		$(".riw-delete").on("click", function(event) {
			var m_no = $(this).data("num");
			$.ajax({
				url : "matching/del",
				type : 'POST',
				data : {
					m_no : m_no
				},
				error : function(xhr, status, msg) {
					console.log("상태값 :" + status + "에러" + msg);
				},
				success : function(result) {
					console.log(result);
					alert("신청 취소 되었습니다.")

				}
			});
		});
	})
</script>
<body>
	<div id="main" style="height: 850px">

		<div class="clearfix"></div>
		<div id="content">
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col col-lg-12 col-xl-10">
						<div class="row has-sidebar">

							<jsp:include page="Mybar.jsp"></jsp:include>
							<div class="col-md-7 col-lg-8 col-xl-8">
								<div class="page-header bordered">
									<h1>
										개인 매치 신청내역<small>APPLICATION MATCH</small>
									</h1>
								</div>
								<div align="right">
									<a href="matching"> 개인 매칭 </a>
									<c:if test="${sessionScope.t_num ne null}">
										<a href="teamMatching">| 팀 매칭 신청 |</a>
										<a href="#"> 토너먼트 신청 </a>
									</c:if>
								</div>
								<div id="tr-template">
									<c:forEach items="${p_mat}" var="mat">
										<div style="border: 1px">
											<div class="media mt-0">
												<div class="media-left">
													<img class="media-object rounded-circle" src="#"
														width="100" height="100" alt="">지도 맵
												</div>
												<div class="media-body row" style="position: relative">

													<div class="main-riw col-12 col-sm-6 col-md-8">
														<p class="text-muted">${mat.f_name}</p>
														<p class="text-muted">
															<i class="fas fa-map-marker-alt"> 구장 주소:
																${mat.f_address}</i>
														</p>
														<p class="text-muted">경기 예정일 및 시간: ${mat.m_date}</p>
													</div>
													<div class="riw-btn col-6 col-md-4">
														<c:if test="${mat.gubun eq 'N'}">
															<input type="button" class="btn btn-link riw-delete"
																style="position: absolute; bottom: 50%" value="취소불가능">
														</c:if>
														<c:if test="${mat.gubun eq 'Y'}">
															<button type="button" data-num="${mat.m_no}"
																data-id="${mat.id}" class="btn btn-link riw-delete"
																style="position: absolute; bottom: 50%">신청취소</button>
														</c:if>

													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									<div align="center">
										<my:paging paging="${paging}" jsfunc="goPage" />
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<button class="btn btn-primary btn-circle" id="to-top"
		style="visibility: visible; opacity: 0.5;" onclick="toTop()">
		<!-- 위로가기버튼 -->
		<i class="fa fa-angle-up"></i>
	</button>
</body>

</html>