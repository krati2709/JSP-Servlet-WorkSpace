<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div align="center">

		<form action="getForm.jsp">

			<table>
				<tr>
					<th>First Name</th>
					<td><input type="text" name="firstName" value=""
						placeholder="enter first name"></td>
				</tr>

				<tr>
					<th>Last Name</th>
					<td><input type="text" name="lastName" value=""
						placeholder="enter last name"></td>

				</tr>

				<tr>
					<th>login</th>
					<td><input type="email" name="login" value=""
						placeholder="enter your email"></td>

				</tr>

				<tr>
					<th>password</th>
					<td><input type="password" name="password" value=""
						placeholder="enter your password"></td>

				</tr>

				<tr>
					<th>DOB</th>
					<td><input type="date" name="dob" value=""></td>

				</tr>

				<tr>
					<th></th>
					<td><input type="submit" value ="save" value=""></td>
				</tr>

			</table>

		</form>

	</div>

</body>
</html>