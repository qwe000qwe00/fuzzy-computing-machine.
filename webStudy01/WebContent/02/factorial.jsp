<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%!
    	BigDecimal factorial(int operand){
    		if(operand<0){
    			throw new IllegalArgumentException("음수는 팩토리얼 연산 불가");
    		}else if(operand<=1){
    			return new BigDecimal(operand);
    		}else{
    			return new BigDecimal(operand).multiply(factorial(operand-1));
    		}
    }
    %>
    <%
    	String opStr = request.getParameter("operand");
    	boolean flag = false;
    	if(opStr!=null && opStr.matches("\\d{2}|100")){
    		flag = true;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/factorial.jsp</title>
</head>
<body>
<%!
// 	private long factorial(int operand){
// 		if(operand == 1){
// 			return 1;
// 		}else{
// 			return factorial(operand - 1)*operand;
// 		}
// 	}
%>
<form action="<%=request.getContextPath() %>/02/factorial.jsp">
	Factorial operand : <input type="number" min="1" max="100" name="operand" value="<%=opStr %>" />
	<button type="submit">전송</button>
</form>
<%
	if(flag){
		int operand = Integer.parseInt(opStr);
	
%>
<%
// 	String operandStr = request.getParameter("operand");
	
// 	//검증
// 	if(operandStr == null || operandStr.length() == 0){
// 		response.sendError(400);
// 		return;
// 	}
	
// 	//통과
// 	int operand = Integer.parseInt(operandStr);
// 	if(operand < 1 || operand >100){
// 		response.sendError(400);
// 		return;
// 	}
	
	
%>
<div>

	<%=factorial(operand) %>
</div>
<%} %>
</body>
</html>