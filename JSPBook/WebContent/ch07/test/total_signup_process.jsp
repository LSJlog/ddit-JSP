<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
										회원가입 홈에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서
										일반데이터와 파일명을 저장하여 회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하며
										목록 페이지에서 리스트 데이터를 활용할 수 있도록 해주세요.
										- DAO, VO 활용
										
										2. 회원가입이 완료되면, total_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
									-->
                                	<%	
                                		// 내가 사용중인 프로젝트의 contextPath 경로(JSPBook/resources/images 경로)
                                		// 이클립스상에서의 폴더 경로가 아닌 이클립스에서 만들어낸 프로젝트가 배포되서 생성되는 배포 경로가 되겠다!
                                		String path = request.getServletContext().getRealPath("/resources/images");
                                	
                                		// 파일이 없을 경우 생성
                                    	File tempFile = new File(path);
                                    	if(!tempFile.exists()){
                                    		tempFile.mkdirs();
                                    	}
                                    	
                                    	DiskFileUpload upload = new DiskFileUpload();
                                    	upload.setSizeMax(5 * 1024 * 1024);			// 업로드 할 파일의 최대 크기(byte)
                                    	upload.setSizeThreshold(4096);				// 메모리 상의
                                    	upload.setRepositoryPath(path);
                                    	
                                    	List items = upload.parseRequest(request);
                                    	Iterator params = items.iterator();
                                    	
                                    	Map<String, Object> dataMap = new HashMap<String, Object>();

                                    	int maxSize = 4 * 1024 * 1024;	// 파일 업로드 시 1개의 파일 당 사이즈(최대 사이즈)
                                    	while(params.hasNext()){
                                    		FileItem item = (FileItem) params.next();
                                    		
                                    		if(item.isFormField()){ // 폼 페이지에서 전송된 요청 파라미터가 일반 데이터일 떄
                                    			String name = item.getFieldName();	// 파라미터 이름
                                    			String value = item.getString("UTF-8");
                                    			dataMap.put(name, value);
                                    		} else {	// 파일 데이터일 때
                                    			String fileFieldName = item.getFieldName();	// 파라미터 이름
                                    			String fileName = item.getName();			// 파일명
                                    			
                                    			if(!fileName.equals("")){
                                    				String contentType = item.getContentType();
                                    				long fileSize = item.getSize();
	                                    			File file1 = new File(path + "/" + fileName);
	                                    			item.write(file1);	// 파일 복사
                                    				
	                                    			dataMap.put(fileFieldName,fileName);
                                    			}
                                    			
                                    		}
                                    		
                                    	}
                                    	
                                    	MemberDAO dao = MemberDAO.getInstance();
                                    	MemberVO vo = new MemberVO();
                                    	
                                    	vo.setMem_id(dataMap.get("id").toString());
                                    	vo.setMem_pw(dataMap.get("pw").toString());
                                    	vo.setMem_name(dataMap.get("name").toString());
                                    	vo.setMem_sex(dataMap.get("sex").toString());
                                    	vo.setFilename(dataMap.get("filename").toString());
                                    	
                                    	dao.insertMember(vo);
                                    	
                                    	response.sendRedirect("total_signin.jsp");
                                	%>
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