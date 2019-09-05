<%@ page pageEncoding = "utf-8" %>

<%	
	/*
		HTTPSession 객체를 종료하는 3가지 방법
		1. 브라우저를 종료했을 경우.
		2. 해당페이지의 시간(30분)이 경과되어 자동으로 세션객체 삭제
		3. invalidate() 메서드를 호출하면 세션객체 종료
		
		//세션기본 시간은 30분 web.xml 확인가능
		//tomcat 의 web.xml 은 전체를 관할하므로 바꾸지 말고 context 내의 web.xml을 만져야한다.
	*/
	session.invalidate();
	response.sendRedirect("/");
%>