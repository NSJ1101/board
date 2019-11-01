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
String id="";
id = (String)session.getAttribute("id");
%>
<%
String post_title =request.getParameter("post_title");

String post_query="select id,post_number,decode(gener_code,1,'자유 게시판',2,'유머 게시판') ,post_title,post_content,to_char(post_date,'yyyy-mm-dd') from post_tbl where post_title='"+post_title+"'";
ResultSet post_rs = dbconnection.sendQuery(post_query);

while(post_rs.next()){
%>

<% String user_id = post_rs.getString(1);
String user_query="select id,name from user_tbl where id='"+user_id+"'";
ResultSet user_rs= dbconnection.sendQuery(user_query);
while(user_rs.next()){%> 
작성자 아이디:  <%=user_rs.getString(1) %> <br>
작성자 이름 :<%=user_rs.getString(2) %><br>
글번호 : <%=post_rs.getString(2) %> <br>
분류 : <%=post_rs.getString(3) %> <br>
글 제목  : <%=post_rs.getString(4) %> <br>
글 내용 : <%=post_rs.getString(5) %> <br> 
글 작성 날짜 : <%=post_rs.getString(6) %> <br>

<% } %>
<br>
<form action="delete_query.jsp" method="post" name="add" onsubmit="return chk();">
<input type="hidden" name="delete_post" value="delete post_tbl where id='<%=post_rs.getString(1) %>'">
<% if(id.equals(post_rs.getString(1))){%> <% } %>
</form>
<%} %>

</body>
</html>