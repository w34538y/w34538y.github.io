<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> <!-- hosLogin.jsp -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- [if it IE 9] -->
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<!-- [ENDif] -->
		<style>
			body{font-family: Verdana, sans-serif; font-size:0.8em}
			header, nav, section, article, asdie, footer {border: 1px solid gray; margin: 5px; padding: 8px;}
			nav ul{margin:0; padding0;}
			nav ul li{display:inline; margin:5px;}
			section{height: 350px;}
			#id_form{width:150px; height:14px; color:red;}
			#label_form{display:inline-block; width:60px; height:14px; color:red;}
		</style>
		<title>회원관리</title>
		<jsp:useBean id="dto" class="finaltermpkg.HosDTO" scope="session"/>
		<jsp:useBean id="dao" class="finaltermpkg.HosDAO" scope="session"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3,1.1/jquery.min.js"></script>
		<%!
			boolean isNotEmpty(String str){
				if((str == null) || str.equals(""))
					return false;
				return true;
		}
		%>
	</head>
	<body>
		<%
			String user_id = request.getParameter("user_id");
			String user_passwd = request.getParameter("user_passwd");
			if(!isNotEmpty(user_id) || !isNotEmpty(user_passwd)){
				response.sendRedirect("./hosLogin.html");
			}else{
				if(dao.checkPwd(user_id, user_passwd)){
					//세션변수 및 값 설정 
					dto.setHos_id(user_id);
					dto.setVerified(true);
					response.sendRedirect("./hosReservation.html");
				}else{
					response.sendRedirect("./hosLogin.html");
				}
			}
				
		%>
	</body>
</html>