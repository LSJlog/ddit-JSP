<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
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
                                    	request 내장 객체의 기능과 사용법
                                    </h6>
                                </div>
                                <div class="card-body">
                                	<!-- 
                                		넘겨받은 값 전부를 출력해주세요.
                                		
                                		[출력 예시]
                                		아이디 : a001
                                		비밀번호 : 1234
                                		이름 : 홍길동
                                		성별 : 남자
                                		취미 : 운동, 독서
                                		핸드폰번호 : 010-1234-1234
                                		이메일 : test@n.com
                                		주소 : 대전시 서구 오류동 123
                                		자기소개 : 잘부탁드립니다!
                                		
                                		[추가로 가능한 분들은 진행!]
                                		출력을 완료했으면 5초 뒤에 www.naver.com 홈페이지로 이동시켜주세요.
                                	 -->
                                	 <%
                                	 	request.setCharacterEncoding("UTF-8");
                                	 	String id = request.getParameter("id");
                                	 	String pw = request.getParameter("pw");
                                	 	String name = request.getParameter("name");
                                	 	String gender = request.getParameter("gender");
                                	 	String[] hobby = request.getParameterValues("hobby");
                                	 	String hp = request.getParameter("hp");
                                	 	String mail = request.getParameter("mail");
                                	 	String addr = request.getParameter("addr");
                                	 	String self = request.getParameter("self");
                                	 %>
                                	 
                                	 <p>아이디 : <%=id %></p>
                                	 <p>비밀번호 : <%=pw %></p>
                                	 <p>이름 : <%=name %></p>
                                	 <p>성별 : <%=gender %></p>
                                	 <p>취미 : 
                                	 <%
                                	 	if(hobby != null) {
	                                	 	for(int i = 0; i < hobby.length; i++){
	                                	 		out.print(hobby[i] + " ");
	                                	 	}
                                	 	}
                                	 %>
                                	 </p>
                                	 <p>핸드폰 번호 : <%=hp %></p>
                                	 <p>이메일 : <%=mail %></p> 
                                	 <p>주소 : <%=addr %></p>
                                	 <p>자기소개 : <%=self %></p>
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
<script type="text/javascript">
$(function () {
	var a = 0;
	var pTag = $()
})
</script>

</html>