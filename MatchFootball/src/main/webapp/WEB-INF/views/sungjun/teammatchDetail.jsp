<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'NanumSquareRound' !important;
}

footer {
	left: 0px;
	bottom: 0px;
	width: 100%;
	background: grey;
	color: white;
}

a {
	text-decoration: none !important;
	cursor: pointer;
}

.qqqq {
	position: sticky;
	top: 0;
	padding: 15px;
	font-size: 20px;
	background-color: white;
	border-bottom: 1px solid #ddd;
}

.employ {
	bottom: 0;
	width: 320px;
	background-color: #314d9f;
	padding: 20px 20px;
	color: white;
	text-align: center;
	z-index: 2;
	cursor: pointer;
	width: 320px;
	left: 0;
	right: 0;
	margin: auto;
	bottom: 100px;
	border-radius: 100px;
}

.employ1 {
	bottom: 0;
	width: 320px;
	padding: 20px 20px;
	text-align: center;
	z-index: 2;
	width: 320px;
	left: 0;
	right: 0;
	margin: auto;
	bottom: 100px;
	border-radius: 100px;
	background-color: #ddd;
	color: #999;
}

.lets {
	background-color: white;
	border-top: 1px solid #ddd;
	padding: 20px;
	/* position: fixed; */
	bottom: 0;
	width: 100%;
}

.p1 {
	text-align: center;
	margin: 5px;
	font-size: 20px;
}

.qqqq a {
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 20px;
	font-size: 20px;
}

.ss {
	border-bottom: 3px solid #FFC645;
	font-weight: 800;
	padding-bottom: 15px;
	line-height: 50px;
	color: #314d9f
}

.lista {
	align-items: center;
	cursor: pointer;
	display: flex;
	border-bottom: 1px solid #ddd;
	flex-wrap: nowrap;
	justify-content: space-between;
}

.m-im-t {
	margin: 10px;
	align-items: center;
	justify-content: flex-start;
	flex-wrap: wrap;
}

.tlwn {
	align-items: center;
	padding-right: 15px;
	display: flex;
}
</style>
<script>
	$(function() {
		/*클릭시 css  */
		$(".qqqq").on("click", "a", function() {
			$(".qqqq a").removeClass("ss");
			$(event.target).addClass("ss");
		})

		/* 신청 모달  */
		$(".p1").on("click", function() {
			var m_no = $(this).data("num");
			modal = $("#tmatchaplly");
			$.ajax({
				url : "teammatchDetailm?m_no=" + m_no,
				success : function(result) {
					modal.find('#body4').html(result);
					modal.modal('show');
				}
			});
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div>
			<img src="resources/img/11.jpg" class="d-block w-100" alt="..."
				width="929" height="520">
		</div>
		<div style="margin-left: 200px; margin-right: 200px; margin-top: 30px">

			<div class="tlwn">
				<div style="margin: 10px;">
					<img alt="npe"
						src="${pageContext.request.contextPath}/resources/img/${team.t_logo}"
						style="width: 200px; height: 200px; border-radius: 20%; marging: 5px;" />
				</div>
				<div class="m-im-t">
					<p style="font-weight: bold; font-size: 80px; text-align:;">${teammatch.t_name }</p>
					<p class="wnwnwn" style="font-size: 20px;">2전 1승 1무 1패</p>
					<input type="hidden" value="${teammatch.m_no }" />
				</div>
			</div>

			<div>
				<h3 style="text-align: left;">${teammatch.m_date}
					${teammatch.m_hour}</h3>
			</div>
			<div style="align: left;">
				<h2 style="color: #08088A; font-weight: bold;">${teammatch.f_name}</h2>
			</div>

			<div>
				<h5>${teammatch.f_address}</h5>
			</div>
			<div id="play"
				style="border-bottom: 1px solid #ddd; padding-bottom: 30px;">
				<h5 style="font-weight: bold;">${teammatch.price}원</h5>
			</div>
			<div style="border-bottom: 1px solid #ddd;">
				<div>
					<div id="playroom">
						<h4 style="font-weight: bold; font-size: 50px; margin: 30px;">팀
							정보</h4>
					</div>
					<div>
						<p style="margin:3px;">주장 : ${member.name }</p>
						<p style="margin:3px;">평균 연령대 : ${team.t_age }</p>
						<p style="margin:3px;">팀 Lv : ${team.t_level }</p>
						<p style="margin:3px;">팀소개</p>
						<p style="background-color: #999;margin:3px;">${team.t_info }</p>
					</div>
				</div>
				<p style="font-weight: bold; font-size: 50px; margin: 30px;">남기는 한마디</p>
				<p style="margin: 3px;background-color: #999;">${teammatch.m_info}</p>
			</div>
		</div>
	</div>
	<div class="lets">
		<%-- <c:if test="${p_match.p_max > p_match.f}"> --%>
		<div class="employ">
			<p class="p1" data-num="${teammatch.matchnum }">매치 신청</p>
		</div>
		<%-- </c:if> --%>

		<%-- <c:if test="${p_match.p_max <= p_match.f}"> --%>
		<div class="employ1">
			<p class="p1">마감</p>
		</div>
		<%-- </c:if> --%>
	</div>
	<!--개인매치 신청 모달  -->
	<div class="modal fade" id="tmatchaplly" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body" id="body4">...</div>
			</div>
		</div>
	</div>
</body>
</html>