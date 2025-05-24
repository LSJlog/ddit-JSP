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
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
	<form action="">
		<p>게시글 등록</p>
		<p>─────────────────────────────</p>
		제목 : <input type="text"><br/>
		작성자 : <input type="text"><br/>
		내용 : <input type="text"><br/>
		<p>─────────────────────────────</p>
		<input type="button" value="수정" onclick="location.href='boardUpdate.jsp'">
		<input type="button" value="목록" onclick="location.href='boardList.jsp'">
	</form>
</body>
</html>