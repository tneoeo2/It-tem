<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.kh.ml.common.code.Code" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<body>

<h1>회원가입을 완료해주세요!</h1>
<h1>반갑습니다. ${userId} 님.</h1>
<h1>아래의 링크를 클릭해 회원가입을 완료해주세요.</h1>
<a href="<%= Code.DOMAIN %>/member/joinimpl/${authPath}">회원가입완료</a><br>
<img src="https://t1.daumcdn.net/liveboard/techplus/f8847f40851b481e83239026427fc847.png"/>



</body>
</html>