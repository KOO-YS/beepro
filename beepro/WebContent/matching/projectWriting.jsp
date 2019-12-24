<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEEPRO - 글 작성</title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
<link href="css/jquery.tag-editor.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="common/sub_nav.jsp">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.js"></script>
<script src="js/plugins/tagEditor/jquery.caret.min.js"></script>
<script src="js/plugins/tagEditor/jquery.tag-editor.js"></script>
<script type="text/javascript">
   (function($) {
      function floatLabel(inputType) {
         $(inputType).each(function() {
            var $this = $(this);
            // on focus add cladd active to label
            $this.focus(function() {
               $this.next().addClass("active");
            });
            //on blur check field and remove class if needed
            $this.blur(function() {
               if ($this.val() === '' || $this.val() === 'blank') {
                  $this.next().removeClass();
               }
            });
         });
      }
      
      $(document).ready(function(){
         $('#country').tagEditor({placeholder : '언어 및 프로그램 능력을 작성하세요'});
      });
      // just add a class of "floatLabel to the input field!"
      floatLabel(".floatLabel");
   })(jQuery);
</script>
</head>
<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
   blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
   em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
   b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
   table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
   details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
   output, ruby, section, summary, time, mark, audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   font: inherit;
   font-size: 100%;
   vertical-align: baseline;
}

html {
   line-height: 1;
}

ol, ul {
   list-style: none;
}

table {
   border-collapse: collapse;
   border-spacing: 0;
}

caption, th, td {
   text-align: left;
   font-weight: normal;
   vertical-align: middle;
}

q, blockquote {
   quotes: none;
}

q:before, q:after, blockquote:before, blockquote:after {
   content: "";
   content: none;
}

a img {
   border: none;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
   main, menu, nav, section, summary {
   display: block;
}

/* Colors */
/* ---------------------------------------- */
* {
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

body {
   text-align: center;
   font-family: 'Lato', 'sans-serif';
   font-weight: 400;
}

a {
   text-decoration: none;
}

.info-text {
   text-align: left;
   width: 100%;
   color: rgba(75, 97, 207);
}

header, form {
   padding: 4em 10%;
}

.form-group {
   margin-bottom: 20px;
}

h2.heading {
   font-size: 18px;
   text-transform: uppercase;
   font-weight: 300;
   text-align: left;
   color: rgba(75, 97, 207);
   border-bottom: 1px solid #506982;
   padding-bottom: 3px;
   margin-bottom: 20px;
}

.controls {
   text-align: left;
   position: relative;
}

.controls2 {
   text-align: left;
   position: relative;
}

.controls input[type="text"], .controls input[type="email"], .controls input[type="number"],
   .controls input[type="date"], .controls input[type="tel"], .controls textarea,
   .controls button, .controls select {
   padding: 12px;
   font-size: 14px;
   border: 1px solid #c6c6c6;
   width: 100%;
   margin-bottom: 18px;
   color: #888;
   font-family: 'Lato', 'sans-serif';
   font-size: 16px;
   font-weight: 300;
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   border-radius: 2px;
   -moz-transition: all 0.3s;
   -o-transition: all 0.3s;
   -webkit-transition: all 0.3s;
   transition: all 0.3s;
}

.controls input[type="text"]:focus, .controls input[type="text"]:hover,
   .controls input[type="email"]:focus, .controls input[type="email"]:hover,
   .controls input[type="number"]:focus, .controls input[type="number"]:hover,
   .controls input[type="date"]:focus, .controls input[type="date"]:hover,
   .controls input[type="tel"]:focus, .controls input[type="tel"]:hover,
   .controls textarea:focus, .controls textarea:hover, .controls button:focus,
   .controls button:hover, .controls select:focus, .controls select:hover
   {
   outline: none;
   border-color: #9fb1c1;
}

.controls input[type="text"]:focus+label, .controls input[type="text"]:hover+label,
   .controls input[type="email"]:focus+label, .controls input[type="email"]:hover+label,
   .controls input[type="number"]:focus+label, .controls input[type="number"]:hover+label,
   .controls input[type="date"]:focus+label, .controls input[type="date"]:hover+label,
   .controls input[type="tel"]:focus+label, .controls input[type="tel"]:hover+label,
   .controls textarea:focus+label, .controls textarea:hover+label,
   .controls button:focus+label, .controls button:hover+label, .controls select:focus+label,
   .controls select:hover+label {
   color: rgba(75, 97, 207);
   cursor: text;
}

.controls .fa-sort {
   position: absolute;
   right: 10px;
   top: 17px;
   color: #999;
}

.controls select {
   -moz-appearance: none;
   -webkit-appearance: none;
   cursor: pointer;
}

.controls label {
   position: absolute;
   left: 8px;
   top: 12px;
   width: 60%;
   color: #999;
   font-size: 16px;
   display: inline-block;
   padding: 4px 10px;
   font-weight: 400;
   background-color: rgba(255, 255, 255, 0);
   -moz-transition: color 0.3s, top 0.3s, background-color 0.8s;
   -o-transition: color 0.3s, top 0.3s, background-color 0.8s;
   -webkit-transition: color 0.3s, top 0.3s, background-color 0.8s;
   transition: color 0.3s, top 0.3s, background-color 0.8s;
   background-color: white;
}

.controls label.active {
   top: -11px;
   color: #555;
   background-color: white;
   width: auto;
}

.controls textarea {
   resize: none;
   height: 200px;
}

button {
   cursor: pointer;
   background-color: #1b3d4d;
   border: none;
   color: #fff;
   padding: 12px 0;
   float: right;
}

button:hover {
   background-color: #224c60;
}

.clear:after {
   content: "";
   display: table;
   clear: both;
}

.grid {
   background: white;
}

.grid:after {
   /* Or @extend clearfix */
   content: "";
   display: table;
   clear: both;
}

[class*='col-'] {
   float: left;
   padding-right: 10px;
}

.grid [class*='col-']:last-of-type {
   padding-right: 0;
}

.col-2-3 {
   width: 66.66%;
}

.col-1-3 {
   width: 33.33%;
}

.col-1-2 {
   width: 50%;
}

.col-1-4 {
   width: 25%;
}

@media ( max-width : 760px) {
   .col-1-4-sm, .col-1-3, .col-2-3 {
      width: 100%;
   }
   [class*='col-'] {
      padding-right: 0px;
   }
}

.col-1-8 {
   width: 12.5%;
}
</style>
<body>
	<form action="project.jsp" method="post">
   <div class="container margin-t-100">
         <!--  General -->
         <div class="form-group">
            <h2 class="heading">새 글 작성</h2>
            <div class="controls">
               <input type="text" id="name" class="floatLabel" name="name"
                  placeholder="프로젝트 제목을 입력하세요">

            </div>
            <div class="controls2">
               <input type="text" id="country" class="floatLabel" name="country" data-role="tagsinput" >
            </div>
         </div>
         <div class="grid">
            <div class="col-1-4 col-1-4-sm">
               <div class="controls">
                  <i class="fa fa-calendar"></i>
                  <span class="gray">&nbsp;&nbsp;프로젝트 시작일</span>
                  <input type="date" id="arrive" class="floatLabel" name="arrive" value="">
               </div>
            </div>
            <div class="col-1-4 col-1-4-sm">
               <div class="controls">
                  <i class="fa fa-calendar"></i>
                  <span class="gray">&nbsp;&nbsp;프로젝트 종료일 </span>
                  <input type="date" id="depart" class="floatLabel" name="depart" value="" placeholder="프로젝트 종료" />
               </div>
            </div>
         </div>
         <div class="col-1-3 col-1-3-sm">
            <div class="controls">
               <i class="fa fa-sort"></i> <select class="floatLabel">
                  <option value="selected" selected>지역을 선택하세요</option>
                  <option value="Zuri-zimmer">서울</option>
                  <option value="Zuri-zimmer">강원</option>
                  <option value="Zuri-zimmer">경기</option>
                  <option value="Zuri-zimmer">광주</option>
                  <option value="Zuri-zimmer">경남</option>
                  <option value="Zuri-zimmer">경북</option>
                  <option value="Zuri-zimmer">대구</option>
                  <option value="Zuri-zimmer">대전</option>
                  <option value="Zuri-zimmer">부산</option>
                  <option value="Zuri-zimmer">세종</option>
                  <option value="Zuri-zimmer">울산</option>
                  <option value="Zuri-zimmer">인천</option>
                  <option value="Zuri-zimmer">전북</option>
                  <option value="Zuri-zimmer">전남</option>
                  <option value="Zuri-zimmer">충북</option>
                  <option value="Zuri-zimmer">충남</option>
                  <option value="Zuri-zimmer">제주</option>
               </select>
            </div>
         </div>
         <div class="grid">
            <div class="col-1-3 col-1-3-sm">
               <div class="controls">
                  <i class="fa fa-sort"></i> <select class="floatLabel">
                     <option value="selected" selected>인원을 선택하세요</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="5">5</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                     <option value="8">8</option>
                     <option value="9">9</option>
                     <option value="10">10인 이상</option>
                  </select>
                </div>
               </div>
            </div>
            <br />
            <div class="grid">

               <div class="controls">
                  <p class="info-text margin-b-10">상세 내용</p>
                  <textarea name="comments" class="floatLabel" id="comments"
                     placeholder="상세 내용을 입력하세요."></textarea>
               </div>
               <input type="submit" class="col-1-4 btn btn-primary" style="float: right;"/>
            </div>

         </div>
         <!-- /.form-group -->

      </form>
   </div>
</body>
</html>