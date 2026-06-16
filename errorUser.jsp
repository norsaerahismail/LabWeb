<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lab 6 - Error</title>
    <style>
        body { font-family: Arial, sans-serif; background: #fdecea;
               display: flex; justify-content: center; align-items: center;
               min-height: 100vh; margin: 0; }
        .box { background: white; padding: 40px 50px; border-radius: 10px;
               box-shadow: 0 4px 16px rgba(0,0,0,0.1); max-width: 500px; text-align: center; }
        h2   { color: #c0392b; }
        p    { color: #555; font-size: 14px; }
        .msg { background: #f8d7da; border: 1px solid #f5c6cb; color: #721c24;
               padding: 12px; border-radius: 5px; font-size: 13px; text-align: left; word-break: break-word; }
        a    { color: #2980b9; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="box">
    <h2>&#9888; An Error Occurred</h2>
    <p>Something went wrong while processing your request. Details below:</p>
    <div class="msg">
        <strong>Error:</strong>
        <%= exception != null ? exception.getMessage() : "Unknown error" %>
    </div>
    <br>
    <p>
        <a href="insertUser.html">&larr; Back to Registration</a> &nbsp;|&nbsp;
        <a href="login.jsp">Go to Login</a>
    </p>
    <p style="font-size:12px; color:#aaa;">
        If this error persists, ensure XAMPP (Apache + MySQL) is running<br>
        and the MySQL Connector/J JAR is added to the project libraries.
    </p>
</div>
</body>
</html>
