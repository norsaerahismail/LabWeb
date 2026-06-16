<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Guard: if no session, redirect to login
    String username  = (String) session.getAttribute("username");
    String firstname = (String) session.getAttribute("firstname");
    String lastname  = (String) session.getAttribute("lastname");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lab 6 - Main Dashboard</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: Arial, sans-serif;
            background: #ecf0f1;
            margin: 0;
            padding: 0;
        }
        header {
            background: #2c3e50;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 { margin: 0; font-size: 20px; }
        header a {
            color: #e74c3c;
            text-decoration: none;
            font-size: 14px;
            border: 1px solid #e74c3c;
            padding: 6px 14px;
            border-radius: 4px;
        }
        header a:hover { background: #e74c3c; color: white; }
        .hero {
            max-width: 700px;
            margin: 80px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            padding: 50px 60px;
            text-align: center;
        }
        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #2980b9;
            color: white;
            font-size: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
        }
        h2 { color: #2c3e50; margin-bottom: 10px; }
        .info-table {
            margin: 30px auto 0;
            border-collapse: collapse;
            width: 100%;
            max-width: 400px;
        }
        .info-table td {
            padding: 12px 20px;
            border-bottom: 1px solid #ecf0f1;
            font-size: 15px;
            text-align: left;
        }
        .info-table td:first-child {
            font-weight: bold;
            color: #7f8c8d;
            width: 40%;
        }
        .info-table td:last-child { color: #2c3e50; }
        .badge {
            display: inline-block;
            background: #27ae60;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 13px;
            margin-top: 8px;
        }
    </style>
</head>
<body>

<header>
    <h1>&#127760; Lab 6 - Web Application</h1>
    <a href="logout.jsp">Logout</a>
</header>

<div class="hero">
    <div class="avatar">&#128100;</div>
    <h2>Welcome back, <%= firstname %>!</h2>
    <span class="badge">&#10003; Logged In</span>

    <table class="info-table">
        <tr>
            <td>Username</td>
            <td><%= username %></td>
        </tr>
        <tr>
            <td>First Name</td>
            <td><%= firstname %></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><%= lastname %></td>
        </tr>
        <tr>
            <td>Full Name</td>
            <td><%= firstname %> <%= lastname %></td>
        </tr>
    </table>
</div>

</body>
</html>
