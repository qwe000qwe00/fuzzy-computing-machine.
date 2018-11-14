<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/applicationDesc.jsp</title>
</head>
<body>
<h4> ServletContext</h4>
<pre>
	<%=application.hashCode() %>
	<a href="<%=request.getContextPath() %>/06/implicitObject.jsp">implicitObject</a>
	<a href="<%=request.getContextPath() %>/desc">DescriptionServlet 으로 가기</a>
	 : 컨텍스트와 해당 컨텍스트를 운영(관리)중인 서버에 대한 정보를 가진 객체.
	 
	 1. 서버에 대한 정보 획득
	 	<%=application.getServerInfo()%>
	 	<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %>
	 	<%=application.getMimeType("test.hwp") %>
	 2. 로그 기록
	 	<%
	 		application.log("명시적으로 기독한 로그 메세지");
	 	%>
	 3. 컨텍스트 파라미터 획득(어플리케이션의 초기화 파라미터) 획득
	 	<%=application.getInitParameter("param1")%>
	 	
	 	<%
	 		Enumeration<String> names = application.getInitParameterNames();
	 		while(names.hasMoreElements()){
	 			out.println(application.getInitParameter(names.nextElement()));
	 		}
	 	%>
	 4. 웹리소스를 획득 : /images/Koala.jpg
	 	<%=application.getRealPath("/images/Koala.jpg") %>
	 	<%
	 		String fileSystemPath = application.getRealPath("/images/Koala.jpg");
	 		File srcFile = new File(fileSystemPath);
	 		File targetFolder = new File(application.getRealPath("/06"));
	 		File targetFile = new File(targetFolder, srcFile.getName());
	 		System.out.println(targetFile.exists());
	 		int pointer = -1; 
	 		byte[] buffer = new byte[1024]; //속도 향상
	 		try(
// 		 		FileInputStream fis = new FileInputStream(srcFile);
	 			InputStream fis = application.getResourceAsStream("/images/Koala.jpg");
		 		FileOutputStream fos = new FileOutputStream(targetFile);
	 		){
	 			while((pointer = fis.read(buffer))!=-1){
	 				fos.write(buffer, 0, pointer); //버터를 0부터 포인터까지
	 			}
	 		}
	 		System.out.println(targetFile.exists());
	 	%>
</pre>
<img src="<%=request.getContextPath() %>/06/Koala.jpg" />
<img src="<%=request.getContextPath() %>/images/Koala.jpg" />
</body>
</html>