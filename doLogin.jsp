<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lab6.com.User, lab6.com.UserDAO" %>
<%@ page errorPage="errorUser.jsp" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    User loggedInUser = null;

    if (username != null && password != null &&
        !username.trim().isEmpty() && !password.trim().isEmpty()) {

        UserDAO userDAO = new UserDAO();
        loggedInUser = userDAO.validateLogin(username.trim(), password.trim());
    }

    if (loggedInUser != null) {
        // Store user info in session
        session.setAttribute("username",  loggedInUser.getUsername());
        session.setAttribute("firstname", loggedInUser.getFirstname());
        session.setAttribute("lastname",  loggedInUser.getLastname());

        response.sendRedirect("main.jsp");
    } else {
        response.sendRedirect("login.jsp?error=1");
    }
%>
