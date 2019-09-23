<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="view/header.jsp"></jsp:include>
<%
String post_content =request.getParameter("post_number");
String post_query="select id,post_title,post_content from post_tbl where post_title='"+post_content+"'";

ResultSet post_rs = dbconnection.sendQuery(post_query);
while(post_rs.next()){
%>

작성자<%=post_rs.getString(1) %>
제목<%=post_rs.getString(2) %>
내용<%=post_rs.getString(3) %>

<%} %>
</body>
</html>