<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.contentWrapper {
	max-width: 1024px;
	margin: 0 auto;
	overflow: auto;
}

#main_contents {
	margin: 0 0 70px 0;
	min-height: 500px;
	font-size: 1.05em;
}

.tournament_wrap li .wrap {
	padding: 0 10px;
	list-style: none;
}

.tournament_wrap li {
	float: left;
	width: 33.3%;
	margin-bottom: 20px;
	list-style: none;
}

.tournament_img {
	height: 230px;
	border: 1px solid #e7e7e7;
	border-bottom: 0;
}

.tournament_img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.tournament_info {
	border: 1px solid #e7e7e7;
	padding: 20px 15px;
	text-decoration: none;
}

.tournament_info dl dd {
	color: #737373;
	font-size: 13.65px;
	text-decoration: none;
}

.tournament_info dl dt {
	float: left;
	margin-right: 12px;
	color: #181818;
	background: url(../image/acc01.png) no-repeat 0 8px;
	background-size: 4px;
	text-indent: 10px;
}

.tournament_info .tit {
	color: #2f2f2f;
	font-size: 17px;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="contentWrapper">
		<div id="main_contents">
			<ul class="tournament_wrap">
				<c:forEach items="${tournamentList }" var="tournamentList">
					<li><a
						href="https://baro-match.co.kr/newsite/web/page.php?lang=korean&amp;pcode=31&amp;ggubun=view&amp;ca_code=&amp;or_id=32"
						data-fade="fade" style="text-decoration: none">
							<div class="wrap">
								<div class="tournament_img">
									<img
										src="https://baro-match.co.kr/newsite/../site/_data/on_reservation/1982540371_b5f8280c_2018_ED8FACECB9B4EBA6ACEC8AA4EC9BA8ED8AB8_ED928BEC82B4ED9E88EC96B4EBA19CECA688_ED8FACEC8AA4ED84B0_ECB59CECA285.jpg"
										width="100%">
								</div>

								<div class="tournament_info">
									<p class="tit">${tournamentList.title }</p>
									<dl>
										<dt>대회기간</dt>
										<dd>${tournamentList.s_date } ~ ${tournamentList.e_date }</dd>
									</dl>
									<dl>
										<dt>대회지역</dt>
										<dd>${tournamentList.location }</dd>
									</dl>
									<dl>
										<dt>대회구장</dt>
										<dd>${tournamentList.location }</dd>
									</dl>
									<dl>
										<dt>상금</dt>
										<dd>${tournamentList.point }</dd>
									</dl>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>