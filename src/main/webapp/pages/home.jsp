<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.febora.dao.AppointmentDAO" %>
<%@ page import="com.febora.dao.ReportDAO" %>
<%@ page import="com.febora.dao.DoctorDAO" %>

<%
String userEmail = (String) session.getAttribute("userEmail");

if(userEmail == null){
    response.sendRedirect("login.jsp");
    return;
}

// ===== DAO OBJECTS =====
AppointmentDAO apDao = new AppointmentDAO();
ReportDAO rpDao = new ReportDAO();
DoctorDAO docDao = new DoctorDAO();

// ===== REAL DATA =====
int totalAppointments = apDao.getAppointmentCount(userEmail);
int totalReports = rpDao.getReportCount(userEmail);
int totalDoctors = docDao.getDoctorCount();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>

/* ===== BODY ===== */
body{
    background:#F1F5F9;
    font-family:'Inter',sans-serif;
}

/* ===== MAIN ===== */
.main{
    max-width:1200px;
    margin:30px auto;
    padding:0 20px;
}

/* ===== HERO ===== */
.hero{
    margin-bottom:25px;
}

.hero h1{
    font-size:26px;
    margin-bottom:5px;
}

.hero p{
    color:#64748B;
}

/* ===== STATS ===== */
.stats{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
    margin-top:20px;
}

/* STAT CARD */
.stat-card{
    background:white;
    padding:22px;
    border-radius:16px;
    box-shadow:0 6px 18px rgba(0,0,0,0.05);
    transition:0.2s;
}

.stat-card:hover{
    transform:translateY(-4px);
}

/* COLORS */
.blue{ border-left:5px solid #2563EB; }
.green{ border-left:5px solid #10B981; }
.purple{ border-left:5px solid #8B5CF6; }

/* NUMBER */
.stat-card h2{
    margin:0;
    color:#2563EB;
}

/* ===== ACTIONS ===== */
.actions{
    margin-top:30px;
}

.actions h3{
    margin-bottom:15px;
}

/* BUTTON GROUP */
.action-buttons{
    display:flex;
    gap:15px;
    flex-wrap:wrap;
}

/* BUTTON */
.action-btn{
    padding:12px 20px;
    border-radius:10px;
    text-decoration:none;
    color:white;
    font-weight:500;
    transition:0.2s;
}

/* BUTTON COLORS */
.primary{ background:#2563EB; }
.secondary{ background:#10B981; }
.tertiary{ background:#F59E0B; }

.action-btn:hover{
    transform:translateY(-2px);
}

</style>

</head>

<body>

<!-- COMMON LAYOUT -->
<%@ include file="../components/layout.jsp" %>

<!-- DASHBOARD -->
<div class="main">

    <!-- HERO -->
    <div class="hero">
        <h1>Welcome Back, <%= session.getAttribute("userName") %></h1>
        <p>Here’s what’s happening with your health dashboard today.</p>
    </div>

    <!-- STATS -->
    <div class="stats">

        <div class="stat-card blue">
            <h2><%= totalAppointments %></h2>
            <p>Total Appointments</p>
        </div>

        <div class="stat-card green">
            <h2><%= totalDoctors %></h2>
            <p>Doctors Available</p>
        </div>

        <div class="stat-card purple">
            <h2><%= totalReports %></h2>
            <p>Reports Uploaded</p>
        </div>

    </div>

    <!-- QUICK ACTIONS -->
    <div class="actions">

        <h3>Quick Actions</h3>

        <div class="action-buttons">

            <a href="<%=request.getContextPath()%>/pages/doctors.jsp"
               class="action-btn primary">
                Book Appointment
            </a>

            <a href="<%=request.getContextPath()%>/pages/appointments.jsp"
               class="action-btn secondary">
                View Appointments
            </a>

            <a href="<%=request.getContextPath()%>/pages/reports.jsp"
               class="action-btn tertiary">
                Upload Reports
            </a>

        </div>

    </div>

</div>

</body>
</html>