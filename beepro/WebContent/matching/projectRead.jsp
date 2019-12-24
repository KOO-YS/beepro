<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.profil{
  background: #f9f9f9;
}
.profil .yacht-info__list li {
    width:25%;
}
.olanaklar-kutu{
  background: #fff;
  border-radius: 10px;
  border: 1px solid rgba(0, 0, 0, 0.125);
  overflow: hidden;
  float: left;
  width: 100%;
  margin: 15px 0px;
  position:relative;
  left:180px;
}
.olanaklar{
  float: left;
  width: 100%;
  position: relative;
  padding: 25px 30px 30px;
}
.margin-top--22{
  margin-top:-22px;
}
.olanaklar-kutu h6{
  color: rgba(75,97,207);
  position:relative;
}
.yacht-info__list img{
    width:20px;
    padding-right:5px;
}
.yacht-info__list {
    list-style: none;
    padding: 0;
    font-size: 16px;
}
.yacht-info__list li {
    padding: 6px 0;
    font-size: 15px;
    display: table;
    height: 100%;
    line-height: 21px;
    float: left;
    width: 50%;
    margin-bottom: 5px;
}

</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<section class="profil  py-5 ">
   <div class="container">
     <div class="row">
         <div class="col-md-8">
              <div class="slider">
                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                      <div style="border-radius: 0.25rem;" class="carousel-inner">
                      </div>
                  </div>
              </div>
             <div class="olanaklar-kutu">
                 <div class="olanaklar">
                  <h6 class="pb-3">프로젝트명</h6>
                  	<ul class="yacht-info__list ">
                  <div id="olanaklar-kutu">
                	  <h6 class="pb-3">언어 및 프로그램 능력</h6>
                  </div>
                  <div id="olanaklar-kutu">
                	  <h6 class="pb-3">프로젝트 시작일</h6>
                	  <h6 class="pb-3">프로젝트 종료일</h6>
                  </div>
                  <div id="olanaklar-kutu">
                	  <h6 class="pb-3"><span>지역:  </span><span>인원:  </span></h6>
                  </div>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그1</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그2</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그3</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그4</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그5</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그6</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그7</span>
                      </li>
                      <li>
                          <img src="https://img.icons8.com/metro/1600/home.png" class="arac-icon" alt="Kiwi standing on oval">
                          <span class="vertical-align-mid">태그8</span>
                      </li>
                  </ul>
              </div>
                 <div class="olanaklar margin-top--22" >
                     <h6 class="pb-3">상세 내용</h6>
                     <p>상세 내용</p>
                 </div>
             </div>
         </div>
         
         </div>
     </div>
     <div>
     <center>
      <button type="button" class="col-1-4 btn btn-primary">수정</button>
      <button type="button" class="col-1-4 btn btn-primary">문의</button>
      <button type="button" class="col-1-4 btn btn-primary">목록</button>
     </center>
   </div>
</section>
</body>
</html>