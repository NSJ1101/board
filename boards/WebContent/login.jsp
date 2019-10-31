<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function chk(){
	if(document.add.id.value==""){
		alert("아이디가 입력 되지 않았습니다.");
		document.getElementById("id").focus();
		return false;
	}else if(document.add.pw.value==""){
		alert("비밀번호가 입력 되지 않았습니다.");
		document.getElementById("pw").focus();
		return false;
	}
	</script>
</head>
<body>
<jsp:include page="view/header.jsp"></jsp:include>
<div class="login">
<form action="login_query.jsp" method="post" class="form-group" name="add" onsubmit="return chk();">
<input type="hidden">
아이디<input type="text" name="id" id="id"class="form-control">
비밀번호<input type="pas" name="pw" id="pw" class="form-control">
<input type="submit" value="로그인" class="btn btn-secondary" style="float:right; margin-top:11px;"> 

</form>
</div>
</body>
</html>