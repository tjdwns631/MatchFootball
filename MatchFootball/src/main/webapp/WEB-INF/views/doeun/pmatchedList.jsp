<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인경기 이력</title>

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

<body>
	<div id="main" style="height:850px">

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
										경기내역<small>MATCHED</small>
									</h1>
								</div>

								<div id="tr-template">
									<div class="card">
									<c:forEach items="${pmc}" var="mat">
									<c:if test="${mat.MANNER eq null }">
									완료 된 경기 이력이 없습니다.
									</c:if>
									<c:if test="${mat.MANNER ne null }">
										<div class="media mt-0">
											<div class="media-left">
												<img class="media-object rounded-circle" src="#" width="100"
													height="100" alt="">
											</div>
										<input type="hidden" value="${mat.ID}" name="p_id"><br>
											<div class="media-body row" style="position: relative">
												<div class="main-riw col-12 col-sm-6 col-md-8"
													data-photo={{userPhoto}} data-hostphoto={{hostphoto}}>
													
													<p class="text-muted">
														<i class="fas fa-map-marker-alt"> ${mat.F_ADDRESS}</i>
													</p>
													<p class="text-muted" >경기일 : ${mat.M_DATE} </p>
													<div><label>매너 점수</label> ${mat.MANNER} </div>
												</div>
												
											</div>
										</div>
										</c:if>
										</c:forEach>
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