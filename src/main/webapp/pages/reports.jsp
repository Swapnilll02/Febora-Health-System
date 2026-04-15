<%@ page import="java.util.List" %>
<%@ page import="com.febora.dao.ReportDAO" %>
<%@ page import="com.febora.model.Report" %>

<%
String email = (String) session.getAttribute("userEmail");

ReportDAO dao = new ReportDAO();
List<Report> list = dao.getReports(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>

/* ===== BODY ===== */
body{
    background:#F1F5F9;
    font-family:'Inter',sans-serif;
}

/* ===== MAIN ===== */
.main{
    max-width:1100px;
    margin:30px auto;
    padding:0 20px;
}

/* ===== TITLE ===== */
h2{
    margin-bottom:20px;
}

/* ===== CARD ===== */
.card{
    background:white;
    padding:25px;
    border-radius:16px;
    box-shadow:0 6px 20px rgba(0,0,0,0.05);
    margin-bottom:25px;
}

/* ===== UPLOAD ===== */
.upload-box{
    display:flex;
    align-items:center;
    gap:15px;
}

/* FILE INPUT */
input[type="file"]{
    padding:10px;
    border:1px dashed #CBD5E1;
    border-radius:10px;
    background:#F8FAFC;
}

/* BUTTON */
button{
    padding:8px 14px;
    border:none;
    border-radius:8px;
    color:white;
    cursor:pointer;
}

/* BUTTON COLORS */
.upload-btn{
    background:linear-gradient(135deg,#0EA5E9,#2563EB);
}

.delete-btn{
    background:#EF4444;
}

/* ===== REPORT ITEM ===== */
.report-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px;
    border-radius:12px;
    background:#F8FAFC;
    margin-bottom:10px;
    transition:0.2s;
}

.report-item:hover{
    background:#E2E8F0;
}

/* FILE NAME */
.report-name{
    font-weight:500;
}

/* VIEW BUTTON */
.view-btn{
    text-decoration:none;
    padding:6px 14px;
    background:#2563EB;
    color:white;
    border-radius:8px;
    font-size:14px;
}

/* ACTION BUTTONS */
.actions{
    display:flex;
    gap:10px;
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

<h2>Medical Reports</h2>

<!-- ===== UPLOAD ===== -->
<div class="card">

<h3>Upload Report</h3>

<form action="<%=request.getContextPath()%>/uploadReport"
      method="post"
      enctype="multipart/form-data">

<div class="upload-box">

<input type="file" name="report" required>

<button type="submit" class="upload-btn">Upload</button>

</div>

</form>

</div>

<!-- ===== REPORT LIST ===== -->
<div class="card">

<h3>Your Reports</h3>

<%
if(list.isEmpty()){
%>
<p class="empty">No reports uploaded yet.</p>
<%
}else{
    for(Report r : list){
%>

<div class="report-item">

<span class="report-name">
<%=r.getFileName()%>
</span>

<div class="actions">

<!-- VIEW -->
<a href="<%=request.getContextPath()%>/<%=r.getFilePath()%>"
   target="_blank"
   class="view-btn">
View
</a>

<!-- DELETE -->
<form action="<%=request.getContextPath()%>/deleteReport" method="post">
    <input type="hidden" name="id" value="<%=r.getId()%>">
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