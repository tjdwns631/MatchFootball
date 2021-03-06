<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/my_profile.css">
<link
	href="https://fonts.googleapis.com/css?family=Pacifico|ZCOOL+XiaoWei&display=swap&subset=cyrillic"
	rel="stylesheet">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소검색 api -->


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="https://kit.fontawesome.com/e15da187be.js"></script>
<script>
	$(function() {
		if('${mb.id}' ==''){
			alert('회원 정보가 없습니다. 회원정보를 등록해주세요');
		};
		
		function checkExtension(fileName, fileSize) {

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 20971520; //20MB

			if (fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}

			if (regex.test(fileName)) {
				alert('업로드 불가능한 파일이 있습니다.');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}
			return true;
		}

		function preview(arr) {
			arr
					.forEach(function(f) {

						//파일명이 길면 파일명...으로 처리
						var fileName = f.name;
						if (fileName.length > 10) {
							fileName = fileName.substring(0, 7) + "...";
						}

						//div에 이미지 추가
						var str = '<div style="display: inline-flex; padding: 10px;"><li>';
						str += '<span>' + fileName + '</span><br>';

						//이미지 파일 미리보기
						document.getElementById("fileupload").onchange = function() {
							var reader = new FileReader();

							reader.onload = function(e) {
								document.getElementById("image").src = e.target.result;
							};
							reader.readAsDataURL(this.files[0]);
						};
					});//arr.forEach
		}
	});

	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('#postCode').val(data.zonecode); //우편번호
				$('#location1').val(data.address); // 주소
			}
		}).open();
	}
</script>
</head>
<body>
	<form action="updateMem" method="post" encType="multipart/form-data">
						<input value="${kemail}" name="id" type="text"
							style="display: none;">

		<div id="main">
			<div id="content">
				<div class="container">
					<div class="row has-sidebar">

						<div class="col-md-10 col-lg-10 col-xl-10">

							<div class="page-header bordered">
								<h1>
									내 프로필<small>기본 정보 수정</small>
								</h1>
							</div>
							<div class="form-group">
								<label>이름</label>
								<c:if test="${mb.id eq null }">
									<input type="text" class="form-control form-control-lg name"
										name="name" value="${kname}">
								</c:if>
								<c:if test="${mb.id ne null }">
									<input type="text" class="form-control form-control-lg name"
										name="name" value="${mb.name}">
								</c:if>
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="photo">프로필 사진</label>
								<div class="input-group mb-3">
									<div class="custom-file">

										<input type="file" class="custom-file-input" id="fileupload"
											src="${pageContext.request.contextPath}/images/default1.png"
											name="file" autocomplete=off required="required"
											aria-describedby="inputGroupFileAddon01" value="${mb.img }">

										<script>
											document
													.getElementById("fileupload").onchange = function() {
												var reader = new FileReader();

												reader.onload = function(e) {
													document
															.getElementById("img").src = e.target.result;
												};
												reader
														.readAsDataURL(this.files[0]);
											};
										</script>
										<label class="custom-file-label photo" for="inputGroupFile01">파일을
											선택하세요</label>
									</div>
								</div>
								<div id='images-div'>
									<c:if test="${mb.img eq null}">
										<img id="img" name="img" 
											src="${pageContext.request.contextPath}/images/default1.png"
											class="rounded-circle" width="150" 
											style="height: 200px; width: 200px; border: none"  />
									</c:if>
									<c:if test="${mb.img ne null}">
										<img id="img" name="img"
											src="${pageContext.request.contextPath}/images/${mb.img}"
											class="rounded-circle" width="150"
											style="height: 200px; width: 200px; border: none" />
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label>이메일</label>
								<c:if test="${mb.email eq null}">
									<input type="text" name="email" id="email"
										class="form-control form-control-lg email" value="${kemail}"
										required="required">
								</c:if>
								<c:if test="${mb.email ne null}">
									<input type="text" name="email" id="email"
										class="form-control form-control-lg email" value="${mb.email}"
										readonly="readonly">
								</c:if>
							</div>
							<div class="form-group">
								<label class="control-label" for="tel">전화번호</label>
								<div class="row form-group has-feedback in-line">
									<div class="col col-lg-8">
										<input class="form-control form-control-lg required"
											required="required" type="text" data-name='전화번호' name="pnum"
											id="pnum" width="100%" value="${mb.pnum}" />
									</div>
									<!-- <div class="col col-lg-4 tel-div" align="right">
										<button type='button' class='btn btn-primary' id='tel-btn'
											style="height: 48px">인증번호 받기</button>

									</div> -->
									<div id="sms-tag"></div>
								</div>
								<div class="form-group">
									<div class="row form-group has-feedback in-line">
										<label class="control-label" for="address">주소</label>
										<div class="col col-lg-5">
											<input class="form-control form-control-lg required"
												type="text" data-name='우편번호' name="postCode" id="postCode"
												width="30%" placeholder="우편번호" readonly />
										</div>
										<div class="col col-lg-7">
											<input type="button" class='btn btn-primary'
												onclick='openDaumZipAddress()' style="height: 48px"
												value="우편번호 찾기">
										</div>
									</div>
									<input type="text" class="form-control form-control-lg address"
										name="location1" id="location1" value="${mb.location1}"
										readonly>
								</div>
								<div class="form-group">
									<label>활동지역</label> 
									<input type="text" name="location2"
										class="form-control form-control-lg mian" id="location2"
										value="${mb.location2}">
								</div>

								<span class="glyphicon glyphicon-ok form-control-feedback"></span>
								<div class="form-group">
									<div class="row form-group has-feedback in-line" id='checktel'>
										<div class="col col-lg-8">
											<input class="form-control form-control-lg required"
												id='playtel' type="text" placeholder='인증번호를 입력해주세요'
												data-name='전화번호확인' readonly />
										</div>
										<div class="col col-lg-4 checkktel-div">
											<button type="button" class='btn btn-primary'
												disabled="disabled" id="checktel-btn" style="height: 48px">인증
												확인</button>
										</div>
										<span class="glyphicon glyphicon-ok form-control-feedback"></span>
									</div>
									<div class="form-group">
										<label>성별</label> <br> <input type="radio" name="gender"
											id="gender" value="남"
											<c:if test="${mb.gender eq '남'}" >checked="checked"</c:if> checked>남

										<input type="radio" name="gender" value="여" id="gender"
											<c:if test="${mb.gender eq '여'}" >checked="checked"</c:if>>여
									</div>
									<div class="form-group">
										<label>생년월일                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </label> 
										<c:if test="${mb.birth eq null}">
										<input type="text" id="birth" name="birth" id = "birth"
											class="form-control form-control-lg birth"
											required="required">
											</c:if>
											<c:if test="${mb.birth ne null}">
										<input type="text" id="birth" name="birth" id = "birth"
											class="form-control form-control-lg birth"
											value="${mb.birth}" required="required" placeholder="년-월-일 형식">
											</c:if>
									</div>
									<div class="form-group">
										<label>포지션</label><br> <select id="inputState pos"
											class="form-control form-control-lg form-select" name="pos">
											<option value="공격수" id="pos"
												<c:if test="${mb.pos eq '공격수'}"> slected="selected" </c:if>>공격수</option>
											<option value="수비수" id="pos"
												<c:if test="${mb.pos eq '수비수'}"> slected="selected" </c:if>>수비수</option>
											<option value="미드필더" id="pos"
												<c:if test="${mb.pos eq '미드필더'}"> slected="selected" </c:if>>미드필더</option>
											<option value="골키퍼" id="pos"
												<c:if test="${mb.pos eq '골키퍼'}"> slected="selected" </c:if>>골키퍼</option>
										</select>
									</div>
									<div class="form-group">
										<label>실력</label> <br> <input type="radio" name="lv"
											id="lv" value="1"
											<c:if test="${mb.lv eq '1'}" >checked="checked"</c:if> checked>상
										<input type="radio" name="lv" value="2"
											<c:if test="${mb.lv eq '2'}" >checked="checked"</c:if>>중상
										<input type="radio" name="lv" value="3"
											<c:if test="${mb.lv eq '3'}" >checked="checked"</c:if>>중
										<input type="radio" name="lv" value="4"
											<c:if test="${mb.lv eq '4'}" >checked="checked"</c:if>>중하
										<input type="radio" name="lv" value="5"
											<c:if test="${mb.lv eq '5'}" >checked="checked"</c:if>>하
									</div>
									<div class="form-group helper">
										<label>용병</label><br> <input type="radio" name="author2"
											value="Y"
											<c:if test="${mb.author2 eq 'Y'}" >checked="checked"</c:if> checked>신청
										<input type="radio" name="author2" value="N"
											<c:if test="${mb.author2 eq 'N'}" >checked="checked"</c:if>>안
										함
									</div>
								</div>


								<div class="form-group action update">
									<c:if test="${mb.id eq null}">
										<input type="submit" class="btn btn-primary" id='btn1'
											style="height: 48px" value="프로필 등록"
											onclick="javascript: form.action='${pageContext.request.contextPath}/mypage/updateMem';" >
									</c:if>
									<c:if test="${mb.id ne null}">
										<input type="submit" class="btn btn-primary" id='btn1'
											style="height: 48px" value="프로필 변경">
									</c:if>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			</div>
			<button type="button" class="btn btn-primary btn-circle" id="to-top"
				style="visibility: visible; opacity: 0.5;">
				<!-- 위로가기버튼 -->
				<i class="fa fa-angle-up"></i>
			</button>
	</form>
	
</body>


</html>