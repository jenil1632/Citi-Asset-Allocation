<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
double[][] ans = (double[][])(request.getAttribute("allAssetClassReturns"));
int y = (Integer) request.getAttribute("lastYear");
out.println("<br><br>");
for(int i=0;i<y;i++)
	{
	for(int j=0;j<ans[0].length;j++)
	{
	out.println(ans[i][j]+"   ");
	}
	out.println("<br>");
	}%>


</body>
</html>