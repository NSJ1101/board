<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.*"%>
<%
String delete = request.getParameter("delete");
ResultSet rs = null;
String query="delete from user_tbl where id='"+delete+"'";
rs=dbconnection.sendQuery(query);
System.out.println(query);
%>
<script type="text/javascript">
alert('삭제 완료');
location.href="user_tbl.jsp";
</script>