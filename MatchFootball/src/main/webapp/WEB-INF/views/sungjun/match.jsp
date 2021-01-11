<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style>
.swiper-container {
	height: 100px;
	border: none;
	outline: none;
	border-radius: 7px;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}

.button_match {
	background-color: Transparent;
	border: none;
	outline: none;
	color: black;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
}

img {
	border-radius: 25px;
}

.swiper-container {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	background-color: white;
	padding: 50px;
	font-size: 20px;
}

a {
	text-decoration: none !important;
}

li {
	list-style: none;
}

.pp {
	margin-bottom: 100px;
}

.lista {
	display: flex;
	align-items: center;
}

.listl {
	border-bottom: 1px solid #ddd;
}

.m-im-t {
	font-size: 14px;
	color: #999;
	margin-bottom: 10px;
	align-items: center;
	justify-content: flex-start;
	flex-wrap: wrap;
}

p {
	margin: 0;
}

.aa {
	width: 130px;
	border-radius: 50px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.rr {
	color: red;
}

.bb {
	color: blue;
}

.ww {
	color: white;
}

.blackk {
	color: black;
}

.ss {
	background-color: #314d9f;
	color: white;
	c: if>;
	width: 130px;
	border-radius: 50px;
	padding-top: 7px;
	padding-bottom: 7px;
}

.ap-info {
	background-color: #314d9f;
	border-radius: 10px;
	font-size: 17px;
	color: white;
	text-align: center;
	padding: 10px;
}
.app-info{
	background-color: #ddd;
	border-radius: 10px;
	font-size: 17px;
	color: #999;
	text-align: center;
	padding: 10px;

}
</style>
<script>
$(function() {
	/*클릭시 css  */
	$(".aa").on("click", "a", function() {
		$(".qqqq a").removeClass("ss");
		$(event.target).addClass("ss");
	})
})
</script>
</head>
<body>
	<div class="container"
		style="backgroundcolor: white; width: 100%; flex: 1;">
		<!-- 사진  -->
		<div align="center" style="margin: 40px;">
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<iframe width="929" height="520"
							src="https://www.youtube.com/embed/GKz7d5Wx77s" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div class="carousel-item">
						<img src="resources/img/11.jpg" class="d-block w-100" alt="..."
							width="929" height="520">
					</div>
					<div class="carousel-item">
						<img src="resources/img/22.jpg" class="d-block w-100" alt="..."
							width="929" height="520">
					</div>
					<div class="carousel-item">
						<img src="resources/img/33.jpg" class="d-block w-100" alt="..."
							width="929" height="520">
					</div>
					<div class="carousel-item">
						<img src="resources/img/44.jpg" class="d-block w-100" alt="..."
							width="929" height="520">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleControls"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!--날 짜 선 택  -->

		<!-- 클래스명은 변경하면 안 됨 -->
		<hr>
		<div class="swiper-container" style="margin: 40px">

			<div class="swiper-wrapper" style="cursor: point;">
				<c:set var="week" value="${cal.getIDayOfWeek()}" />

				<c:forEach begin="1" end="${cal.lastDate }" var="i">

					<div class="swiper-slide" style="hover: #314d9f; cursor: point;">
						<fmt:formatNumber var="no" minIntegerDigits="2" value="${i}" />

						<a href="match?m_date=${date}-${no}">
							<div class="aa"
								style="<c:if test="${i == m_dat }">background-color:#314d9f; color:white;</c:if>;">

								<c:set var="weeklist"
									value='<%=new String[]{"일", "월", "화", "수", "목", "금", "토"}%>' />
								<c:choose>
									<c:when test="${i == m_dat }">
										<c:set var="selcol" value="ww" />
									</c:when>
									<c:when test="${week % 7 == 1 }">
										<c:set var="selcol" value="rr" />
									</c:when>
									<c:when test="${week % 7 == 0 }">
										<c:set var="selcol" value="bb" />
									</c:when>
									<c:otherwise>
										<c:set var="selcol" value="blackk" />
									</c:otherwise>
								</c:choose>
								<p class="${selcol}">${i}</p>
								<div style="font-size: 14px;">
									<p class="${selcol}">
										<c:out value="${weeklist[week-1] }" />
									</p>
									<c:set var="week" value="${(week+1) == 7 ? 7 : (week+1)% 7 }" />
								</div>
							</div>
						</a>
					</div>

				</c:forEach>

			</div>

			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>


		<!-- 매치 정보  -->
		<div>
			<div style="display: flex; justify-content: space-between;">
				<div class="button_match">
					<p>매치 리스트</p>
				</div>
				<div>
					<span type="button" class="button_match">모든 매치 <i
						class="fab fa-sistrix"></i></span>
				</div>
			</div>

			<ul style="margin-bottom: 50px;">
				<c:forEach var="p_match" items="${p_matchVO }">
					<li class="listl"><a class="lista" style="cursor: pointer;"
						href="matchDetail?m_no=${p_match.m_no }">
							<div style="text-align: center; width: 10%; font-weight: bold;">
								<p>${p_match.m_hour }</p>
							</div>
							<div class="nameli" style="font-size: 16px; width: 80%;">
								<div>
									<h3>${p_match.f_name }</h3>
								</div>
								<div class="m-im-t">
									<span>⦁ ${p_match.m_type } 매치</span><span>·
										${p_match.p_max }</span> <span>레벨${p_match.lv }Lv</span> <input
										type="hidden" value="${p_match.m_no }">
								</div>
							</div>
							<div style="width: 20%;">
							<c:if test="${p_match.p_max > p_match.f}">
								<p class="ap-info" >신청 가능</p>
							</c:if>
							<c:if test="${p_match.p_max <= p_match.f}">
								<p class="app-info">마감</p>
							</c:if>
									
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>

	</div>
	<script>
		new Swiper('.swiper-container', {

			slidesPerView : 7, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,
			initialSlide:${cal.day-4} ,
			loop : false, //  반복
			resistance : false,
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	</script>
</body>
</html>