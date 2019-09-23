<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String query = "select count(*) from user_tbl where id='"+request.getParameter("id")+"'and pw = '"+request.getParameter("pw")+"'";
ResultSet rs = dbconnection.sendQuery(query);

if(!rs.next()){
	
};
if(rs.getInt(1) == 1){
	%>
	<script type="text/javascript">alert('로그인 성공');</script>
	<% 
	session.setAttribute("id", id);
    response.sendRedirect("index.jsp?id="+ id);
}else{
%>
	<script type="text/javascript">alert('아이디나 비밀번호가 틀렸습니다');location.href='login.jsp' </script>
<%	
}
%>