<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String errorMsg = (String) request.getAttribute("errorMsg");
		String successMsg = (String) request.getAttribute("successMsg");
	%>

	<%@ include file="Header.jsp"%>

	<div class="container">
		<h1>Change Password</h1>

		<%
			if (errorMsg != null) {
		%>
		<h4 class="error" style="color: red;"><%=errorMsg%></h4>
		<%
			}
		%>

		<%
			if (successMsg != null) {
		%>
		<h4 class="success" style="color: green;"><%=successMsg%></h4>
		<%
			}
		%>


		<form action="ChangePasswordCtl" method="post">
			<table>
				<tr>
					<th>Login</th>
					<td><input type="email" name="login"
						placeholder="Enter your password"></td>
				</tr>
				<tr>
					<th>Old password</th>
					<td><input type="password" name="oldPassword"
						placeholder="Enter your login"></td>
				</tr>
				<tr>
					<th>New Password</th>
					<td><input type="password" name="newPassword"
						placeholder="Enter your password"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" name="operation" value="Save Changes"></td>
				</tr>
			</table>
		</form>
	</div>

	<footer>
		<%@ include file="Footer.jsp"%>
	</footer>

</body>
</html>