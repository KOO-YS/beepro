<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:900px; height:730px; margin-left:-200px;">
      <div class="modal-header" style="background-color:rgba(75,97,207);">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white;">
           <b>이슈 생성하기</b>
         </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color:white;">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
      
      <!-- 폼태그 시작 -->
        <form action="./issue" method="post">
          <div style="margin-top:10px;">
          <p id="title">이슈 이름<span style="color:red;"> *</span></p>
            <input type="form-control" name="i_title" size="99">
          </div>
            
            <div id="box">
                        <p id="title" style="margin-top:35px;">프로젝트 명<span style="color:red;"> *</span></p>
                          <select style="width:350px;">
                           <option value="null">대상 선택</option>
                           
                           <!-- 생성된 프로젝트들을 목록으로 자동 추가되는 기능 구현하는 부분입니다. -->
                           
                        </select>
            </div>
                    
            <div id="box2">
                          <p id="title" style="margin-top:35px;">이슈 타입<span style="color:red;"> *</span></p>
                          <select style="width:180px;">
                           <option value="null">대상 선택</option>
                           <option value="버그" style="color:#ff5792; font-weight:bold;">버그</option>
                           <option value="개선" style="color:#4b61cf; font-weight:bold;">개선</option>
                           <option value="요구사항" style="color:#4abbdb; font-weight:bold;">요구사항</option>
                        </select>
                        
            </div>    

            <div id="box2">
                <p id="title" style="margin-top:35px;">중요도<span style="color:red;"> *</span></p>
                 <select style="width:180px;">
                 <option value="null">대상 선택</option>
                 <option value="심각" style="color:#ff5792; font-weight:bold;">심각</option>
                 <option value="높음" style="color:#fed136; font-weight:bold;">높음</option>
                 <option value="보통" style="color:#4b61cf; font-weight:bold;">보통</option>
                 <option value="낮음" style="color:#4abbdb; font-weight:bold;">낮음</option>
                 </select>
            </div>
            
              <p id="title" style="margin-right:300px; margin-top:-20px;">내용</p>
              <textarea rows="7" cols="99"></textarea>
              
              <div id="box">
               <p id="title" style="margin-top:20px;">작성자</p>
               <input type="text" name="writer" size="45">
              </div>
              
              <div id="box2" style="margin-left:80px;">
                <p id="title" style="margin-top:20px;">기간</p>
                <input type="datetime-local" id='currentDatetime'/>
              </div>
        </form>
      </div>
      
      <div class="modal-footer" style="margin-top:-30px; background-color:#f2f2f2;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><b>취  소</b></button>
        <input type="submit" class="btn btn-primary" value="작 성"></button>
      </div>
    </div>
  </div>
</div>
</body>
</html>