<style>

/* ===== RESET ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Inter',sans-serif;
    background:#F1F5F9;
}

/* ===== NAVBAR ===== */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:14px 30px;
    background:white;
    box-shadow:0 2px 8px rgba(0,0,0,0.05);
}

/* LEFT SIDE */
.nav-left{
    display:flex;
    align-items:center;
    gap:14px;
}

/* HAMBURGER */
.menu-btn{
    font-size:22px;
    cursor:pointer;
    padding:6px 10px;
    border-radius:8px;
    transition:0.2s;
}

.menu-btn:hover{
    background:#E2E8F0;
}

/* LOGO */
.logo{
    font-size:20px;
    font-weight:700;
    color:#2563EB;
    text-decoration:none;
    letter-spacing:0.5px;
}

/* RIGHT SIDE */
.nav-right{
    display:flex;
    align-items:center;
    gap:15px;
    font-size:14px;
}

/* LOGOUT */
.logout{
    background:#EF4444;
    color:white;
    padding:8px 16px;
    border-radius:8px;
    text-decoration:none;
    transition:0.2s;
}

.logout:hover{
    background:#dc2626;
}

/* ===== SIDEBAR ===== */
.sidebar{
    position:fixed;
    top:0;
    left:-260px;
    width:260px;
    height:100%;
    background:#0F172A;
    color:white;
    padding:25px 20px;
    transition:0.3s ease;
    z-index:1000;
}

/* OPEN */
.sidebar.active{
    left:0;
}

/* TITLE */
.sidebar h2{
    margin-bottom:30px;
    font-size:20px;
}

/* LINKS */
.sidebar a{
    display:block;
    color:#cbd5f5;
    text-decoration:none;
    padding:12px 14px;
    border-radius:8px;
    margin-bottom:10px;
    transition:0.2s;
    font-size:14px;
}

.sidebar a:hover{
    background:#1E293B;
    padding-left:18px;
}

/* ===== OVERLAY ===== */
.overlay{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.4);
    display:none;
    z-index:900;
}

.overlay.active{
    display:block;
}

/* ===== MAIN ===== */
.main{
    max-width:1100px;
    margin:30px auto;
    padding:0 20px;
}

</style>

<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">

    <h2>Febora</h2>

    <a href="<%=request.getContextPath()%>/pages/home.jsp">Dashboard</a>
    <a href="<%=request.getContextPath()%>/pages/doctors.jsp">Doctors</a>
	<a href="<%=request.getContextPath()%>/pages/appointments.jsp">Appointments</a>
	<a href="<%=request.getContextPath()%>/pages/reports.jsp">Reports</a>
    <a href="<%=request.getContextPath()%>/pages/settings.jsp">Settings</a>

</div>

<!-- OVERLAY -->
<div class="overlay" id="overlay" onclick="toggleSidebar()"></div>

<!-- NAVBAR -->
<div class="navbar">

    <!-- LEFT -->
    <div class="nav-left">
        <span class="menu-btn" onclick="toggleSidebar()">&#9776;</span>

        <a href="<%=request.getContextPath()%>/pages/home.jsp" class="logo">
            Febora
        </a>
    </div>

    <!-- RIGHT -->
    <div class="nav-right">
        <span>Welcome, <b><%= session.getAttribute("userName") %></b></span>

        <a href="<%=request.getContextPath()%>/logout" class="logout">
            Logout
        </a>
    </div>

</div>

<script>
function toggleSidebar(){
    document.getElementById("sidebar").classList.toggle("active");
    document.getElementById("overlay").classList.toggle("active");
}
</script>