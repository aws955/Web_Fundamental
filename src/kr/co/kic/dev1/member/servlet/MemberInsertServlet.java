package kr.co.kic.dev1.member.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/member/join")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request 객체를 사용하기전에 코딩해야한다
		//파라미터 중에서 한글을 보내는 경우는 반드시 코딩해야한다.
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		/*
		if(MemberDao.getInstance().insert(new MemberDto(id,email,password))) {
			response.sendRedirect("/member/join/success");
		}else {
			response.sendRedirect("/member/join.html");	
		}
		*/
		
		
	}

}
