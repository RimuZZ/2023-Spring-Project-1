<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:set value="${param.result }" var="result"/>
<c:choose>
	<c:when test="${result=='loginfail' }">
		<script type="text/javascript">
			alert("Id 혹은 PW가 잘못되었습니다.");
		</script>
	</c:when>
	<c:when test="${result=='logout' }">
		<script type="text/javascript">
			alert("로그아웃되었습니다!");
		</script>
	</c:when>
	<c:when test="${result=='nologin' }">
		<script type="text/javascript">
			alert("로그인 후 이용 가능합니다!");
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header>
	<h3 align="center">스프링예제</h3>
</header>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="home">Home</a></li>
  	 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 판매자관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="productinput">상품 등록</a></li>
          <li><a href="productout?product_num=6">상품 확인</a></li>
          <li><a href="productreview?product_num=6">리뷰등록</a></li>   
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
	<c:choose>
	<c:when test="${loginstate == true }">
		<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${log_id }님 안녕하세요~!</a></li>
     	<li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
	</c:when>
	<c:otherwise>
	<%
	HttpSession hs = request.getSession();
	hs.setAttribute("loginstate", false);
	%>
    	<li><a href="signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     	<li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </c:otherwise>
	</c:choose>
    </ul> 
  </div>
</nav>
</html>