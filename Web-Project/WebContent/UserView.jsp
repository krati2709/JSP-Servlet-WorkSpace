<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #B99099;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
    }

    h1 {
        color: #4a2b2b;
        margin-bottom: 20px;
        letter-spacing: 1px;
    }

    .container {
        background: #fff7f8;
        margin-top: 40px;
        padding: 35px 45px;
        border-radius: 18px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        width: 400px;
        text-align: center;
    }

    table {
        width: 100%;
        border-spacing: 10px;
    }

    th {
        text-align: left;
        color: #5e3a3a;
        font-weight: 500;
        font-size: 14px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #d9a2a8;
        border-radius: 8px;
        font-size: 14px;
        transition: 0.3s;
        background-color: #fff;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus,
    input[type="date"]:focus {
        border-color: #b36a75;
        outline: none;
        box-shadow: 0 0 6px rgba(179, 106, 117, 0.4);
    }

    input[type="submit"] {
        background-color: #b36a75;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #9a5964;
    }

    h4 {
        margin: 10px 0;
        font-weight: 500;
    }

    h4.success {
        color: #2e7d32;
    }

    h4.error {
        color: #d32f2f;
    }

    footer {
        margin-top: auto;
        padding: 15px;
        color: #fff;
        text-align: center;
        font-size: 14px;
        opacity: 0.9;
    }
</style>
</head>
<body>
<%@ include file="Header.jsp"%>

	<%
		String successMsg = (String) request.getAttribute("successMsg");
		String errorMsg = (String) request.getAttribute("errorMsg");
	%>

	<div class = "container">
		<h1>Add User</h1>

		<%
			if (successMsg != null) {
		%>
		<h4 class="success"><%=successMsg%></h4>
		<%
			}
		%>

		<%
			if (errorMsg != null) {
		%>
		<h4 class="error"><%=errorMsg%></h4>
		<%
			}
		%>

		<form action="UserCtl" method="post">

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
					<th>Login</th>
					<td><input type="email" name="login" value=""
						placeholder="enter your login"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="password" value=""
						placeholder="enter your password"></td>
				</tr>
				<tr>
					<th>Dob</th>
					<td><input type="date" name="dob" value=""></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" name="operation" value="save"></td>
				</tr>
			</table>

		</form>

	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>