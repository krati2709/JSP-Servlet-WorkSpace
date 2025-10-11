<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.rays.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #FBE9EA; /* very soft pink background */
        margin: 0;
        padding: 0;
    }

    h3 {
        color: #4A2B2B;
    }

    .container {
        width: 90%;
        margin: 40px auto;
        background: #fff;
        border-radius: 12px;
        padding: 20px 30px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .success {
        color: #2e7d32;
        background-color: #d9f7d9;
        padding: 8px 12px;
        border-radius: 8px;
        display: inline-block;
    }

    .error {
        color: #c62828;
        background-color: #fde0e0;
        padding: 8px 12px;
        border-radius: 8px;
        display: inline-block;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        border-radius: 10px;
        overflow: hidden;
    }

    th {
        background-color: #B99099; /* theme pink */
        color: white;
        text-align: center;
        padding: 10px;
    }

    td {
        text-align: center;
        padding: 10px;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #F8DDE1;
    }

    input[type="submit"] {
        background-color: #B99099;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        margin-top: 20px;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #a57378;
    }

</style>
</head>
<body>

    <%
        List list = (List) request.getAttribute("list");
        String successMsg = (String) request.getAttribute("successMsg");
        String errorMsg = (String) request.getAttribute("errorMsg");
    %>

    <%@ include file="Header.jsp"%>

    <div class="container" align="center">
        <h3>User List</h3>

        <% if (successMsg != null) { %>
            <div class="success"><%= successMsg %></div>
        <% } %>

        <% if (errorMsg != null) { %>
            <div class="error"><%= errorMsg %></div>
        <% } %>

        <form action="UserListCtl" method="post">
            <table>
                <tr>
                    <th>Delete</th>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Login</th>
                    <th>DOB</th>
                </tr>

                <%
                    Iterator<UserBean> it = list.iterator();
                    while (it.hasNext()) {
                        UserBean bean = it.next();
                %>
                <tr>
                    <td><input type="checkbox" value="<%=bean.getId()%>" name="ids"></td>
                    <td><%=bean.getId()%></td>
                    <td><%=bean.getFirstName()%></td>
                    <td><%=bean.getLastName()%></td>
                    <td><%=bean.getLogin()%></td>
                    <td><%=bean.getDob()%></td>
                </tr>
                <% } %>
            </table>

            <input type="submit" name="operation" value="delete">
        </form>
    </div>

    <%@ include file="Footer.jsp"%>

</body>
</html>
