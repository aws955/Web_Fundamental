<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.util.ArrayList"%>
<!-- 응답 MIME 타입과 문자 인코딩을 지정한다. -->
<%@ page contentType="text/html; charset=utf-8" %>
<!-- 문자 인코딩을 지정한다. -->
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP page directive Demo</title>
 <script>
        let station = '강남역';
        let ourname = `이번 정차역은
        ${ '${station}' } 입니다.
        `;
        console.log(ourname);
        
        //많은 언어가 text interpolation을 지원하는데 jsp의 EL표현식과 자바스크립의 문법이 똑같아서 발생한다.
        
        /*
        	let station = '강남역';
        	let ourname = `이번 정차역은 ${station} 입니다`;
        */
        
        /*
        	위의 코드는 "이번 정차역은 강남역입니다" 라는 값을 기대한다.
        	그러나 jsp 엔진을 거치게 되면 다음과 같이 처리된다.
        	1) page,request,session,context 에서 station이라는 이름표를 찾아 값을 찾음
        	2) null이면 아무것도 출력하지 않고 interpolation 부분을 지워버림
        	3) null이 아니면 toString() 값을 끼워넣어 출력
        */
        
        /*
        	서버에서 request.setAttribute("station","역삼역"); 을 넣으면
        	jsp 엔진은 ${station} 에 역삼역을 할당한다.
        */
        
        /*
        	text interpolation이 충돌하는 경우 해결법은
        	${ '${station}' } 이라 적으면 된다.
        */
        
    </script>
</head>
<body>
	<h1>Page Directive1111</h1>
	
	<%
		//기본으로 import 해주는 4가지안에 있는 클래스는 별도의 import없이 사용할 수 있다.
		HttpSession ses = null;
		
		ArrayList list = new ArrayList();
		BufferedReader br =null;
		session.setAttribute("",""); //session 을 false 로 하면 사용불가
		
		request.setAttribute("name", "sung");
		String id = request.getParameter("id");
		//http://localhost/pageDirective.jsp?id=123 같이 호출해야한다.
	%>
		당신의 이름 : ${name} <br>
		파라미터 받기 : ${param.id } , <%=id %>
</body>
</html>