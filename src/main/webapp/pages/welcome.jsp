<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Febora Health | Welcome</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/auth.css">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

</head>

<body>

<div class="page">

    <!-- LEFT MEDICAL PANEL -->
    <div class="left-panel">

        <img src="<%=request.getContextPath()%>/images/medical-login.svg">

        <div class="brand-text">
            <h1>🏥 Febora Health</h1>
            <p>Secure Patient Identity & Access Portal</p>
        </div>

    </div>


    <!-- RIGHT ACTION PANEL -->
    <div class="right-panel">

        <div class="auth-card">

            <h2>Welcome</h2>
            <p style="text-align:center;color:#64748B;">
                Access your healthcare workspace securely.
            </p>

            <a href="<%=request.getContextPath()%>/pages/login.jsp">
                <button>Patient Login</button>
            </a>

            <a href="<%=request.getContextPath()%>/pages/signup.jsp">
                <button style="background:white;
                               color:#14B8A6;
                               border:1px solid #14B8A6;">
                    Create Account
                </button>
            </a>

        </div>

    </div>

</div>

</body>
</html>