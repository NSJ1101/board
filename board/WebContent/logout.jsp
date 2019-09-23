<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.invalidate(); %>                      
<script type="text/javascript">
alert("로그아웃 되었습니다.");
location.href="index.jsp";                                    // 로그아웃 페이지로 이동
</script>
