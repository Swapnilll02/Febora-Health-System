<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.febora.dao.DoctorDAO" %>
<%@ page import="com.febora.model.Doctor" %>

<%
String user = (String) session.getAttribute("userEmail");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

DoctorDAO dao = new DoctorDAO();
List<Doctor> doctors = dao.getAllDoctors();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctors</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>

/* ===== MAIN ===== */
.main{
    max-width:1100px;
    margin:30px auto;
    padding:0 20px;
}

/* ===== GRID ===== */
.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:25px;
    margin-top:20px;
}

/* ===== CARD ===== */
.card{
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:0 6px 18px rgba(0,0,0,0.06);
    transition:0.2s;
}

.card:hover{
    transform:translateY(-4px);
}

/* ===== TEXT ===== */
.card h3{
    margin-bottom:10px;
    color:#2563EB;
}

.card p{
    margin:5px 0;
    font-size:14px;
}

/* ===== BUTTON ===== */
.book-btn{
    margin-top:15px;
    padding:12px;
    width:100%;
    border:none;
    border-radius:10px;
    font-size:14px;
    font-weight:600;
    cursor:pointer;

    background:linear-gradient(135deg,#0EA5E9,#2563EB);
    color:white;

    box-shadow:0 4px 10px rgba(0,0,0,0.15);
    transition:0.25s;
}

.book-btn:hover{
    transform:translateY(-2px);
    background:linear-gradient(135deg,#0284C7,#1D4ED8);
}

</style>

</head>

<body>

<!-- COMMON LAYOUT -->
<%@ include file="../components/layout.jsp" %>

<!-- PAGE CONTENT -->
<div class="main">

<h2>Available Doctors 👨‍⚕️</h2>

<div class="cards">

<%
for(Doctor d : doctors){
%>

<div class="card">

<h3><%= d.getName() %></h3>

<p><strong>Specialization:</strong> <%= d.getSpecialization() %></p>

<p><strong>Experience:</strong> <%= d.getExperience() %> years</p>

<p><strong>Hospital:</strong> <%= d.getHospital() %></p>

<form action="<%=request.getContextPath()%>/pages/appointments.jsp" method="get">

<input type="hidden" name="doctor" value="<%= d.getName() %>">

<button type="submit" class="book-btn">
    Book Appointment
</button>

</form>

</div>

<%
}
%>

</div>

</div>

</body>
</html>