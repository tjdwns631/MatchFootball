<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정페이지</title>

<style>
label { font-size: 22px}
footer {
   position: fixed;
   left: 0px;
   bottom: 0px;
   width: 100%;
   background: grey;
   color: white;
}
</style>
</head>

<body>
<!-- 4 - contained in center example -->
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
    <div class="mx-auto d-sm-flex d-block flex-sm-nowrap">
        <a class="navbar-brand" href="#">${sessionScope.kname}${sessionScope.name}님</a>
        
        <div class="collapse navbar-collapse text-center" id="navbarsExample11">
            <ul class="navbar-nav">
               <c:if test="${sessionScope.t_num ne null }">
                <li class="nav-item active">
                    <a class="nav-link" href="teamInfo?t_num=${sessionScope.t_num }">팀 정보</a>
                </li>
                </c:if>
                <c:if test="${sessionScope.t_num eq null }">
                <li class="nav-item">
                 <a class="nav-link" href="teamMake">팀 생성</a>
              </li>
              </c:if>
              <c:if test="${sessionScope.t_num ne null }">
             <li class="nav-item">
                 <a class="nav-link" href="teamInvite?t_num=${sessionScope.t_num }">팀 초대</a>
             </li>
             </c:if>
             <c:if test="${sessionScope.t_num ne null }">
             <li class="nav-item">
                 <a class="nav-link" href="teamGallery?t_num=${sessionScope.t_num }">팀갤러리</a>
             </li>
             </c:if>
             <c:if test="${sessionScope.t_num ne null }">
             <li class="nav-item">
                 <a class="nav-link" href="teamNotice?t_num=${sessionScope.t_num }">팀 공지</a>
             </li>
             </c:if>
             <li class="nav-item">
                 <a class="nav-link" href="http://localhost/MatchFootball/teamList">팀 리스트</a>
             </li>
             <c:if test="${sessionScope.t_num ne null }">
             <li class="nav-item"><a class="nav-link" href="teamMatchList">팀 매치 내역</a></li>
             </c:if>
            </ul>
        </div>
    </div>
</nav>

   <div align="center">
      <div>
         <h1>팀 공지 수정</h1>
      </div>
      <hr />
   </div>
   
   
   <div>
   <form action="teamNoticeUpdatee" method="post"
      encType="multipart/form-data">
      <article>
         <div class="container" role="main">
               <div class="mb-3" style="float:right;">
                  <label for="reg_id">작성자</label> 
                  <input type="text" class="form-control" name="t_id" id="reg_id" value="${sessionScope.id }" readonly>
               </div>
               
               <div class="mb-3" style="width: 1050px">
                  <label for="title">제목</label> 
                  <input type="text" class="form-control" name="t_title" value="${teamNoticeInfo.t_title }" placeholder="제목을 입력해 주세요." required="required">
               </div>
               
               <div class="mb-3">
                  <label for="content">내용</label>
                  <textarea class="form-control" rows="5" name="t_content" id="content" placeholder="내용을 입력 해주세요." style="height: 250px">${teamNoticeInfo.t_content }</textarea>
               </div>
               
               <input type="text" name="t_num" value="${teamNoticeInfo.t_num }" style="display:none">
               <input type="text" name="n_no" value="${teamNoticeInfo.n_no }" style="display:none">
            <div style="margin: auto; text-align: right;">
               <button type="submit" class="btn btn-primary" id="btnSave">수정</button>
               <button type="button" class="btn btn-danger" id="btnList" onclick="history.back(-1)">취소</button>
            </div>
         </div>
      </article>
   </form>
   </div>
</body>
</html>