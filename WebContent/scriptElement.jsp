<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<body>
		<h1>Scripting Element</h1>
		<%!
			//declaration
			private int age;
			public void m(){
				
			}
		%>
		<select>
			<%
				for(int i=1900;i<=2019;i++){
					out.println("<option value=" + i + ">" + i + " </option>");
				}
			%>
		</select>
		
		<select>
			<%	
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				
				for(int i =1900;i<=year;i++){
			%>
			 <option value='<%=i %>' <%if((year-20)==i) {%>selected="selected" <%} %>> <%=i %></option>
			<%
				}
			%>
		</select>
		 
		<%
			//scriptlet
			int tt;
			m();
			
		%>
	</body>
</html>