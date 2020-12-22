<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="transform: none;">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>메세지</title>

  <link rel="shortcut icon" href="/heunheuntrip/img/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Libre+Franklin:100,200,300,400,500,700" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/selectric.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/Magnific-popup.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/myStyle.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/colors/blue.css" rel="stylesheet">
  <link href="index.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Pacifico|ZCOOL+XiaoWei&display=swap&subset=cyrillic"
    rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="/heunheuntrip/html/header.css">

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
</head>

<body style="transform: none; margin-top: 0px;" data-aos-easing="ease" data-aos-duration="400" data-aos-delay="0">
  <div id="main" style="transform: none;">
    <div id='heun-header'></div>
    <div class="container">

    </div>
    <div class="container" style="transform: none;">
      <div class="row justify-content-md-center" style="transform: none;">
        <div class="col col-lg-12 col-xl-10" style="transform: none;">

          <div class="" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

            <div class="page-header bordered mt0">
              <h1>MESSAGE <small>메세지를 주고 받으세요.</small></h1>
            </div>

            <div class="clearfix"></div>
            <div class="item-listing list"></div>
          </div>
        </div>
      </div>
      <button class="btn btn-primary btn-circle" id="to-top" style="visibility: visible; opacity: 1;"><i
          class="fa fa-angle-up"></i></button>
    </div>
    <button class="btn btn-primary btn-circle" id="to-top" style="visibility: visible; opacity: 1;"><i
        class="fa fa-angle-up"></i></button>
  </div>
  <div id='heun-footer'></div>
  <script id="index-template" type="text/x-handlebars-template">
  {{#each list}}
  <div class="item">
    {{#if usrA}}
      <div class="row" style="width: auto">
        <div class="col-md-3">
          <div class="item-image"> <img src="/heunheuntrip/app/json/images/down/{{roomPhoto}}" style="height: 150px; width: 150px;" class="heun-mi rounded-circle" alt=""> </div>
        </div>
        <div class="col-md-9" style="margin-top: 15px;"> <a href="#" class="btn btn-primary float-right send-message" data-no={{revNo}}>메세지 보내기</a>
          <h3 class="item-title room-title" data-no={{roomNo}}><a href="#">{{roomName}}</a></h3>
          <div class="item-location"><i class="fas fa-map-marker-alt" style="color: #3b8ced;"></i>   {{roomAddr}} </div>
          <div class="item-location" style="margin-bottom: 0px"><i class="far fa-calendar-alt" style="color: #3b8ced;"></i>   {{checkIn}} - {{checkOut}} </div>
          <div class="item-description" style="margin-top: 10px; font-size: 17px"><i class="fas fa-arrow-right" style="color: #3b8ced;"></i>    "  {{content}}  "</div>
          <div class="item-actions">{{createdDate}}</div>
        </div>
      </div>
      {{else}}
      <div class="row" style="width: auto">
          <div class="col-md-3">
            <div class="item-image"> <img src="/heunheuntrip/app/json/images/down/{{userPhoto}}" style="height: 150px; width: 150px;" class="heun-mi rounded-circle" alt=""> </div>
          </div>
          <div class="col-md-9" style="margin-top: 15px;"> <a href="#" class="btn btn-primary float-right send-message" data-no={{revNo}}>메세지 보내기</a>
            <h3 class="item-title room-title" data-no={{roomNo}}><a href="#">{{roomName}}</a></h3>
            <div class="item-location" style="margin-bottom: 0px"><i class="far fa-calendar-alt" style="color: #3b8ced;"></i>   {{checkIn}} - {{checkOut}} </div>
            <div class="item-userName"> 예약자 명 : {{userName}}</div>
            <div class="item-description" style="margin-top: 10px; font-size: 17px"><i class="fas fa-arrow-right" style="color: #3b8ced;"></i>    "  {{content}}  "</div>
            <div class="item-actions">{{createdDate}}</div>
          </div>
        </div>
        {{/if}}
    </div>
    {{/each}}
</script>
  <script src='index.js'></script>
</body>

</html>