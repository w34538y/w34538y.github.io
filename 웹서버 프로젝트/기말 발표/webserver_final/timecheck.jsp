<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="finaltermpkg.HosDAO"/>
<%
	String hos_subj = request.getParameter("hos_subj");
	String subj_time = request.getParameter("subj_time");

	boolean flag = true;
	String ans = "";
	if(hos_subj == null){
		hos_subj = "";
	}
	if(!hos_subj.equals("")){
		flag = dao.checkTime(hos_subj, subj_time);
	}
	if(flag){ //이미 존재하는 아이디의 경우 
		ans = "예약이 찼습니다.";
	}else{ //사용가능 아이디 
		ans="예약이 가능합니다.";
		out.print(ans); 
	}
%>