<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		StringBuffer name = new StringBuffer();
		
// 		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String mail = request.getParameter("mail");
	%>
	
	<p>아이디 : <%=name %></p>
	<p>주소 : <%=addr %></p>
	<p>이메일 : <%=mail %></p>
</body>
</html>