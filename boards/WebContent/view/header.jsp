<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
<header>
<div class="header_inner">

<%
String id="";
id = (String)session.getAttribute("id");
if(id==null){%>
<ul>
<li><a href="index.jsp">홈으로</a> </li>
<li><a href="add.jsp">회원가입</a> </li>
<li><a href="user_tbl.jsp">사용자관리</a> </li>
<li><a href="login.jsp">로그인</a> </li>
<li><a href="post_add.jsp">글쓰기</a> </li>
<li><a href="posts.jsp">글 목록</a> </li>
</ul>
<div class="login_fail"><a href="login.jsp">로그인</a>이 필요합니다</div>
<%}else{
String id_query="select id, name from user_tbl where id='"+id+"'";
ResultSet id_rs = dbconnection.sendQuery(id_query);
while(id_rs.next()){
%>
<ul>
<li><a href="index.jsp">홈으로</a> </li>
<li><a href="user_tbl.jsp">사용자관리</a> </li>
<li><a href="post_add.jsp">글쓰기</a> </li>
<li><a href="posts.jsp">글 목록</a> </li>
</ul>

<div class="login_suc">
<a href="profile.jsp?name=<%=id_rs.getString(2) %>"> <%=id_rs.getString(2) %> | 
</a> <a href="logout.jsp">로그아웃</a>
</div>
<%}} %>
</div>
</header>
</body>
</html>