<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lab6.com.User, lab6.com.UserDAO" %>
<%@ page errorPage="errorUser.jsp" %>
<jsp:useBean id="newUser" class="lab6.com.User" scope="page" />
<jsp:setProperty name="newUser" property="username"  param="username" />
<jsp:setProperty name="newUser" property="password"  param="password" />
<jsp:setProperty name="newUser" property="firstname" param="firstname" />
<jsp:setProperty name="newUser" property="lastname"  param="lastname" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lab 6 - Process Registration</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f4f8;
               display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .box { background: #fff; padding: 40px; border-radius: 10px;
               box-shadow: 0 4px 12px rgba(0,0,0,0.1); width: 420px; text-align: center; }
        h2   { color: #27ae60; }
        p    { color: #34495e; font-size: 15px; }
        a    { color: #2980b9; text-decoration: none; }
        a:hover { text-decoration: underline; }
        .err { color: #c0392b; }
    </style>
</head>
<body>
<div class="box">
<%
    UserDAO userDAO = new UserDAO();

    boolean missingField = (newUser.getUsername()  == null || newUser.getUsername().trim().isEmpty()  ||
                             newUser.getPassword()  == null || newUser.getPassword().trim().isEmpty()  ||
                             newUser.getFirstname() == null || newUser.getFirstname().trim().isEmpty() ||
                             newUser.getLastname()  == null || newUser.getLastname().trim().isEmpty());

    if (missingField) {
%>
    <h2 class="err">Registration Failed</h2>
    <p>All fields are required. Please go back and fill in all details.</p>
    <p><a href="insertUser.html">&larr; Back to Registration</a></p>
<%
    } else if (userDAO.usernameExists(newUser.getUsername().trim())) {
%>
    <h2 class="err">Username Taken</h2>
    <p>The username <strong><%= newUser.getUsername() %></strong> is already registered.</p>
    <p><a href="insertUser.html">&larr; Try a different username</a></p>
<%
    } else {
        boolean success = userDAO.insertUser(newUser);
        if (success) {
%>
    <h2>Registration Successful! &#10003;</h2>
    <p>Welcome, <strong><%= newUser.getFirstname() %> <%= newUser.getLastname() %></strong>!</p>
    <p>Your account (<em><%= newUser.getUsername() %></em>) has been created.</p>
    <p><a href="login.jsp">Proceed to Login &rarr;</a></p>
<%
        } else {
%>
    <h2 class="err">Registration Failed</h2>
    <p>An error occurred. Please try again.</p>
    <p><a href="insertUser.html">&larr; Back</a></p>
<%
        }
    }
%>
</div>
</body>
</html>
