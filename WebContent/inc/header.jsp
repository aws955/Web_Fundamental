<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@ page pageEncoding="UTF-8"%>
<%
	MemberDto memberDto =  (MemberDto)session.getAttribute("member");
%>
<!doctype html>
<html lang="en">
<%
	String path = request.getRequestURI();
	
	
	int pageActiveIndex = 0;
	
	if(path.startsWith("/index.jsp")){
		pageActiveIndex = 1;
	}else if(path.startsWith("/notice")){
		pageActiveIndex = 2;
	}else if(path.startsWith("/emp")){
		pageActiveIndex = 3;
	}else if(path.startsWith("/dept")){
		pageActiveIndex = 4;
	}else if(path.startsWith("/member")){
		pageActiveIndex = 5;
	}else if(path.startsWith("/crawling")){
		pageActiveIndex = 6;
	}else if(path.startsWith("/file")){
		pageActiveIndex = 7;
	}else if(path.startsWith("/shortenURL")){
		pageActiveIndex = 8;
	}else if(path.startsWith("/gtsm")){
		pageActiveIndex = 9;
	}
	
%>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<!-- Font Awesome CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
	<script src="../js/jquery-3.4.1.js"></script>

	<title>Bootstrap Template</title>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#563d7c;">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item <%if(pageActiveIndex==1 || pageActiveIndex==0){ %>active<%}%>" >
					<a class="nav-link" href="/index.jsp" >Home</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==2){ %>active<%} %>" >
					<a class="nav-link" href="/notice/list.jsp" >Notice</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==3){ %>active<%} %>" >
					<a class="nav-link" href="/emp/list.jsp" >Emp</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==4){ %>active<%} %>" >
					<a class="nav-link" href="/dept/list.jsp" >Dept</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==5){ %>active<%} %>" >
					<a class="nav-link" href="/member/list.jsp">Member</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==6){ %>active<%} %>" >
					<a class="nav-link" href="/crawling/list.jsp">Crawling</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==7){ %>active<%} %>" >
					<a class="nav-link" href="/file/index.jsp">FileUpload</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==8){ %>active<%} %>" >
					<a class="nav-link" href="/shortenURL/makeShortenURL.jsp">ShortenURL</a>
				</li>
				<li class="nav-item <%if(pageActiveIndex==9){ %>active<%} %>" >
					<a class="nav-link" href="/gtsm/list.jsp">GTSM</a>
				</li>

			</ul>

			<ul class="navbar-nav">
				<li class="nav-item">
					<% if(memberDto ==null){ %>
					<a class="nav-link " href="/member/login.jsp"><i class="fa fa-user"></i> Register </a>
					<% } %>
					
				</li>
				<li class="nav-item">
					<% if(memberDto ==null){ %>
					<a class="nav-link " href="/member/login.jsp"><i class="fa fa-user"></i> Login</a>
					<% }else{ %>
					<a class="nav-link " href="/member/logout.jsp"><i class="fa fa-user"></i> Logout(<%=memberDto.getName() %> 환영합니다)</a>
					<%} %>
				</li>
			</ul>
		</div>
	</nav>