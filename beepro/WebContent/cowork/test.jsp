<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 

<html> 

<head> 

<meta charset="EUC-KR"> 

<title>Insert title here</title> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/matching/img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="assets/css/jquery-ui.min.css" /> 

  <script src="assets/js/jquery.min.js"></script> 

  <script src="assets/js/jquery-ui.min.js"></script> 

 

  <script src="release/go.js"></script> 

  <script src="extensions/Figures.js"></script> 

  <script src="assets/js/goSamples.js"></script>  <!-- this is only for the GoJS Samples framework --> 

 

  <link rel='stylesheet' href='extensions/DataInspector.css' /> 

  <script src="extensions/DataInspector.js"></script> 

  <script> 

   $(document).ready(function(){ 

 

   var myDiagram = ""; 

   $("#test").on("click",function(){ 

   $("#infoDraggable").css("display","inline-block"); 

    console.log('a'); 

    var inspector = new Inspector('myInfo', null, 

          { 

properties: { 

                  // key would be automatically added for nodes, but we want to declare it read-only also: 

"key": { readOnly: true, show: Inspector.showIfPresent }, 

                  // fill and stroke would be automatically added for nodes, but we want to declare it a color also: 

"fill": { show: Inspector.showIfPresent, type: 'color' }, 

"stroke": { show: Inspector.showIfPresent, type: 'color' } 

    } 

}); 

    }); 

    

   $("#confirm").on("click",function(){ 

   $("#infoDraggable").css("display","none"); 

$.ajax({ 

type : "get", 

url : "GoTestServlet", 

data : { 

selected:$("#selected").val(), 

}, 

dataType : "JSON", 

success : function(data, status, xhr) { 

console.log(data); 

}, 

error : function(xhr, status, error) { 

console.log(error); 

console.log(status); 

} 

}); 

 

   }); 

   }); 

     

  </script> 

  <style type="text/css"> 

        .draggable { 

          display: inline-block; 

          vertical-align: top; 

          border: 4px solid #BBB; 

          border-radius: 4px; 

          background-color: #F5F5F5; 

          position: absolute; 

          top: 20px; 

          left: 20px; 

          z-index: 500; 

        } 

 

        .handle { 

          background-color: lightblue; 

          cursor: move; 

          text-align: center; 

          font: bold 12px sans-serif; 

        } 

 

        #infoDraggable { 

          font: 12px helvetica, sans-serif; 

          min-width: 213px; 

        } 

 

        #myInfo { 

          width: 100%; 

          overflow: hidden; 

        } 

 

        #myPaletteDiv { 

          background-color: #F5F5F5; 

          width: 100%; 

          height: 100%; 

        } 

 

        /* 

    One simple way of making a div fill its space, 

    with allowances for the title (top) and the resize handle (bottom) 

    */ 

        #paletteContainer { 

          position: absolute; 

          bottom: 14px; 

          left: 0px; 

          right: 0px; 

          top: 14px; 

        } 

  </style> 

</head> 

<body> 

<div id="sample"> 

 

    <!-- <div id="paletteDraggable" class="draggable" style="height: 300px;"> 

      <div id="paletteDraggableHandle" class="handle">Palette</div> 

      <div id="paletteContainer"> 

        <div id="myPaletteDiv"></div> 

      </div> 

    </div> --> 

<button id="test">test</button> 

    <div id="infoDraggable" class="draggable" style="display: none; vertical-align: top; padding: 5px; top: 20px; left: 380px;"> 

      <div id="infoDraggableHandle" class="handle">messageClass를 선택하세요</div> 

      <div align="center"> 

      <div id="myInfo"></div> 

      <div> 

      <select id="selected"> 

      <option>aaaaa</option> 

      <option>bbbbb</option> 

      <option>ccccc</option> 

      </select> 

      <button id="confirm">확인</button> 

      </div> 

      </div> 

    </div> 

 

    <!-- <div style="display: inline-block; vertical-align: top; width:400px"> 

      <div id="myDiagramDiv" style="background-color: whitesmoke; border: solid 1px black; height: 400px"></div> 

    </div> --> 

 

</div> 

</body> 

</html> 