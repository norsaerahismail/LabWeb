<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lab 6 - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 380px;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #34495e;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .btn-row {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }
        input[type="submit"], input[type="reset"] {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }
        input[type="submit"] {
            background-color: #27ae60;
            color: white;
        }
        input[type="submit"]:hover { background-color: #1e8449; }
        input[type="reset"] {
            background-color: #95a5a6;
            color: white;
        }
        .error-msg {
            background: #fdecea;
            border: 1px solid #e74c3c;
            color: #c0392b;
            padding: 10px 14px;
            border-radius: 5px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14px;
        }
        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        .register-link a { color: #27ae60; text-decoration: none; }
        .register-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>&#128274; User Login</h2>

        <%-- Show error message if redirected from doLogin.jsp with error --%>
        <%
            String errorMsg = request.getParameter("error");
            if (errorMsg != null && !errorMsg.isEmpty()) {
        %>
        <div class="error-msg">&#10006; Invalid username or password..!</div>
        <%  } %>

        <form action="doLogin.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"
                   maxlength="15" required placeholder="Enter your username">

            <label for="password">Password:</label>
            <input type="password" id="password" name="password"
                   maxlength="10" required placeholder="Enter your password">

            <div class="btn-row">
                <input type="submit" value="Login">
                <input type="reset"  value="Clear">
            </div>
        </form>
        <div class="register-link">
            Don't have an account? <a href="insertUser.html">Register here</a>
        </div>
    </div>
</body>
</html>
