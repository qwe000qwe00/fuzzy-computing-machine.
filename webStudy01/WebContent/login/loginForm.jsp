<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String failedId = request.getParameter("mem_id");
	String message = (String)session.getAttribute("message");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/loginForm.jsp</title>
<script type="text/javascript">
	<%
		if(StringUtils.isNotBlank(message)){
			
	%>
		alert("<%=message%>");
	<%
			session.removeAttribute("message");
		}
	%>
</script>
</head>
<body>
<!-- method ="get"은 정보가 유출된 가능성이 있다. -->
<form action="<%=request.getContextPath() %>/login/loginCheck.jsp" method="post">
   <ul>
      <li>
         아이디 : <input type="text" name="mem_id" value="<%=Objects.toString(failedId,"")%>"/>
      </li>
      
      <li>
         비밀번호 : <input type="password" name="mem_pass"/>
         <input type="submit" value="로그인"/>
      </li>
   </ul>
<!--    이상태로 로그인하면 404에러가 난다 -> 서버가 준비 안되었기 때문 -->
<!--    -> login 폴더에서 jsp를 만든다. -->
</form>


</body>
</html>