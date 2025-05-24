<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 메뉴 페이지를 작성해주세요.
	
	[출력 예시]
	
	메뉴
	_____________________
	[  게시판    ] [  자료실    ]
	
	2. 게시판 버튼을 클릭 시, 게시판 페이지(boardList.jsp)로 이동합니다.
	3. 자료실 버튼을 클릭 시, 자료실 페이지(dropbox.jsp)로 이동합니다.  
 -->
	<p>메뉴</p>
	<p>_____________________</p>
	<input type="button" value="게시판" onclick="location.href='/JSPBook/ch11/test/boardList.jsp'">
	
	<input type="button" value="자료실" onclick="location.href='/JSPBook/ch11/test/dropbox.jsp'">
	
</body>
</html>