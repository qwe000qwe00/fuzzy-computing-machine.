<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public Map<String, String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001", new String[]{"RM", "/WEB-INF/bts/rm.jsp"});
	singerMap.put("B002", new String[]{"제이홉", "/WEB-INF/bts/jhope.jsp"});
	singerMap.put("B003", new String[]{"진", "/WEB-INF/bts/jin.jsp"});
	singerMap.put("B004", new String[]{"슈가", "/WEB-INF/bts/suger.jsp"});
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/btsForm.jsp</title>
<script type="text/javascript">
	function eventHandler(){
		var form = document.forms[0];
		form.submit();
	}
</script>
</head>
<body>
<form action="<%=request.getContextPath() %>/05/getBTS.jsp">
	<select name="member" onchange="eventHandler();">
		<option value="">멤버 선택</option>
		<%
			for(Entry<String, String[]> entry : singerMap.entrySet()){
				String name = entry.getKey();
				String value = entry.getValue()[0];
				out.println(String.format("<option value='%s'>%s</option>", name, value));
			}
		%>
	</select>
</form>
</body>
</html>