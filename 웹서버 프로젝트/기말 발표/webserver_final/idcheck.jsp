<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="finaltermpkg.HosDAO"/>
<%
	String hos_id = request.getParameter("hos_id");
	boolean flag = true;
	String ans = "";
	if(hos_id == null){
		hos_id = "";
	}
	if(!hos_id.equals("")){
		flag = dao.checkId(hos_id);
	}
	if(flag){ //이미 존재하는 아이디의 경우 
		ans = "NO";
	}else{ //사용가능 아이디 
		ans="YES";
		out.print(ans); 
	}
%>