<%@ page import="java.util.List" %>
<%@ page import="com.febora.dao.AppointmentDAO" %>
<%@ page import="com.febora.model.Appointment" %>
<%@ page import="com.febora.dao.DoctorDAO" %>
<%@ page import="com.febora.model.Doctor" %>

<%
String email = (String) session.getAttribute("userEmail");

AppointmentDAO dao = new AppointmentDAO();
List<Appointment> list = dao.getUserAppointments(email);

DoctorDAO doctorDAO = new DoctorDAO();
List<Doctor> doctorList = doctorDAO.getAllDoctors();

String selectedDoctor = request.getParameter("doctor");
String editId = request.getParameter("editId");

String editDoctor = "";
String editDate = "";

if(editId != null){
    for(Appointment a : list){
        if(String.valueOf(a.getId()).equals(editId)){
            editDoctor = a.getDoctorName();
            editDate = a.getDate();
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointments</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>

body{
    background:#F1F5F9;
}

/* MAIN */
.main{
    max-width:1100px;
    margin:30px auto;
    padding:0 20px;
    font-family:'Inter',sans-serif;
}

/* CARD */
.card{
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:0 6px 18px rgba(0,0,0,0.06);
    margin-bottom:25px;
}

/* FORM */
.form-row{
    display:flex;
    gap:15px;
    flex-wrap:wrap;
}

input, select{
    padding:12px;
    border-radius:8px;
    border:1px solid #CBD5E1;
    flex:1;
    min-width:200px;
}

/* BUTTON */
button{
    padding:10px 16px;
    border:none;
    border-radius:8px;
    color:white;
    cursor:pointer;
}

/* COLORS */
.book-btn{
    background:linear-gradient(135deg,#0EA5E9,#2563EB);
}

.edit-btn{
    background:#F59E0B;
}

.delete-btn{
    background:#EF4444;
}

/* LIST */
.appointment-item{
    padding:15px;
    border-radius:10px;
    background:#F1F5F9;
    margin-bottom:10px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

/* EMPTY */
.empty{
    color:#64748B;
}

</style>

</head>

<body>

<%@ include file="../components/layout.jsp" %>

<div class="main">

<h2>Appointments</h2>

<!-- BOOK / EDIT -->
<div class="card">

<h3><%= (editId != null) ? "Edit Appointment" : "Book Appointment" %></h3>

<form action="<%=request.getContextPath()%>/bookAppointment" method="post">

<div class="form-row">

<!-- DROPDOWN -->
<select name="doctor" required>

<option value="">Select Doctor</option>

<%
for(Doctor d : doctorList){

boolean selected = false;

if(editId != null && editDoctor.equals(d.getName())){
    selected = true;
} else if(selectedDoctor != null && selectedDoctor.equals(d.getName())){
    selected = true;
}
%>

<option value="<%=d.getName()%>" <%= selected ? "selected" : "" %>>
    <%=d.getName()%> - <%=d.getSpecialization()%>
</option>

<%
}
%>

</select>

<!-- DATE -->
<input type="date" name="date" value="<%=editDate%>" required>

<!-- HIDDEN ID -->
<input type="hidden" name="id" value="<%=editId != null ? editId : "" %>">

<button type="submit" class="book-btn">
<%= (editId != null) ? "Update" : "Book" %>
</button>

</div>

</form>

</div>

<!-- LIST -->
<div class="card">

<h3>Your Appointments</h3>

<%
if(list.isEmpty()){
%>
<p class="empty">No appointments yet.</p>
<%
}else{
    for(Appointment a : list){
%>

<div class="appointment-item">

<div>
    <b><%=a.getDoctorName()%></b><br>
    <small><%=a.getDate()%></small>
</div>

<div style="display:flex; gap:10px;">

<!-- EDIT -->
<form action="appointments.jsp" method="get">
    <input type="hidden" name="editId" value="<%=a.getId()%>">
    <button type="submit" class="edit-btn">Edit</button>
</form>

<!-- DELETE -->
<form action="<%=request.getContextPath()%>/deleteAppointment" method="post">
    <input type="hidden" name="id" value="<%=a.getId()%>">
    <button type="submit" class="delete-btn">Delete</button>
</form>

</div>

</div>

<%
    }
}
%>

</div>

</div>

</body>
</html>