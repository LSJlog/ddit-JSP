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
	1. 게시판 등록 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 
	작성자 : 
	내용 :
	─────────────────────────────
	첨부파일 : [파일 선택 ]
	─────────────────────────────
	[ 등록  ] [ 목록  ]
	
	2. 등록 버튼 클릭 시, 게시글 등록(boardInsert.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 게시판 목록 페이지(boardList.jsp)로 이동해주세요

 -->
 
 	<form action="boardInsert.jsp" >
		<p>게시글 등록</p>
		<p>─────────────────────────────</p>
 		제목 : <input type="text" id="title" name="title"><br/>
 		작성자 : <input type="text" id="writer" name="writer"><br/>
 		내용 : <input type="text" id="content" name="content"><br/>
		<p>─────────────────────────────</p>
		첨부파일 : <input type="file" id="file" name="file">
		<p>─────────────────────────────</p>
		<input type="submit" value="등록">
		<input type="button" value="목록" onclick="location.href='boardList.jsp'">
 	</form>
	
</body>
</html>