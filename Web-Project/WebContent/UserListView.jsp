<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
        background-color: #B99099;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        background-color: #fff7f8;
        margin-top: 40px;
        padding: 30px 40px;
        border-radius: 18px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        width: 80%;
        max-width: 900px;
    }

    h1 {
        color: #4a2b2b;
        text-align: center;
        margin-bottom: 20px;
        letter-spacing: 1px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
    }

    th {
        background-color: #B36A75;
        color: white;
        font-weight: 600;
        border-radius: 8px;
    }

    tr:nth-child(even) {
        background-color: #f7dae7;
    }

    tr:hover {
        background-color: #e8bcd2;
        transition: 0.3s;
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

<div class="container">
    <h1>User List</h1>
    <form action="UserListCtl" method="post">
        <table>
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Login</th>
                <th>DOB</th>
            </tr>

            <%
                List list = (List) request.getAttribute("list");
                Iterator<UserBean> it = list.iterator();
                while (it.hasNext()) {
                    UserBean bean = it.next();
            %>
            <tr>
                <td><%=bean.getId()%></td>
                <td><%=bean.getFirstName()%></td>
                <td><%=bean.getLastName()%></td>
                <td><%=bean.getLogin()%></td>
                <td><%=bean.getDob()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </form>
</div>

<footer>
    <%@ include file="Footer.jsp"%>
</footer>

</body>
</html>
