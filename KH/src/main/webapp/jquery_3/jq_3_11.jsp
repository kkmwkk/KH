<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼 엘리먼트에서 value 어트리뷰트 값 가져오고, 설정하기 - val()</title>
<script type = "text/javascript" src="../js/jquery.js"></script>
<script type = "text/javascript">
$(function(){
	// 이벤트 핸들러 안쪽의 동작 함수는 언제 호출
	// 사용자가 이벤트를 일으켰을 때
	$('input').keyup(function(){
		var value = $(this).val();
		report(value);
	}).keyup(); // 문서가 로드되어 준비상태가 되면 개발자가 keyup 이벤트를 발생시켜서 
				// 핸들러 안쪽의 동작 함수가 한번 실행되도록 한다.
				// keyup 이벤트는 키를 눌렀다 뗄때 이벤트를 발생시킨다.
				// 이 이벤트는 포커스를 가질 수 있는 요소에만 발생 시킬 수 있다.
				
	$('button').click(function(){
		$('input').val("val 메소드 연습 중");
		// 개발자가 keyup 이벤트를 발새시켜서
		$('input').keyup();
	});
	function report(msg){
		$('#console').text(msg);
	}
});
</script>
</head>
<body>
<button>reset</button>
<input type="text" value="val 메소드 연습 중" size="80">
<div id="console"></div>
</body>
</html>