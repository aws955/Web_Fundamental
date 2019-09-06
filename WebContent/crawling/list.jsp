<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp"%>

<%
String url = "https://kr.ufc.com/rankings";
Document doc = null;

try {
	doc = Jsoup.connect(url).get();
} catch (IOException e) {
	e.printStackTrace();
}

Elements elements = doc.select(".view.view-athletes.view-id-athletes");
Elements elements1 = doc.select(".view-grouping-content");

/*
for(int i = 0;i<elements1.size();i++){
	System.out.println(elements1.get(i).text());
}
*/

/*
for(int i = 0;i<elements.size();i++){
	System.out.println(elements.get(i).text());
}
*/

int index = 0;

%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="/">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Crawling</li>
	</ol>
</nav>

<div class="container">
	
	<div class="row">
		<div class="col-md-4">
			<h4>POUND-FOR-POUND</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  		<tr>
			      		<td  class="text-center" scope="row">#</td>
			      		<td  class="text-center">#</td>
			    	</tr>
			  </tbody>
			</table>
		</div>
	
		<div class="col-md-4">
			<h4>플라이급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
		
		<div class="col-md-4">
			<h4>밴텀급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col-md-4">
			<h4>페더급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	
		<div class="col-md-4">
			<h4>라이트급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
		
		<div class="col-md-4">
			<h4>웰터급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col-md-4">
			<h4>미들급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	
		<div class="col-md-4">
			<h4>라이트 헤비급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
		
		<div class="col-md-4">
			<h4>헤비급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col-md-4">
			<h4>여성 스트로급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	
		<div class="col-md-4">
			<h4>여성 플라이급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
		
		<div class="col-md-4">
			<h4>여성 밴텀급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  	<% for(int i = 1; i<=15 ; i++) {%>
			  		<tr>
			      		<td  class="text-center" scope="row"><%=i %></td>
			      		<td  class="text-center"><%=elements.get(index++).text() %></td>
			    	</tr>
			  	<%} %>
			  </tbody>
			</table>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col-md-4">
			<h4>여성 페더급</h4>
			<table class="table table-striped table-dark">
			  <colgroup>
				<col width="20%" />
				<col width="80%" />
			  </colgroup>
			  <thead>
				   	<tr>
				      <th class="text-center" scope="col">Rank</th>
				      <th class="text-center" scope="col">Name</th>
				    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			      	<td  class="text-center" scope="row">Champion</td>
			      	<td  class="text-center"><%=elements.get(index++).text() %></td>
			    </tr>
			  </tbody>
			</table>
		</div>
	
		<div class="col-md-4"></div>
		
		<div class="col-md-4"></div>
	</div>
	
</div>


<%@ include file = "../inc/footer.jsp"%>