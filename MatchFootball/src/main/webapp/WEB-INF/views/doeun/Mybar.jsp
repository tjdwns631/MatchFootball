<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 --><!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css"> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	 <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/selectric.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/Magnific-popup.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/myStyle.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/colors/blue.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Pacifico|ZCOOL+XiaoWei&display=swap&subset=cyrillic" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//사용자 조회 요청
$(function(){
 membersSelect();	
})


function membersSelect() {
   //조회 버튼 클릭
      var id = $('#hiddenId').val();
      //특정 사용자 조회
      $.ajax({
         url:'mybar/'+id,
         type:'GET',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:userSelectResult
      });
}//userSelect

//사용자 조회 응답
function userSelectResult(user) {
	$('#myPoint').val('내 포인트 : ' + comma(user.point));
	
 console.log(user);
}//userSelectResult
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
</script>
</head>
<body>
<div class="col-md-5 col-lg-4 col-xl-4 col-sidebar">

						<div id="sidebar" class="sidebar-left">
						
							
							<div class="sidebar_inner">
								<div class="agent-detail">
									<div class="text-center">
										<div id='profileimg'></div>
										<h4 class="main-name" style="color: #869E9E; font-weight: bold;"></h4>
									</div>
								</div>
								<br>
								<div class="list-group no-border list-unstyled">
									<input type="hidden" id="hiddenId" value="${sessionScope.id}" read only>
									<input class="list-group-item active" href="#" id="myPoint"><br>
									<a href="${pageContext.request.contextPath}/mypage/profile" class="list-group-item profile">
										<i class="far fa-id-card"></i> 내 프로필
									</a> 									 
									<a href="#" class="list-group-item payment"><i class="fas fa-money-check"></i> 결제 | 쿠폰
									</a>  
									<a href="${pageContext.request.contextPath}/mypage/pay" class="list-group-item point">&nbsp;&nbsp;&nbsp;&nbsp;- 포인트 충전 </a> 
									<a href="${pageContext.request.contextPath}/mypage/cupon?m_id=${sessionScope.id }" class="list-group-item coupon">&nbsp;&nbsp;&nbsp;&nbsp;- 내 쿠폰 </a> 
									<a href="${pageContext.request.contextPath}/mypage/usedPoint" class="list-group-item usedpoint">&nbsp;&nbsp;&nbsp;&nbsp;- 포인트 거래 내역 </a> 
									<a href="#" class="list-group-item management"><i class="fas fa-archive"></i> 매칭관리
									</a>
									<a href="${pageContext.request.contextPath}/mypage/matching" class="list-group-item match">&nbsp;&nbsp;&nbsp;&nbsp;- 매칭신청 관리 </a> 
									<a href="${pageContext.request.contextPath}/mypage/matched" class="list-group-item match">&nbsp;&nbsp;&nbsp;&nbsp;- 매칭참여 이력 </a> 
									<a href="#" class="list-group-item msg"><i class="fas fa-envelope-square"></i> 메세지 | 게시글
									</a>
									<a href="${pageContext.request.contextPath}/mypage/msg" class="list-group-item point">&nbsp;&nbsp;&nbsp;&nbsp;- 메세지 </a> 
									<a href="${pageContext.request.contextPath}/mypage/write" class="list-group-item point">&nbsp;&nbsp;&nbsp;&nbsp;- 내가 쓴 게시글 </a>
									<c:if test="${sessionScope.author eq 'user'}">
                        <a href="${pageContext.request.contextPath}/manageremploy" class="list-group-item Manager">&nbsp;&nbsp;&nbsp;&nbsp;매니저 신청페이지</a>
                        </c:if>
                      
								</div>
							</div>
						</div>
					</div>
</body>
</html>