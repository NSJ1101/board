<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="view/header.jsp"></jsp:include>

<section>

<div class="gener"><%
String query_gener="select gener_code,gener_name from gener_tbl";
ResultSet gener_rs= dbconnection.sendQuery(query_gener);
while(gener_rs.next()){
%>
<a href="gener.jsp?gener_code=<%=gener_rs.getString(1) %>">
<%=gener_rs.getString(2) %></a>
<%} %>
</div>
	
<%
String urs="./";
request.setCharacterEncoding("UTF-8");
String posts_title = request.getParameter("posts_title");
ResultSet rs =null;
String query="select id,post_number,decode(gener_code,1,'자유 게시판',2,'유머 게시판') ,post_title,post_content,to_char(post_date,'yyyy-mm-dd') "+
"from post_tbl where post_title like '%"+posts_title+"%'"+
"order by post_number asc";
System.out.println(query);
rs= dbconnection.sendQuery(query);
%>

<div class="post">
<table class="table table-striped">
<tr>
<th>글번호</th>
<th>제목</th>
<th>장르</th>
<th>작성자</th>
<th>날짜</th>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString(2) %></td>
<td><a href="post_content.jsp?post_title=<%=rs.getString(4) %>"><%=rs.getString(4) %></a></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(6) %></td>
</tr>
<%} %>
</table>
</div>
<form action="find_post.jsp"  method="post" name="find">
<input type="hidden">
제목 검색<input type="text" name="posts_title" />
<input type="submit">
</form>

<button value="글쓰기" onclick="location.href='post_add.jsp'"  style="float:right;">글 쓰기</button>
</section>
</body>
</html>