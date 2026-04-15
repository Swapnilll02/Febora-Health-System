<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Febora Health | Patient Registration</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/css/auth.css">

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

</head>

<body>

<div class="page">

    <!-- LEFT MEDICAL PANEL -->
    <div class="left-panel">

        <img src="<%=request.getContextPath()%>/images/medical-login.svg"
             alt="Medical Illustration">

        <div class="brand-text">
            <h1>🏥 Febora Health</h1>
            <p>Create your secure patient account</p>
        </div>

    </div>


    <!-- RIGHT FORM PANEL -->
    <div class="right-panel">

        <div class="auth-card">

            <h2>Patient Registration</h2>

            <form action="${pageContext.request.contextPath}/signup"
                  method="post"
                  onsubmit="return validatePassword()">

                <input type="text"
                       name="name"
                       placeholder="Full Name"
                       required>

                <input type="email"
                       name="email"
                       placeholder="Email Address"
                       required>

                <input type="password"
                       name="password"
                       id="password"
                       placeholder="Password"
                       required>

                <input type="password"
                       id="confirmPassword"
                       placeholder="Confirm Password"
                       required>

                <input type="tel"
                       name="phone"
                       placeholder="Phone Number"
                       required>

                <button type="submit">Create Account</button>

            </form>

            <p class="switch">
                Already registered?
                <a href="<%=request.getContextPath()%>/pages/login.jsp">
                    Login Here
                </a>
            </p>

        </div>

    </div>

</div>


<script>
function validatePassword(){

    const pass = document.getElementById("password").value;
    const confirm = document.getElementById("confirmPassword").value;

    if(pass !== confirm){
        alert("Passwords do not match!");
        return false;
    }

    return true;
}
</script>

</body>
</html>