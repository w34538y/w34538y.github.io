<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>


<!DOCTYPE html> <!-- hosReg.jsp -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script> function fnError() {alert("내용을 모두 입력하세요"); history:back();}</script>
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
		</style>
		<title>회원가입 처리중...</title>
		<jsp:useBean id="dto" class="finaltermpkg.HosDTO"/>
		<jsp:setProperty name="dto" property="*"/>
		<jsp:useBean id="dao" class="finaltermpkg.HosDAO"/>
	</head>
	<body>
		<header><h2>회원가입을 환영합니다.</h2></header>
		<nav>
			<ul>
				<li><a href="./hosLogin.html">로그인</a></li>
				<li><a href="./hosReg.html">회원등록</a></li>
			</ul>
		</nav>
		<section>
		<fieldset class="fset"><legend>등록결과</legend>
			<%
				if(dto.getHos_id()==null||
				dto.getHos_passwd()==null||
				dto.getHos_name()==null||
				dto.getHos_phone()==null||
				dto.getHos_email()==null||
				dto.getHos_id().trim().equals("")||
				dto.getHos_passwd().trim().equals("")||
				dto.getHos_name().trim().equals("")||
				dto.getHos_phone().trim().equals("")||
				dto.getHos_email().trim().equals("")) {
			%>
			<section><script>fnError();</script></section>
			<% 
				return; 
			}
			%>
			<%
				int rec_no = dao.insertHosuser(dto.getHos_id(), dto.getHos_passwd(), dto.getHos_name(), dto.getHos_phone(), dto.getHos_email());
				if(rec_no > 0){
			%>
				<script>alert("성공"); location.href="./hosMain.html"</script> /* 사이트 이동 */
			<%
				} else {
			%>
				<script>alert("실패"); location.href="./hosMain.html"</script> /* 사이트 이동 */
			<%
				}
			%>
			<%-- <div style="overflow-x:auto; overflow-y:auto;">
				<table class="ex1">
					<tr><th>아이디</th><th>이름</th><th>전화</th><th>이메일</th><th>취미</th></tr>
					<tr><td><%= dto.getStud_id() %></td>
					<td><%= dto.getStud_name() %></td>
					<td><%= dto.getStud_phone() %></td>
					<td><%= dto.getStud_email() %></td>
					<td><%= sHobby[0] %><%= sHobby[1] %><%= sHobby[2] %></td>
				</table>
			</div> --%>
		</fieldset>
		</section>
		<footer>
			<p>&copy; 20XX Made by 신우진. All rights reserved. </p>
		</footer>
	</body>
</html>