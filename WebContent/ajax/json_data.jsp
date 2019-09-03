<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page contentType="application/json;charset=utf-8"%>

<%
	JSONObject jsonObj = new JSONObject();
	//jsonObj.put("name","성영한"); //{"name" : "성영한"}
	
	JSONArray jsonArray = new JSONArray();
	
	JSONObject item1 = new JSONObject();
	item1.put("name","성영한1");
	item1.put("clubid","syh1011");	
	jsonArray.add(item1);
	
	JSONObject item2 = new JSONObject();
	item2.put("name","성영한2");
	item2.put("clubid","syh2022");	
	jsonArray.add(item2);
	
	JSONObject item3 = new JSONObject();
	item3.put("name","성영한3");
	item3.put("clubid","syh3033");	
	jsonArray.add(item3);
	
	jsonObj.put("cafelist",jsonArray); //{"cafelist":[]} 
	
	out.print(jsonObj.toString()); 
	
%>