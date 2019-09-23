<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.dbconnection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String query9="select gener_name from gener_tbl";
ResultSet rs9 = dbconnection.sendQuery(query9);
while(rs9.next()){
%>
<%=rs9.getString(1) %>
<%=rs9.getString(2) %>
<%} %>
</body>
</html>