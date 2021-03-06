<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/hyeongjun/css/style.css" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete : function(data) {
			$('#postCode').val(data.zonecode); //우편번호
			$('#location1').val(data.address); // 주소
		}
	}).open();
}
</script>
<style>
.lili a { color: white; }
.lili {
    padding: 3px 0 3px 0;
    text-indent: 0px;
    line-height: 170%;
    color: white;
}
.btn-primary {
	background-color: #314d9f !important;
}
.btn-primary:hover {
	background-color: #0d6efd !important;
	color: white !important;
}
</style>				
</head>
<body>
<div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>구장등록</h2>
                    </div>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/fieldcommit" method="post" encType="multipart/form-data">
                <div >
                    <div class="col-lg-6 col-md-6">
                        <input type="text" name="f_id" placeholder="id">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" name="name" placeholder="구장이름">
                    </div>
                     <div class="col-lg-6 col-md-6">
                        <input type="text" name="ttype" placeholder="구장분류">
                    </div>
                   <div class="form-group">
								<div class="row form-group has-feedback in-line">
									<label class="control-label" for="address"></label>
									<div class="col col-lg-5">
										<input class="form-control form-control-lg required"
											type="text" data-name='우편번호' name="postCode" id="postCode"
											width="30%" placeholder="우편번호" style="margin-left: 17px; width: 300px;" readonly />
									</div>
									<div class="col col-lg-7">
										<input type="button" class='btn btn-primary' onclick ='openDaumZipAddress()'
											style="height: 50px; margin-left: -154px; width: 180px; color: white;" value="우편번호 찾기">
									</div>
								</div>
								<input type="text" class="form-control form-control-lg address" 
								name="location1" style="margin-left: 17px; width: 1000px;" placeholder="주소" id="location1" readonly>
							</div>
							<div class="form-group">
								<label></label> 
								<input type="text" name="location2" class="form-control form-control-lg mian" 
								style="margin-left: 17px; width: 1000px;" placeholder="상세주소" id="location2">
							</div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" name="price" style="width: 300px" placeholder="가격">
                    </div>
                     <div class="col-lg-6 col-md-6">
                        <input type="file" placeholder="이미지" style="width: 300px" name="uploadFile">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea name="comm" style="width: 1000px; margin-left: -110px;" placeholder="구장 상세 설명"></textarea>
                    </div>
                    <div style="text-align: center;">
                        <button type="submit" class="btn btn-primary site-btn">구장등록</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
</body>
<script src="js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/hyeongjun/js/main.js"></script>
</html>