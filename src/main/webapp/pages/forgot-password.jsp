<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Febora Health | Reset Password</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/auth.css">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>

<body>

<div class="page">

    <!-- LEFT PANEL -->
    <div class="left-panel">

        <img src="<%=request.getContextPath()%>/images/medical-login.svg">

        <div class="brand-text">
            <h1>🏥 Febora Health</h1>
            <p>Password Recovery Portal</p>
        </div>

    </div>


    <!-- RIGHT PANEL -->
    <div class="right-panel">

        <div class="auth-card">

            <h2>Reset Password</h2>

            <form action="${pageContext.request.contextPath}/verifyEmail"
                  method="post">

                <input type="email"
                       name="email"
                       placeholder="Enter registered email"
                       required>

                <button type="submit">Verify Email</button>

            </form>

            <p class="switch">
                <a href="<%=request.getContextPath()%>/pages/login.jsp">
                    Back to Login
                </a>
            </p>

        </div>

    </div>

</div>

</body>
</html>