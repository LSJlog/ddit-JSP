<%@page import="dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <h1 class="h3 mb-0 text-gray-800">7장 파일업로드</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary"> 
                                    	Commons-FileUpload를 이용한 파일 업로드
                                    </h6>
                                </div>
                                <div class="card-body">
									<!-- 
										1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.
										
										2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
										- DAO, VO를 활용하여 진행할 수 있도록 합니다.
										- DAO, VO까지는 제가 제공해드릴게요.
										
										3. 전달받은 아이디 비밀번호에 해당하는 회원인 경우엔 total_memberList.jsp로 이동하여
										회원 목록 페이지를 완성해주세오.
											- 회원 목록 페이지로 넘어가서 해당 목록 페이지에서 'a001님! 환영합니다!' 메시지를 출력해주세요.
										
										4. 전달받은 아이디 비밀번호에 해당하지 않는 회원인 경우엔 total_signin.jsp로 이동하여
										다시 로그인을 진행할 수 있도록 해주시고, 에러 메시지를 출력해주세요!
									-->
									
									<%
										request.setCharacterEncoding("UTF-8");
									
										String id = request.getParameter("id");
										String pw = request.getParameter("pw");
										
										MemberDAO dao = MemberDAO.getInstance();
										ArrayList<MemberVO> memberList = dao.getMemberList();
										
										if(memberList.size() > 0) {	// 회원 목록 데이터가 존재
											boolean flag = false;	// 존재하지 않을 때 (스위칭역할)
											
											for(MemberVO memberVO : memberList) {
												if(id.equals(memberVO.getMem_id()) && pw.equals(memberVO.getMem_pw())){
													flag = true;	// 회원정보가 존재!
													break;
												}
												
												if(flag) {	// 회원정보가 존재
													response.sendRedirect("total_memberList.jsp?id=" + id);
												} else {
													request.getRequestDispatcher("total_signin.jsp?error=1").forward(request, response);
												}
											}
										} else {
											request.getRequestDispatcher("total_signin.jsp?error=1").forward(request, response);
										}
										
// 										if(memberList.isEmpty() == true) {
// 											request.setAttribute("error", "회원이 존재하지 않습니다.");
// 											request.getRequestDispatcher("total_signin.jsp").forward(request, response);
// 										}
										
										// 3. 로그인 -> 회원목록
// 										if(memberList.isEmpty() == false) {
// 											for(MemberVO mem : memberList) {
// 												if(mem.getMem_id().equals(id) && mem.getMem_pw().equals(pw)){
// 													request.setAttribute("mem", id + "님! 환영합니다!");
// 													request.getRequestDispatcher("total_memberList.jsp").forward(request, response);
// 												} else {
// 													continue;
// 												}
// 											}
// 										}
										
										// 4. 로그인 실패 -> 로그인화면 + 오류 메시지
// 										if(memberList.isEmpty() == false) {
// 											for(MemberVO mem : memberList) {
// 												if(!mem.getMem_id().equals(id)){
// 													request.setAttribute("loginError", "존재하지 않는 회원입니다!");
// 													request.getRequestDispatcher("total_signin.jsp").forward(request, response);
// 												} else {
// 													continue;
// 												}
// 											}
// 										}
										
									%>
									
									<c:set value="<%=id %>" var="id" />
									<c:set value="<%=pw %>" var="pw" />
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

    <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>