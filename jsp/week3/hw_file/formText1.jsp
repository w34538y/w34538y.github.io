<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
		<title>폼 학습</title>
	</head>
	<body>
		<section>
			<h2>JSP Form</h2>
			<section>
				<h2>아이디: <%= request.getParameter("namex") %></h2>
				<h2>패스워드: <%= request.getParameter("passx") %></h2>
			</section>
		</section>
	</body>
</html>