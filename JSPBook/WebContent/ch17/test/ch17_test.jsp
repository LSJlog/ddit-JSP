<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <div id="wrapper">
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"> 
                                    	ch17_test
                                    </h6>
                                </div>
                                <div class="card-body">
                                <!-- 
                                 	문제)
                                 	
                                 	406호 전원의 이름을 ','로 구분하여 각각 나눈후,
                                 	--------------------------------------------------------
                                 	'김'씨 성을 가진 사람 몇명 : 3
                                 	'박'씨 성을 가진 사람 몇명 : 4
                                 	'이'씨 성을 가진 사람 몇명 : 5
                                 	...
                                 	...
                                 	--------------------------------------------------------
                                 	[출력 예]
                                 	
                                 	** 406호 전원의 이름을 넣을때 스크립틀릿을 활용해도 무방
                                 		또는 JSTL로 바로 값을 넣어도 무방
                                 	1. JSTL을 이용하여 작성해주세요.
                                 -->
                                 <%
//                                  	String[] names = {
//                                  			"전지혜", "신현근", "이지영", "김지완", "신국현", "이성일",
//                                  			"고영우", "정재균", "황지현", "박윤수", "변정민", "정은지", "박정수", "조성희",
//                                  			"김민정", "박승우", "김동혁", "이수진", "홍기태", "김민욱", "진현성", "오미나",
//                                  			"구기현", "오대환", "전다미", "배문기", "유이현"
//                                  	};
                                 
                                 	String name = "전지혜,신현근,이지영,김지완,신국현,이성일,고영우,정재균,황지현,박윤수,변정민,정은지,박정수,조성희,김민정,박승우,김동혁,이수진,홍기태,김민욱,진현성,오미나,구기현,오대환,전다미,배문기,유이현";
                                 	Map<String, Integer> map = new HashMap<String, Integer>();
                                 %>
                                 <c:set var="name" value="<%=name %>"/>
                                 <c:set var="map" value="<%=map %>"/>
                                 <c:set value="${fn:split(name, ',') }" var="nameList"/>
                                 
                                 <c:forEach var="i" begin="0" end="${fn:length(nameList) - 1}">
                                		<c:set value="${fn:substring(nameList[i], 0, 1) }" var="fName"/>
                                		<p>[${i }] 당신의 이름은? ${nameList[i] }</p>
<%--                                 		<c:set var="first" value="${nameList[i]}" /> --%>
                                		
                                		<c:set target="${map }" property="${fName }" value="${map.get(fName) + 1 }"/>
                                		
<%--                                 		<p>${first}</p> --%>
                                		<p>${fName}</p>
		                                <hr/>
                                </c:forEach>
                                
                                <c:forEach items="${map }" var="m">
                                	'${m.key }' : ${m.value }<br/>
                                </c:forEach>
                                
                                <c:set value="" var="names"/>
                                <c:set value="${fn:split(names, ',') }" var="name" />
                                
                                <c:set value="0" var="hongCnt" />
                                
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!--     <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>