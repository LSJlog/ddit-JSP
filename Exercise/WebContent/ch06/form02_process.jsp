<%@page import="java.util.Enumeration"%>
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
		Enumeration paramNames = request.getParameterNames();
		StringBuffer sout = new StringBuffer();
		
		while(paramNames.hasMoreElements()){
			String name = (String) paramNames.nextElement();
			out.println(name + ": ");
			
			String paramValue = request.getParameter(name);
			out.println(paramValue + "<br>");
			
// 			String name = names.nextElement();
		}
	
	%>
</body>
</html>