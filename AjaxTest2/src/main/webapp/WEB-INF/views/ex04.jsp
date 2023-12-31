<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EX04</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>

</style>
</head>
<body>

   <h1>Ajax 응답 데이터 형식</h1>

   <div>
      <h2>Text</h2>
      <input type="button" id="btn1" value="클릭">
      <div id="result1"></div>
   </div>

   <div>
      <h2>XML</h2>
      <input type="button" id="btn2" value="클릭">
      <div id="result2"></div>
   </div>

   <div>
      <h2>JSON</h2>
      <input type="button" id="btn3" value="클릭">
      <div id="result3"></div>
   </div>
   


   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
   
   <script>
   
      $('#btn1').click(function() {
         
         $.ajax({
            
            type: 'GET',
            url: '/ajax/ex04data.do',
            
            //data: 'type=1',   //무난
            data: 'type=2',      //비권장
            
            //돌려받을 데이터 형식(text, xml, json);
            //Ex04.java에서도 
            dataType: 'text',
            
            success: function(result) {
               //$('#result1').text(result);
               
               const list = result.split('\r\n');
               
               list.forEach(memo => {
                  //alert(memo);
                  
                  const item = memo.split(',');
                  $('#result1').append('<div>' + item[0] + '</div>');
                  $('#result1').append('<div>' + item[1] + '</div>');
                  $('#result1').append('<div>' + item[2] + '</div>');
               });
               
            },
            error: function(a,b,c) {
               console.log(a,b,c);
            }
            
         });
         
      });
      
      $('#btn2').click(function() {
         
         //단일값
         //다중값
         
         $.ajax({
            type: 'GET',
            url: '/ajax/ex04data.do',
//          data: 'type=3',
            data: 'type=4',
            dataType: 'xml',
            
            /* xml이 result에 반환되었음 */
            success: function(result) {
               
               //alret($(result).find('name').text());
//                $('#result2').append('<div>번호: ' + $(result).find('seq').text() + '</div>');
//                $('#result2').append('<div>이름: ' + $(result).find('name').text() + '</div>');
//                $('#result2').append('<div>암호: ' + $(result).find('pw').text() + '</div>');
//                $('#result2').append('<div>메모: ' + $(result).find('memo').text() + '</div>');
//                $('#result2').append('<div>날짜: ' + $(result).find('regdate').text() + '</div>');
               
//                alert($(result).html());

				//forEach(item, index) => {})동일 == 향상된 for문 
				$(result).find('list > memo').each((index, item) => {
					$('#result2').append('<div>' + $(item).find('seq').text() + '</div>');
					$('#result2').append('<div>' + $(item).find('name').text() + '</div>');
					$('#result2').append('<div>' + $(item).find('pw').text() + '</div>');
					$('#result2').append('<div>' + $(item).find('memo').text() + '</div>');
					$('#result2').append('<div>' + $(item).find('regdate').text() + '</div>');
				});
            },
            error: function(a,b,c) {
               console.log(a,b,c);
            }
            
         });
      });
      
      $('#btn3').click(function() {
         $.ajax({
        	type: 'GET',
        	url: '/ajax/.ex04data.do',
//         	data: 'type=5',
        	data: 'type=6',
        	dataType: 'json',
        	success: function(result){
        		//alert(result.seq);
// 				$('#result3').append('<div>' + result.seq() + '</div>');
// 				$('#result3').append('<div>' + result.name() + '</div>');
// 				$('#result3').append('<div>' + result.pw() + '</div>');
// 				$('#result3').append('<div>' + result.memo() + '</div>');
// 				$('#result3').append('<div>' + result.regdate() + '</div>');

				$(result).each((index, memo) => {
					alert(memo.seq);
				});
        		
        	},
        	error: function(a, b, c){
        		console.log(a, b, c);
        	}
         });
      });
   
   </script>
</body>
</html>