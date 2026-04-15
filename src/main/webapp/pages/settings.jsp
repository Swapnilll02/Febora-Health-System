<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.febora.dao.UserDAO" %>
<%@ page import="com.febora.model.User" %>

<%
String email = (String) session.getAttribute("userEmail");

if(email == null){
    response.sendRedirect("login.jsp");
    return;
}

UserDAO dao = new UserDAO();
User user = dao.getUserByEmail(email);

String success = request.getParameter("success");
String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>

/* ===== MAIN ===== */
.main{
    max-width:900px;
    margin:30px auto;
    padding:0 20px;
}

/* ===== CARD ===== */
.card{
    background:white;
    padding:30px;
    border-radius:14px;
    box-shadow:0 6px 18px rgba(0,0,0,0.06);
    margin-top:20px;
}

/* ===== FORM ===== */
input{
    width:100%;
    padding:12px;
    margin-top:8px;
    margin-bottom:18px;
    border-radius:8px;
    border:1px solid #CBD5E1;
}

/* ===== BUTTON ===== */
button{
    background:#14B8A6;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:8px;
    cursor:pointer;
}

button:hover{
    background:#0D9488;
}

/* ===== MESSAGE ===== */
.success{
    color:green;
}

.error{
    color:red;
}

</style>

</head>

<body>

<%@ include file="../components/layout.jsp" %>

<div class="main">

<h2>Account Settings</h2>

<% if("profile".equals(success)){ %>
<p class="success">Profile updated successfully.</p>
<% } %>

<% if("password".equals(success)){ %>
<p class="success">Password changed successfully.</p>
<% } %>

<% if("profile".equals(error)){ %>
<p class="error">Profile update failed.</p>
<% } %>

<% if("password".equals(error)){ %>
<p class="error">Password change failed.</p>
<% } %>

<!-- PROFILE -->

<div class="card">

<h3>Profile Information</h3>

<form action="<%=request.getContextPath()%>/updateProfile" method="post">

<label>Full Name</label>
<input type="text" name="name" value="<%=user.getName()%>" required>

<label>Email</label>
<input type="email" value="<%=user.getEmail()%>" readonly>

<!-- IMPORTANT FIX -->
<input type="hidden" name="email" value="<%=user.getEmail()%>">

<label>Phone Number</label>
<input type="text" name="phone" value="<%=user.getPhone()%>" required>

<button type="submit">Update Profile</button>

</form>

</div>

<!-- PASSWORD -->

<div class="card">

<h3>Change Password</h3>

<form action="<%=request.getContextPath()%>/changePassword" method="post">

<label>Current Password</label>
<input type="password" name="currentPassword" required>

<label>New Password</label>
<input type="password" name="newPassword" required>

<label>Confirm Password</label>
<input type="password" name="confirmPassword" required>

<button type="submit">Change Password</button>

</form>

</div>

</div>

</body>
</html>