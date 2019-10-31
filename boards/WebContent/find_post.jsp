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
<td><a href="post_content.jsp?post_number=<%=rs.getString(4) %>"><%=rs.getString(4) %></a></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(6) %></td>
</tr>
<%} %>
</table>
</div>
<br>
</section>
</body>
</html>