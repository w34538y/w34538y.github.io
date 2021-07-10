<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="finaltermpkg.HosDTO" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html><!-- beanResult.jsp -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
			* {padding:0; margin: 0;}
			body {font-family: Verdana, sans-serif; font-size: 0.8em;}
			header, nav, section, article, aside, footer {border: 1px solid gray; margin: 5px; padding: 8px;}
			nav ul{margin: 0; padding: 0;}
			nav ul li{display: inline; margin: 5px;}
			a:link {color:blue; text-decoration:none;} 
			a:visited { color:pink; text-decoration:none;}
			a:hover {color: red; text-decoration:underline;} 
			a:active {color:blue; text-decoration:none;}
			section { height: 450px;}
			.id_form {width: 50px;}
			.label_form  {display:inline-block; width:55px; height:14px; color:red; padding: 5px;}
			.button_form {width: 60px; margin-left:5px;}
			.fset{padding: 15px;}
			#dupBtn {height: 25px;}
			ul.level_1 > li {list-style: none; display:inline-block; vertical-align: bottom;}
			ul.level_1 > li {list-style: none; }
			.level_2 li {padding-top: 5px;}
			.level_2 span {display:inline-block; width:70px;}
			.level_2 input {width: 100px;}
			#loginBtn button {margin-left: 5px; height: 42px;}
			table, th, td {border: 1px solid black; border-collapse: collapse;}
			table {width: 100%; height:80%;}
			th, td {text-align: center; padding: 10px; vertical-align: bottom;}
			tr:nth-child(odd){background-color: lightgray;}
			th {background-color:gray; color:white;}
			table.ex1 {table-layout: auto;}
		</style>
		<title>로그인 실습</title>
		<jsp:useBean id="dto" class="finaltermpkg.HosDTO" scope="session"/>
		<jsp:useBean id="dao" class="finaltermpkg.HosDAO" scope="session"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<%!
			boolean isNotEmpty(String str){
				if((str == null) || str.equals("")) 
					return false;
				return true;
			}
		%>
	</head>
	<body>
		<%-- <%
			boolean flag = dto.isVerified();
			if(!flag) {
				response.sendRedirect("./hosMain.html");
			} else {
		%> --%>
		<header><h2>환자 예약 내역 페이지입니다.</h2></header>
		<nav>
			<ul>
				<li><a href="./hosLogout.jsp">로그아웃</a>
				<li><a href="./hosMain.html">홈페이지</a></li>
			</ul>
		</nav>
		<section>
			<fieldset class="fset">
				<legend>현재 예약 환자 현황</legend>
				<div style="overflow-x:auto; overflow-y:auto;">
					<table class="ex1">
						<tr>
							<th>아이디</th><th>이름</th><th>전화</th><th>이메일</th><th>진료과목</th><th>진료시간</th><th>예약시간</th>
						</tr>
						<%
							List<HosDTO> list = new ArrayList<HosDTO>();
							list = dao.findAllAdminHosuser();
							String user_id = request.getParameter("hos_id");
							String user_passwd = request.getParameter("hos_passwd");
							if(user_id=="admin" && user_passwd=="admin"){
									//세션변수 및 값 설정 
								dto.setHos_id(user_id);
								dto.setVerified(true);
							for(int i = 0; i < list.size(); i++){
						%>
						<tr>
							<td><%= list.get(i).getHos_id() %></td>
							<td><%= list.get(i).getHos_name() %></td>
							<td><%= list.get(i).getHos_phone() %></td>
							<td><%= list.get(i).getHos_email() %></td>
							<td><%= list.get(i).getHos_subj() %></td>
							<td><%= list.get(i).getSubj_time() %></td>
							<td><%= list.get(i).getReg_time() %></td>
						</tr>
						<%
							}
								}else{
									/* response.sendRedirect("./hosAdmin.html"); */
									for(int i = 0; i < list.size(); i++){
						%>
							<tr>
							<td><%= list.get(i).getHos_id() %></td>
							<td><%= list.get(i).getHos_name() %></td>
							<td><%= list.get(i).getHos_phone() %></td>
							<td><%= list.get(i).getHos_email() %></td>
							<td><%= list.get(i).getHos_subj() %></td>
							<td><%= list.get(i).getSubj_time() %></td>
							<td><%= list.get(i).getReg_time() %></td>
						</tr>
							<%
									}
								}
							%>
									
							
						
					</table>
				</div>
			</fieldset>
		</section>
		<footer>
			<p>&copy; 20XX Made by 신우진. All rights reserved. </p>
		</footer>
	</body>
</html>