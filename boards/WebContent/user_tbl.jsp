<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ResultSet rs = null;
String query="select id,pw,name,email from user_tbl";
rs=dbconnection.sendQuery(query);
%>
<jsp:include page="view/header.jsp"></jsp:include>
<table border="1">
<tr>
<th>아이디</th>
<th>비밀번호</th>
<th>닉네임</th>
<th>이메일</th>
<th>삭제</th>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><a href="delete.jsp?delete=<%=rs.getString(1)%>">삭제</a></td>
</tr>
<%} %>
</table>
</body>
</html>
