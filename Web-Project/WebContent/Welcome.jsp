<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>

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

    .welcome-container {
        background-color: #fff7f8;
        margin-top: 80px;
        padding: 50px 60px;
        border-radius: 18px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        text-align: center;
    }

    h1 {
        color: #4a2b2b;
        font-size: 32px;
        letter-spacing: 1px;
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

    <div class="welcome-container">
        <h1>Welcome to my website</h1>
    </div>

    <footer>
        <%@ include file="Footer.jsp"%>
    </footer>

</body>
</html>
