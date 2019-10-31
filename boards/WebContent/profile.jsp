<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
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
String name = request.getParameter("name");

String query="select id,pw,name,email "+
" from user_tbl"+
" where name='"+name+"'";
String query2="select  a.id , a.name ,b.post_Title , b.post_date, b.post_number "+
" from user_tbl a,post_tbl b "+
" where a.name='"+name+"'"+
" and a.id=b.id";
ResultSet rs = dbconnection.sendQuery(query);
ResultSet rs2= dbconnection.sendQuery(query2);
%>



<table border="1">
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
</tr>
<%} %>
</table>

<table border="1">
<%while(rs2.next()){ %>
<tr>
<td><%=rs2.getString(1) %></td>
<td><%=rs2.getString(2) %></td>
<td><%=rs2.getString(3) %></td>
<td><%=rs2.getString(4) %></td>
<td><%=rs2.getString(5) %></td>
</tr>
<%} %>
</table>
</body>
</html>