<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Febora Health | Patient Login</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/auth.css">

<!-- Professional Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

</head>

<body>

<div class="page">

    <!-- LEFT SIDE MEDICAL ILLUSTRATION -->
    <div class="left-panel">
        <img src="<%=request.getContextPath()%>/images/medical-login.svg"
             alt="Medical Illustration">
             
        <div class="brand-text">
            <h1>🏥 Febora Health</h1>
            <p>Secure Patient Access Portal</p>
        </div>
    </div>


    <!-- RIGHT SIDE LOGIN FORM -->
    <div class="right-panel">

        <div class="auth-card">

            <h2>Patient Login</h2>

            <% if(error != null) { %>
                <p class="error">
                    Invalid email or password. Please try again.
                </p>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post">

                <input type="email"
                       name="email"
                       placeholder="Email Address"
                       required>

                <input type="password"
                       name="password"
                       id="password"
                       placeholder="Password"
                       required>

                <div class="options">

                    <label class="show-pass">
                        <input type="checkbox" onclick="togglePassword()">
                        <span>Show Password</span>
                    </label>

                    <a href="<%=request.getContextPath()%>/pages/forgot-password.jsp">
                        Forgot Password?
                    </a>

                </div>

                <button type="submit">Login</button>

            </form>

            <p class="switch">
                New patient?
                <a href="<%=request.getContextPath()%>/pages/signup.jsp">
                    Create Account
                </a>
            </p>

        </div>

    </div>

</div>


<script>
function togglePassword(){
    const field = document.getElementById("password");
    field.type = field.type === "password" ? "text" : "password";
}
</script>

</body>
</html>