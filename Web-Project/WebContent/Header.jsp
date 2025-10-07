<%@page import="com.rays.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
    }

    header {
        background-color: #B99099; /* Soft pink */
        padding: 15px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        color: #4a2b2b; /* Warm brown text */
    }

    .greeting {
        font-size: 18px;
        font-weight: 500;
    }

    .nav-links a {
        color: #fff;
        text-decoration: none;
        margin-left: 20px;
        font-weight: 500;
        padding: 6px 12px;
        border-radius: 8px;
        transition: 0.3s;
        background-color: rgba(255,255,255,0.15);
    }

    .nav-links a:hover {
        background-color: rgba(255,255,255,0.35);
        color: #4a2b2b;
    }

    @media screen and (max-width: 600px) {
        header {
            flex-direction: column;
            align-items: flex-start;
        }
        .nav-links {
            margin-top: 10px;
        }
        .nav-links a {
            margin-left: 0;
            margin-right: 10px;
        }
    }
</style>

</head>
<body>

<header>
    <div class="greeting">
        <%
            UserBean user = (UserBean) session.getAttribute("user");
            if (user != null) {
        %>
            Hi, <%= user.getFirstName() %>
        <%
            } else {
        %>
            Hi, Guest
        <%
            }
        %>
    </div>

    <div class="nav-links">
        <%
            if (user != null) {
        %>
            <a href="UserCtl">Add User</a>
            <a href="UserListCtl">User List</a>
            <a href="ChangePasswordCtl">Change Password</a>
            <a href="LoginCtl?operation=logout">Logout</a>
        <%
            } else {
        %>
            <a href="LoginCtl">Login</a>
            <a href="UserRegistrationCtl">SignUp</a>
        <%
            }
        %>
    </div>
</header>

</body>
</html>
