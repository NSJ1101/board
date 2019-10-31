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
	}else if(document.add.name.value==""){
		alert("이름이 입력 되지 않았습니다.");
		document.getElementById("name").focus();
		return false;
	}else if(document.add.email.value==""){
		alert("이메일이 입력 되지 않았습니다.");
		document.getElementById("email").focus();
		return false;
	}
}

</script>
</head>
<body>
<jsp:include page="view/header.jsp"></jsp:include>
<form action="add_query.jsp" method="post" name="add" onsubmit="return chk();">
<input type="hidden">
<div class="form-group has-feedback" id="add_table">
아이디<input type="text" name="id" id="id" class="form-control">
비밀번호<input type="password" name="pw" id="pw" class="form-control">
이름(닉네임)<input type="text" name="name"  id="name" class="form-control">
이메일<input type="text" name="email" id="email" class="form-control">
<input type="submit" value="회원가입" class="btn btn-secondary" style="float:right; margin-top:11px;">
</div>
</form>


</body>
</html>