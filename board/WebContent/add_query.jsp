<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String urs="./";
request.setCharacterEncoding("UTF-8");
Connection conn = dbconnection.getConnection();
String query="insert into user_tbl values(?,?,?,?)";
PreparedStatement pstmt=conn.prepareStatement(query);

pstmt.setString(1, request.getParameter("id"));
pstmt.setString(2, request.getParameter("pw"));
pstmt.setString(3, request.getParameter("name"));
pstmt.setString(4, request.getParameter("email"));

pstmt.executeQuery();


%>

<script type="text/javascript">
alert('등록 완료');
location.href="index.jsp";
</script>