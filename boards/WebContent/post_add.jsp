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

<%
String id="";
id = (String)session.getAttribute("id");
if(id==null){
	%> 
<script type="text/javascript"> alert('로그인 후 가능합니다'); location.href="login.jsp";</script>
	<%
	}else{	
	}
	%>
<%
String query ="select max(post_number)+1, to_char(sysdate,'yyyy-mm-dd') from post_tbl";
String query2 ="select * from gener_tbl";
ResultSet rs = dbconnection.sendQuery(query);
ResultSet rs2 = dbconnection.sendQuery(query2);
while(rs.next()){
%>
<form action="post_add_query.jsp" method="post" class="form-group">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="post_number" value="<%=rs.getString(1)%>">
<input type="hidden" name="post_date" value="<%=rs.getString(2)%>">
<%} %>
제목<input type="text"class="form-control" name="post_title">
글 내용<input type="text" class="form-control"name="post_content">
장르
<select name="gener_code">
<%while(rs2.next()){ %>
<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2) %></option>
<%} %>
</select>

<input type="submit" value="글 작성">

</form>

</body>
</html>