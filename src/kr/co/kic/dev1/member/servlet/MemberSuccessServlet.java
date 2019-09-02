package kr.co.kic.dev1.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class MemberSuccessServlet
 */
@WebServlet("/member/join/success")
public class MemberSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("회원가입이 됐을까? 확인해봐");
		
		DataSource ds = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/kic");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		try {
			con = ds.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_id,m_email ");
			sql.append("FROM member ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			out.println("<!DOCTYPE html>\r\n" + 
					"<html lang=\"ko\">\r\n" + 
					"\r\n" + 
					"<head>\r\n" + 
					"    <meta charset=\"UTF-8\">\r\n" + 
					"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
					"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
					"    <title>Member List</title>\r\n" + 
					"</head>\r\n" + 
					"<style>\r\n" + 
					"    table {\r\n" + 
					"        border: 1px solid black;\r\n" + 
					"        border-collapse: collapse;\r\n" + 
					"\r\n" + 
					"    }\r\n" + 
					"\r\n" + 
					"    td {\r\n" + 
					"        border: 1px solid black;\r\n" + 
					"    }\r\n" + 
					"\r\n" + 
					"    th {\r\n" + 
					"        border: 1px solid black;\r\n" + 
					"    }\r\n" + 
					"</style>\r\n" + 
					"\r\n" + 
					"<body>\r\n" + 
					"    <h1>Member List</h1>\r\n" + 
					"    <table>\r\n" + 
					"        <caption>Member List 입니다</caption>\r\n" + 
					"        <colgroup>\r\n" + 
					"            <col width=\"100\" />\r\n" + 
					"            <col width=\"300\" />\r\n" + 
					"        </colgroup>\r\n" + 
					"        <thead>\r\n" + 
					"            <th>ID</th>\r\n" + 
					"            <th>E-Mail</th>\r\n" + 
					"        </thead>\r\n" + 
					"        <tbody>");
			while(rs.next()) {
				String id = rs.getString(1);
				String email = rs.getString(2);
			
				out.println("<tr>");
				out.println("<td>" + id + "</td>");
				out.println("<td>" + email + "</td>");
				out.println("</tr>");
			}
			
			out.println("</tbody>\r\n" + 
					"    </table>\r\n" + 
					"</body>\r\n" + 
					"\r\n" + 
					"</html>");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
